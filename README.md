# MantisBT Development Environment

A Dockerized MantisBT (Bug Tracking System) setup with the MantisSeeder plugin for development and testing purposes.

## Overview

This project provides a complete MantisBT environment running in Docker containers with:
- **MantisBT** - Open source issue tracker
- **MariaDB 12** - Database backend
- **MantisSeeder Plugin** - Imports real test data from mantisbt.org for development

## Features

- 🐳 Fully containerized with Docker Compose
- 🔧 Pre-configured with sensible defaults
- 📊 Includes sample database with test data
- 🌱 MantisSeeder plugin for importing realistic test issues
- ⚙️ Easy configuration management

## Prerequisites

- [Docker](https://www.docker.com/get-started) (version 20.10 or higher)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0 or higher)
- Git

## Quick Start

> **New to Docker?** Don't worry! Follow these steps carefully, and you'll have MantisBT running in minutes.

### 1. Clone the Repository

```bash
git clone https://github.com/AIchemist87/mantisbt-docker.git
cd mantisbt-docker
```

**Platform Notes:**
- **Windows:** Use PowerShell, Command Prompt, or Git Bash
- **macOS/Linux:** Use Terminal

### 2. Configure MantisBT

Copy the configuration template and customize it:

```bash
cp config/config_inc.php.template config/config_inc.php
```

Edit `config/config_inc.php` and update the following values:

```php
# Generate a secure password
$g_db_password = 'your_secure_password';

# Generate a secure salt using: openssl rand -base64 32
$g_crypto_master_salt = 'your_generated_salt_here';

# Set your timezone (optional)
$g_default_timezone = 'UTC';
```

**Note:** Make sure to match the `$g_db_password` with the `MYSQL_PASSWORD` in `docker-compose.yml`.

### 3. Import the Database

The project includes a pre-configured database dump with sample data:

```bash
# Start only the database container
docker-compose up -d db

# Wait a few seconds for the database to initialize
sleep 10

# Import the database
docker-compose exec -T db mariadb -u mantisbt -p<your_password> bugtracker < database/mantisbt.sql
```

### 4. Start the Services

```bash
docker-compose up -d
```

### 5. Access MantisBT

Open your browser and navigate to:

```
http://localhost:8989
```

**Default Admin Credentials:**
- Username: `administrator`
- Password: `root`

## Project Structure

```
mantisbt/
├── admin/              # MantisBT admin pages
├── config/             # Configuration files
│   ├── config_inc.php.template  # Configuration template
│   └── config_inc.php  # Your local config (not in Git)
├── custom/             # Custom MantisBT files
├── database/           # Database dumps
│   └── mantisbt.sql    # Initial database with sample data
├── plugins/            # MantisBT plugins
│   └── MantisSeeder/   # Plugin for seeding test data
└── docker-compose.yml  # Docker services configuration
```

## Using MantisSeeder Plugin

The MantisSeeder plugin allows you to import real issues from mantisbt.org for testing:

1. Log in as administrator
2. Navigate to **Manage → Manage Plugins**
3. Find and install the **MantisSeeder** plugin
4. Navigate to **Manage → MantisSeeder**
5. Choose the number of issues to import (1-100)
6. Click **"Import Issues from MantisBT.org"**

For more details, see [plugins/MantisSeeder/readme.md](plugins/MantisSeeder/readme.md).

## Development

For detailed development instructions, see [DEVELOPMENT.md](DEVELOPMENT.md).

## Installation Guide

For step-by-step installation instructions, see [INSTALLATION.md](INSTALLATION.md).

## Managing the Database

### Backup Database

```bash
docker-compose exec db mariadb-dump -u mantisbt -p<password> bugtracker > backup.sql
```

### Restore Database

```bash
docker-compose exec -T db mariadb -u mantisbt -p<password> bugtracker < backup.sql
```

### Access Database Console

```bash
docker-compose exec db mariadb -u mantisbt -p<password> bugtracker
```

## Troubleshooting

### Database Connection Issues

If MantisBT can't connect to the database:

1. Verify the database container is running: `docker-compose ps`
2. Check database credentials in `config/config_inc.php`
3. Ensure `$g_hostname = 'db'` (the Docker service name)

### Permission Issues

If you see file permission errors:

```bash
# Fix permissions on the volumes
docker-compose exec mantis chown -R www-data:www-data /var/www/html
```

### Reset Everything

To start fresh:

```bash
# Stop and remove containers
docker-compose down

# Remove database files
rm -rf mysql/

# Start again and re-import database
docker-compose up -d db
sleep 10
docker-compose exec -T db mariadb -u mantisbt -p<password> bugtracker < database/mantisbt.sql
docker-compose up -d
```

## Configuration

Key configuration options in `config/config_inc.php`:

- **Database:** `$g_hostname`, `$g_database_name`, `$g_db_username`, `$g_db_password`
- **Security:** `$g_crypto_master_salt`
- **Path:** `$g_path` (set to `http://localhost:8989/`)
- **Timezone:** `$g_default_timezone`
- **Email:** Configure SMTP settings for email notifications

## Common Operations

### Start/Stop/Restart Services

```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# Restart all services
docker-compose restart

# Restart only MantisBT (not database)
docker-compose restart mantis

# View logs
docker-compose logs -f

# Check status
docker-compose ps
```

### Daily Usage

**To start working:**
```bash
cd /path/to/mantisbt-docker
docker-compose up -d
# Open http://localhost:8989 in browser
```

**To stop working:**
```bash
docker-compose down
# Your data is safely stored and will be there next time
```

**To check if it's running:**
```bash
docker-compose ps
# Look for "Up" status
```

### Update MantisBT Data

```bash
# Backup before any major changes
docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > backup_$(date +%Y%m%d).sql

# After making changes in MantisBT UI, they're automatically saved
# No manual steps needed!
```

## Security Notes

⚠️ **Important:** This setup is for development purposes only!

- Default passwords should be changed for production use
- The `config/config_inc.php` file is not tracked in Git for security
- Always use strong passwords and secure salts
- Do not expose port 8989 to the internet without proper security measures

## License

This project configuration is provided as-is. MantisBT itself is licensed under the GNU General Public License v2.0. See the [LICENSE](LICENSE) file for details.

## Support

- [MantisBT Documentation](https://www.mantisbt.org/documentation.php)
- [MantisBT Forums](https://www.mantisbt.org/forums/)
- [MantisSeeder Plugin Documentation](plugins/MantisSeeder/readme.md)

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Acknowledgments

- [MantisBT](https://www.mantisbt.org/) - The original bug tracking system
- [MantisHub](https://www.mantishub.com/) - For the Mantis PHP client library
- The MantisBT community for ongoing development and support

