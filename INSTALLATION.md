# Installation Guide

Complete step-by-step instructions for installing and configuring this MantisBT development environment.

## Table of Contents

- [System Requirements](#system-requirements)
- [Pre-Installation](#pre-installation)
- [Installation Steps](#installation-steps)
- [Post-Installation Configuration](#post-installation-configuration)
- [Verification](#verification)
- [Initial Setup](#initial-setup)
- [Troubleshooting](#troubleshooting)

## System Requirements

### Minimum Requirements

- **Operating System:** Windows 10/11, macOS 10.14+, or Linux (Ubuntu 20.04+)
- **RAM:** 4 GB minimum, 8 GB recommended
- **Disk Space:** 5 GB free space
- **Docker:** Version 20.10 or higher
- **Docker Compose:** Version 2.0 or higher

### Software Prerequisites

1. **Docker Desktop**
   - [Windows](https://docs.docker.com/desktop/install/windows-install/)
   - [macOS](https://docs.docker.com/desktop/install/mac-install/)
   - [Linux](https://docs.docker.com/desktop/install/linux-install/)

2. **Git**
   - [Download Git](https://git-scm.com/downloads)

3. **Node.js** (Optional, for running tests)
   - Version 16 or higher
   - [Download Node.js](https://nodejs.org/)

## Pre-Installation

### 1. Verify Docker Installation

```bash
# Check Docker version
docker --version
# Expected output: Docker version 20.10.x or higher

# Check Docker Compose version
docker-compose --version
# Expected output: Docker Compose version 2.x.x or higher
```

### 2. Verify Docker is Running

```bash
# Test Docker
docker run hello-world
```

If you see "Hello from Docker!", Docker is working correctly.

### 3. Check Available Ports

Ensure ports 8989 and 3306 are not in use:

```bash
# On macOS/Linux
lsof -i :8989
lsof -i :3306

# On Windows (PowerShell)
netstat -ano | findstr :8989
netstat -ano | findstr :3306
```

If these commands return nothing, the ports are free.

## Installation Steps

### Step 1: Clone the Repository

```bash
# Clone the repository
git clone <your-repository-url>

# Navigate to the project directory
cd mantisbt
```

### Step 2: Create Configuration File

Copy the configuration template:

```bash
cp config/config_inc.php.template config/config_inc.php
```

### Step 3: Generate Secure Credentials

#### Generate Crypto Salt

```bash
# On macOS/Linux
openssl rand -base64 32

# On Windows (PowerShell)
[Convert]::ToBase64String((1..32 | ForEach-Object { Get-Random -Maximum 256 }))
```

Copy the generated string.

#### Generate Database Password (Optional)

For production use, generate a strong database password:

```bash
# On macOS/Linux
openssl rand -base64 16

# On Windows (PowerShell)
[Convert]::ToBase64String((1..16 | ForEach-Object { Get-Random -Maximum 256 }))
```

### Step 4: Configure MantisBT

Edit `config/config_inc.php`:

```bash
# Use your preferred editor
nano config/config_inc.php
# or
code config/config_inc.php
# or
vim config/config_inc.php
```

Update these critical values:

```php
# Database password (must match docker-compose.yml)
$g_db_password = 'mantisbt';  # Change this for production

# Paste your generated crypto salt
$g_crypto_master_salt = 'your-generated-salt-here';

# Set your timezone (optional)
$g_default_timezone = 'UTC';  # e.g., 'America/New_York', 'Europe/London', etc.

# Update email addresses (optional)
$g_webmaster_email = 'webmaster@example.com';
$g_from_email = 'noreply@example.com';
$g_return_path_email = 'bounce@example.com';
```

Save and close the file.

### Step 5: Update Docker Compose (If You Changed Password)

If you changed the database password, update `docker-compose.yml`:

```yaml
services:
  db:
    environment:
      MYSQL_PASSWORD: mantisbt  # Change this to match config_inc.php
```

### Step 6: Start Database Service

Start only the database first to ensure it initializes properly:

```bash
docker-compose up -d db
```

Wait for the database to initialize (about 10-15 seconds):

```bash
# Watch database logs
docker-compose logs -f db

# Press Ctrl+C when you see "ready for connections"
```

### Step 7: Import Initial Database

Import the provided database dump:

```bash
# Import the database
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < database/mantisbt.sql
```

**Note:** If you changed the database password, replace `-pmantisbt` with `-p<your-password>`.

You should see output indicating tables are being created.

### Step 8: Start All Services

```bash
docker-compose up -d
```

### Step 9: Verify Services are Running

```bash
docker-compose ps
```

You should see both `db` and `mantis` services with status "Up".

## Post-Installation Configuration

### Step 1: Access MantisBT

Open your web browser and navigate to:

```
http://localhost:8989
```

You should see the MantisBT login page.

### Step 2: Log In as Administrator

Use the default administrator credentials:

- **Username:** `administrator`
- **Password:** `root`

⚠️ **Important:** Change the administrator password immediately after first login!

### Step 3: Run System Checks

1. Navigate to **Manage** (gear icon in top-right)
2. Click **System Checks** in the left menu
3. Review all checks to ensure everything is configured correctly
4. Address any warnings or errors shown

### Step 4: Change Administrator Password

1. Click on **administrator** (top-right corner)
2. Go to **Preferences**
3. Change password in the **Account** section
4. Save changes

### Step 5: Configure Email (Optional)

If you want to enable email notifications:

1. Edit `config/config_inc.php`
2. Add SMTP configuration:

```php
$g_phpMailer_method = PHPMAILER_METHOD_SMTP;
$g_smtp_host = 'smtp.example.com';
$g_smtp_port = 587;
$g_smtp_username = 'your-email@example.com';
$g_smtp_password = 'your-email-password';
$g_smtp_connection_mode = 'tls';
$g_administrator_email = 'admin@example.com';
```

3. Restart MantisBT: `docker-compose restart mantis`

## Initial Setup

### Create a Project

1. Go to **Manage → Manage Projects**
2. Click **Create New Project**
3. Fill in project details:
   - **Project Name:** e.g., "My First Project"
   - **Status:** public or private
   - **Description:** Brief description
4. Click **Add Project**

### Create Additional Users

1. Go to **Manage → Manage Users**
2. Click **Create New Account**
3. Fill in user details
4. Assign appropriate access level
5. Click **Create User**

### Install MantisSeeder Plugin (Optional)

To use the test data seeding plugin:

1. Go to **Manage → Manage Plugins**
2. Find **MantisSeeder** in the available plugins list
3. Click **Install**
4. The plugin is now active

To use it:
1. Go to **Manage → MantisSeeder**
2. Choose number of issues to import (1-100)
3. Optionally check "Create test projects"
4. Click **Import Issues from MantisBT.org**

## Verification

### Verify Installation Checklist

- [ ] Docker containers are running: `docker-compose ps`
- [ ] MantisBT is accessible at http://localhost:8989
- [ ] Can log in with administrator account
- [ ] System checks show no critical errors
- [ ] Can create a new issue
- [ ] Can create a new project
- [ ] Database persists after container restart

### Test Database Persistence

```bash
# Create a test issue in MantisBT web interface
# Then restart containers
docker-compose restart

# Verify the issue still exists after restart
```

### Test Basic Functionality

1. **Create an Issue:**
   - Go to **Report Issue**
   - Fill in required fields
   - Submit issue

2. **View Issues:**
   - Go to **View Issues**
   - Verify your issue appears

3. **Update an Issue:**
   - Click on your issue
   - Add a note or change status
   - Verify changes are saved

## Troubleshooting

### Issue: Port 8989 Already in Use

**Solution:**

```bash
# Option 1: Find and stop the conflicting service
lsof -i :8989  # macOS/Linux
netstat -ano | findstr :8989  # Windows

# Option 2: Change the port in docker-compose.yml
# Change "8989:80" to "8990:80" (or any free port)
# Then update $g_path in config/config_inc.php to http://localhost:8990/
```

### Issue: Database Connection Failed

**Error:** "Database connection failed" or similar

**Solution:**

1. Verify database container is running:
   ```bash
   docker-compose ps db
   ```

2. Check database credentials in `config/config_inc.php`:
   ```php
   $g_hostname = 'db';  # Must be 'db' (Docker service name)
   $g_db_username = 'mantisbt';
   $g_db_password = 'mantisbt';  # Must match docker-compose.yml
   ```

3. Test database connection:
   ```bash
   docker-compose exec db mariadb -u mantisbt -pmantisbt -e "SELECT 1"
   ```

4. Restart services:
   ```bash
   docker-compose restart
   ```

### Issue: Tables Don't Exist

**Error:** "Table 'bugtracker.mantis_user_table' doesn't exist"

**Solution:** The database wasn't imported correctly.

```bash
# Re-import the database
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < database/mantisbt.sql
```

### Issue: Permission Denied Errors

**Error:** Various "permission denied" errors

**Solution:**

```bash
# Fix file permissions
docker-compose exec mantis chown -R www-data:www-data /var/www/html/custom
docker-compose exec mantis chown -R www-data:www-data /var/www/html/plugins
```

### Issue: Can't Upload Attachments

**Solution:**

1. Check upload directory permissions
2. Verify PHP upload limits in `docker-compose.yml`:
   ```yaml
   PHP_MAX_UPLOAD_SIZE: 16M
   PHP_POST_MAX_SIZE: 16M
   ```
3. Restart: `docker-compose restart mantis`

### Issue: Docker Compose Version Error

**Error:** "version is obsolete" warning

**Solution:** This is just a warning and can be ignored, or remove the `version:` line from `docker-compose.yml`.

### Issue: Crypto Salt Warning

**Error:** "SYSTEM WARNING: Cryptography master salt is not set"

**Solution:**

1. Generate a new salt: `openssl rand -base64 32`
2. Add to `config/config_inc.php`:
   ```php
   $g_crypto_master_salt = 'your-generated-salt-here';
   ```
3. Restart: `docker-compose restart mantis`

### Issue: Need to Reset Everything

If you want to start completely fresh:

```bash
# Stop all services
docker-compose down

# Remove all data (WARNING: This deletes everything!)
rm -rf mysql/

# Start fresh
docker-compose up -d db
sleep 15
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < database/mantisbt.sql
docker-compose up -d
```

## Next Steps

After successful installation:

1. **Read the User Guide:** Familiarize yourself with MantisBT features
2. **Review Development Guide:** See [DEVELOPMENT.md](DEVELOPMENT.md) for development workflow
3. **Configure Your Environment:** Customize MantisBT to your needs
4. **Create Your First Project:** Start tracking issues!

## Getting Help

If you encounter issues not covered here:

1. Check the [DEVELOPMENT.md](DEVELOPMENT.md) troubleshooting section
2. Review [MantisBT documentation](https://www.mantisbt.org/documentation.php)
3. Check [MantisBT forums](https://www.mantisbt.org/forums/)
4. Open an issue in this repository

## Security Checklist for Production

⚠️ **This setup is primarily for development. For production:**

- [ ] Change all default passwords
- [ ] Use strong database password
- [ ] Generate new crypto master salt
- [ ] Configure HTTPS
- [ ] Set up proper backups
- [ ] Configure email properly
- [ ] Review and harden security settings
- [ ] Don't expose database port to internet
- [ ] Use environment variables for secrets
- [ ] Enable firewall rules
- [ ] Keep Docker images updated
- [ ] Monitor logs regularly

## Uninstallation

To completely remove the installation:

```bash
# Stop and remove containers
docker-compose down

# Remove all data
rm -rf mysql/

# Remove configuration (backup first!)
rm config/config_inc.php

# Remove the entire directory
cd ..
rm -rf mantisbt/
```

