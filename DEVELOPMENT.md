# Development Guide

This guide provides detailed information for developers working on this MantisBT environment.

## Table of Contents

- [Development Environment Setup](#development-environment-setup)
- [Project Architecture](#project-architecture)
- [Docker Services](#docker-services)
- [Database Management](#database-management)
- [Plugin Development](#plugin-development)
- [Debugging](#debugging)
- [Common Development Tasks](#common-development-tasks)
- [Troubleshooting](#troubleshooting)

## Development Environment Setup

### Prerequisites

- Docker Desktop (version 20.10+)
- Docker Compose (version 2.0+)
- Git
- A code editor (VS Code, PhpStorm, etc.)

### Initial Setup

1. **Clone and Configure**

```bash
git clone https://github.com/AIchemist87/mantisbt-docker.git
cd mantisbt-docker
cp config/config_inc.php.template config/config_inc.php
```

2. **Generate Secure Credentials**

```bash
# Generate a secure crypto salt
openssl rand -base64 32
```

Update `config/config_inc.php` with the generated salt.

3. **Start Development Environment**

```bash
# Start all services
docker-compose up -d

# Import the database
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < database/mantisbt.sql

# View logs
docker-compose logs -f
```

## Project Architecture

### Directory Structure

```
mantisbt/
├── admin/                  # MantisBT administration interface
│   ├── check/             # System check scripts
│   └── *.php              # Admin utilities
├── config/                # Configuration files
│   ├── config_inc.php.template  # Template for configuration
│   └── config_inc.php     # Local configuration (not in Git)
├── custom/                # Custom MantisBT modifications
├── database/              # Database dumps and migrations
│   └── mantisbt.sql       # Sample database
├── mysql/                 # MariaDB data directory (Docker volume, not in Git)
├── plugins/               # MantisBT plugins
│   └── MantisSeeder/      # Test data seeding plugin
└── docker-compose.yml     # Docker services definition
```

### Technology Stack

- **Backend:** PHP 7.4+ (via MantisBT Docker image)
- **Database:** MariaDB 12
- **Web Server:** Apache (included in MantisBT image)
- **Containerization:** Docker & Docker Compose

## Docker Services

### Service Configuration

The `docker-compose.yml` defines two services:

#### 1. Database Service (`db`)

```yaml
db:
  image: mariadb:12
  environment:
    MYSQL_ROOT_PASSWORD: root
    MYSQL_DATABASE: bugtracker
    MYSQL_USER: mantisbt
    MYSQL_PASSWORD: mantisbt
  volumes:
    - ./mysql:/var/lib/mysql
```

- **Purpose:** MariaDB database server
- **Port:** 3306 (internal only)
- **Data Persistence:** `./mysql` directory
- **Access:** `docker-compose exec db mariadb -u mantisbt -pmantisbt bugtracker`

#### 2. MantisBT Service (`mantis`)

```yaml
mantis:
  platform: "linux/amd64"
  image: xlrl/mantisbt:latest
  environment:
    MANTIS_TIMEZONE: Asia/Jerusalem
    MANTIS_ENABLE_ADMIN: "1"
    PHP_MAX_UPLOAD_SIZE: 16M
  ports:
    - "8989:80"
  volumes:
    - ./config:/var/www/html/config
    - ./custom:/var/www/html/custom
    - ./plugins/MantisSeeder:/var/www/html/plugins/MantisSeeder
    - ./admin:/var/www/html/admin:ro
```

- **Purpose:** MantisBT web application
- **Port:** 8989 → 80
- **Mounted Volumes:**
  - `config/` - Configuration files
  - `custom/` - Custom modifications
  - `plugins/MantisSeeder/` - Test data plugin
  - `admin/` - Admin interface (read-only)

### Managing Services

```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# Restart a specific service
docker-compose restart mantis

# View logs
docker-compose logs -f mantis

# View all logs
docker-compose logs -f

# Check service status
docker-compose ps

# Rebuild and start
docker-compose up -d --build
```

## Database Management

### Accessing the Database

```bash
# MySQL/MariaDB CLI
docker-compose exec db mariadb -u mantisbt -pmantisbt bugtracker

# As root user
docker-compose exec db mariadb -u root -proot bugtracker
```

### Common Database Operations

#### Backup Database

```bash
# Create a timestamped backup
docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > "backup_$(date +%Y%m%d_%H%M%S).sql"

# Backup to database folder
docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > database/mantisbt_backup.sql
```

#### Restore Database

```bash
# From a backup file
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < backup.sql
```

#### Reset Database

```bash
# Drop and recreate database
docker-compose exec db mariadb -u root -proot -e "DROP DATABASE IF EXISTS bugtracker; CREATE DATABASE bugtracker;"

# Import fresh data
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < database/mantisbt.sql
```

### Database Schema

MantisBT uses the following main tables:

- `mantis_user_table` - User accounts
- `mantis_project_table` - Projects
- `mantis_bug_table` - Issues/bugs
- `mantis_bug_text_table` - Issue descriptions
- `mantis_bugnote_table` - Comments/notes
- `mantis_bug_history_table` - Change history
- `mantis_plugin_table` - Installed plugins

## Plugin Development

### MantisSeeder Plugin Structure

```
plugins/MantisSeeder/
├── MantisSeeder.php        # Main plugin class
├── core/
│   ├── MantisPhpClient.php # API client
│   └── Seeder.php          # Seeding logic
├── pages/
│   ├── config_page.php     # Configuration page
│   └── seed.php            # Seeding page
├── lang/
│   └── strings_english.txt # Localization strings
├── LICENSE
└── readme.md               # Plugin documentation
```

### Creating a New Plugin

1. **Create Plugin Directory**

```bash
mkdir -p plugins/MyPlugin
```

2. **Create Main Plugin File** (`plugins/MyPlugin/MyPlugin.php`)

```php
<?php
class MyPluginPlugin extends MantisPlugin {
    function register() {
        $this->name = 'MyPlugin';
        $this->description = 'Description of my plugin';
        $this->version = '1.0.0';
        $this->requires = array(
            'MantisCore' => '2.0.0',
        );
        $this->author = 'Your Name';
        $this->contact = 'your@email.com';
        $this->url = 'https://github.com/yourusername/myplugin';
    }
    
    function init() {
        // Plugin initialization code
    }
}
```

3. **Add to Docker Compose**

```yaml
volumes:
  - ./plugins/MyPlugin:/var/www/html/plugins/MyPlugin
```

4. **Restart and Install**

```bash
docker-compose restart mantis
```

Then navigate to **Manage → Manage Plugins** and install your plugin.

## Debugging

### PHP Debugging

#### Enable Debug Mode

Edit `config/config_inc.php`:

```php
$g_show_detailed_errors = ON;
$g_log_level = LOG_DEBUG;
$g_log_destination = 'file';
$g_log_file = '/tmp/mantis.log';
```

#### View PHP Logs

```bash
# Apache error log
docker-compose exec mantis tail -f /var/log/apache2/error.log

# MantisBT log
docker-compose exec mantis tail -f /tmp/mantis.log
```

### Database Debugging

#### Enable MySQL Query Log

```bash
docker-compose exec db mariadb -u root -proot -e "
  SET GLOBAL general_log = 'ON';
  SET GLOBAL general_log_file = '/var/log/mysql/general.log';
"

# View query log
docker-compose exec db tail -f /var/log/mysql/general.log
```

#### Check Slow Queries

```bash
docker-compose exec db mariadb -u root -proot -e "
  SET GLOBAL slow_query_log = 'ON';
  SET GLOBAL long_query_time = 1;
"
```

## Common Development Tasks

### Adding a New Admin Check

1. Create file in `admin/check/check_myfeature_inc.php`
2. Follow the pattern of existing check files
3. Register the check in `admin/check/index.php`

### Modifying Database Schema

```bash
# Create migration script
cat > database/migrations/001_add_custom_field.sql << 'EOF'
ALTER TABLE mantis_bug_table 
ADD COLUMN custom_field VARCHAR(255) DEFAULT NULL;
EOF

# Apply migration
docker-compose exec -T db mariadb -u mantisbt -pmantisbt bugtracker < database/migrations/001_add_custom_field.sql
```

### Customizing MantisBT

Use the `custom/` directory for modifications:

```bash
# Override a core file
cp /path/to/mantisbt/core_file.php custom/core_file.php
# Edit custom/core_file.php
```

### Updating MantisBT Version

1. Update the image version in `docker-compose.yml`
2. Backup your database
3. Restart services
4. Run database upgrade from admin panel

## Troubleshooting

### Container Won't Start

```bash
# Check logs
docker-compose logs

# Check for port conflicts
lsof -i :8989
lsof -i :3306

# Remove and recreate containers
docker-compose down
docker-compose up -d
```

### Database Connection Issues

```bash
# Verify database is running
docker-compose ps db

# Test database connectivity
docker-compose exec mantis ping -c 3 db

# Check database credentials
docker-compose exec db mariadb -u mantisbt -pmantisbt -e "SELECT 1"
```

### File Permission Issues

```bash
# Fix permissions for web server
docker-compose exec mantis chown -R www-data:www-data /var/www/html/custom
docker-compose exec mantis chmod -R 755 /var/www/html/custom
```

### Plugin Not Loading

```bash
# Check plugin directory permissions
docker-compose exec mantis ls -la /var/www/html/plugins/

# Verify plugin is mounted
docker-compose exec mantis cat /var/www/html/plugins/MantisSeeder/MantisSeeder.php

# Check MantisBT logs
docker-compose exec mantis tail -f /var/www/html/mantis.log
```

### Clear Cache

```bash
# Remove MantisBT cache
docker-compose exec mantis rm -rf /var/www/html/cache/*

# Restart to clear PHP opcache
docker-compose restart mantis
```

## Best Practices

1. **Always backup before major changes**
   ```bash
   docker-compose exec db mariadb-dump -u mantisbt -pmantisbt bugtracker > backup_before_change.sql
   ```

2. **Use version control for custom code**
   - Commit changes to `custom/` and `plugins/`
   - Don't commit `config/config_inc.php`

3. **Test in isolation**
   - Use separate database for testing
   - Test plugins individually

4. **Document your changes**
   - Update README for user-facing changes
   - Update this file for developer changes
   - Add comments to complex code

5. **Follow MantisBT coding standards**
   - PSR-2 for PHP code
   - Proper indentation and naming conventions

## Resources

- [MantisBT Documentation](https://www.mantisbt.org/documentation.php)
- [MantisBT Plugin Development Guide](https://www.mantisbt.org/docs/master/en-US/Developers_Guide/html-desktop/#DEVELOPERS.PLUGINS)
- [Docker Documentation](https://docs.docker.com/)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)

## Getting Help

If you encounter issues:

1. Check this documentation
2. Review Docker and MantisBT logs
3. Search [MantisBT forums](https://www.mantisbt.org/forums/)
4. Open an issue in this repository

