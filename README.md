# DreamFactory Buildpack

This buildpack is designed to deploy DreamFactory PHP/Laravel applications on platforms that support the Heroku buildpack specification.

## Features

- PHP 8.3 support
- Laravel application setup
- NGINX web server configuration
- SQLite database support (configurable)

## Usage

This buildpack is designed to work alongside the official Heroku PHP buildpack. You should set up your application with multiple buildpacks:

```bash
# Create a new Heroku app
heroku create myapp

# Add required buildpacks in order
heroku buildpacks:add heroku/php
heroku buildpacks:add https://github.com/punchcode/claude-ai-buildpack.git

# Deploy your app
git push heroku main
```

Alternatively, you can use the Deploy to Heroku button:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## What This Buildpack Does

1. Detects DreamFactory applications by checking for the presence of "dreamfactory" in the composer.json
2. Clones the DreamFactory repository if needed
3. Installs Composer dependencies
4. Sets up the DreamFactory environment
5. Configures NGINX as the web server
6. Sets appropriate file permissions
7. Creates a Procfile for process management

## Configuration

The buildpack is preconfigured to use SQLite for storage. To customize the database connection or other settings, you can set environment variables:

```bash
heroku config:set DB_CONNECTION=mysql
heroku config:set DB_HOST=your-db-host
heroku config:set DB_DATABASE=your-db-name
heroku config:set DB_USERNAME=your-db-username
heroku config:set DB_PASSWORD=your-db-password
```

## License

This buildpack is released under the MIT License.