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

### Platform-Specific Setup

#### Windows Installation

**Option 1: Docker Desktop (Recommended for Beginners)**

1. **Download Docker Desktop:**
   - Go to [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
   - Download the installer
   - Run the installer and follow the wizard

2. **Enable WSL 2** (if prompted):
   - Open PowerShell as Administrator
   - Run: `wsl --install`
   - Restart your computer

3. **Install Git:**
   - Download from [git-scm.com](https://git-scm.com/download/win)
   - Run installer with default options
   - Verify: Open PowerShell and run `git --version`

4. **Open PowerShell or Command Prompt:**
   - Press `Win + X` → Select "Windows PowerShell" or "Terminal"
   - Or search for "PowerShell" in Start menu

**Option 2: WSL 2 + Docker (Advanced Users)**

1. Install WSL 2 with Ubuntu
2. Install Docker inside WSL
3. Follow Linux instructions below

#### macOS Installation

1. **Download Docker Desktop:**
   - Go to [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
   - Choose your chip: Apple Silicon (M1/M2/M3) or Intel
   - Download and install the .dmg file
   - Drag Docker to Applications folder
   - Open Docker from Applications

2. **Install Git** (usually pre-installed):
   - Open Terminal (Applications → Utilities → Terminal)
   - Check if installed: `git --version`
   - If not installed, macOS will prompt you to install Command Line Tools

3. **Optional - Install Homebrew** (makes life easier):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   Then install Docker via Homebrew (alternative):
   ```bash
   brew install --cask docker
   ```

#### Linux Installation

**Ubuntu/Debian:**

1. **Install Docker:**
   ```bash
   # Update package index
   sudo apt-get update
   
   # Install prerequisites
   sudo apt-get install ca-certificates curl gnupg
   
   # Add Docker's official GPG key
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   sudo chmod a+r /etc/apt/keyrings/docker.gpg
   
   # Add repository
   echo \
     "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
     "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   
   # Install Docker
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   
   # Add your user to docker group (to run without sudo)
   sudo usermod -aG docker $USER
   
   # Log out and back in for group changes to take effect
   ```

2. **Install Git:**
   ```bash
   sudo apt-get install git
   ```

**Fedora/RHEL/CentOS:**

```bash
# Install Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

# Install Git
sudo dnf install git
```

**Arch Linux:**

```bash
# Install Docker
sudo pacman -S docker docker-compose

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

# Install Git
sudo pacman -S git
```

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
git clone https://github.com/AIchemist87/mantisbt-docker.git

# Navigate to the project directory
cd mantisbt-docker
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

## How to Use MantisBT

### Basic Operations

#### Creating Your First Issue

1. **Log in** to http://localhost:8989
2. Click **"Report Issue"** (top menu)
3. Fill in the form:
   - **Category:** Choose or create a category
   - **Reproducibility:** How often does it happen?
   - **Severity:** How serious is it?
   - **Priority:** How urgent?
   - **Summary:** Brief description
   - **Description:** Detailed explanation
4. Click **"Submit Issue"**

#### Viewing Issues

1. Click **"View Issues"** (top menu)
2. Use filters to find specific issues:
   - By status (new, assigned, resolved, closed)
   - By priority
   - By project
   - By assigned user
3. Click on any issue to see details

#### Updating an Issue

1. Open the issue
2. Add a note in the **"Add Note"** section
3. Change status using the status dropdown
4. Assign to a user
5. Click **"Update Information"** to save

#### Managing Projects

1. Go to **Manage → Manage Projects**
2. Click **"Create New Project"**
3. Fill in:
   - Project Name
   - Status (public/private)
   - Description
4. Click **"Add Project"**

#### Managing Users

1. Go to **Manage → Manage Users**
2. Click **"Create New Account"**
3. Fill in user details
4. Set access level:
   - **Viewer:** Can only view issues
   - **Reporter:** Can report new issues
   - **Updater:** Can update issues
   - **Developer:** Can be assigned issues
   - **Manager:** Can manage project
   - **Administrator:** Full access
5. Click **"Create User"**

### Common Tasks

#### Generate Reports

1. Go to **"View Issues"**
2. Apply filters for the data you want
3. Click **"Print Reports"** (bottom of page)
4. Choose report type:
   - Summary
   - Detailed
   - Statistics

#### Import Test Data

1. Go to **Manage → Manage Plugins**
2. Install **MantisSeeder**
3. Go to **Manage → MantisSeeder**
4. Choose number of issues (1-100)
5. Click **"Import Issues from MantisBT.org"**

## Daily Operations

### Starting Your Work Day

```bash
# Navigate to project directory
cd mantisbt-docker

# Start services
docker-compose up -d

# Verify services are running
docker-compose ps

# Open browser to http://localhost:8989
```

### During the Day

- All your work is automatically saved in the database
- You can close your browser anytime
- Services keep running in the background
- Access MantisBT anytime at http://localhost:8989

### Ending Your Work Day

**Option 1: Leave it running** (uses minimal resources)
```bash
# Just close your browser
# Services continue running in background
```

**Option 2: Stop services** (frees up resources)
```bash
cd mantisbt-docker
docker-compose down
# Your data is saved and will be there tomorrow
```

### Restarting the System

**If something seems wrong:**
```bash
# Restart all services
docker-compose restart

# Or restart just MantisBT
docker-compose restart mantis

# Or stop and start fresh
docker-compose down
docker-compose up -d
```

**If you need to reset everything:**
```bash
# WARNING: This deletes all your data!
docker-compose down
rm -rf mysql/
# Then follow installation steps again
```

### Regular Maintenance

**Weekly Backup:**
```bash
# Create a backup
docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > backup_weekly.sql

# Or with timestamp
docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > "backup_$(date +%Y%m%d).sql"
```

**Check Disk Space:**
```bash
# Check database size
docker-compose exec db mariadb -u mantisbt -pmantisbt bugtracker -e "
SELECT 
  table_schema AS 'Database',
  ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size (MB)'
FROM information_schema.TABLES
WHERE table_schema = 'bugtracker'
GROUP BY table_schema;
"
```

**View Logs:**
```bash
# View all logs
docker-compose logs

# Follow logs in real-time
docker-compose logs -f

# View only MantisBT logs
docker-compose logs mantis

# View only database logs
docker-compose logs db
```

### Updating MantisBT

```bash
# Backup first!
docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > backup_before_update.sql

# Pull latest changes
git pull

# Rebuild containers
docker-compose down
docker-compose up -d --build

# Check for database upgrades in MantisBT admin panel
```

## Next Steps

After successful installation:

1. **Read the User Guide:** Familiarize yourself with MantisBT features
2. **Review Development Guide:** See [DEVELOPMENT.md](DEVELOPMENT.md) for development workflow
3. **Configure Your Environment:** Customize MantisBT to your needs
4. **Create Your First Project:** Start tracking issues!
5. **Invite Your Team:** Create user accounts for your team members

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

