[![tests](https://github.com/ddev/ddev-addon-template/actions/workflows/tests.yml/badge.svg)](https://github.com/ddev/ddev-addon-template/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# ddev-php-dumper <!-- omit in toc -->

- [What is ddev-php-dumper?](#what-is-ddev-php-dumper)
- [What does this add-on do?](#what-does-this-add-on-do)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)

## What is ddev-php-dumper?

ddev-php-dumper allows you to manage and record PHP Symfony dumps.
It does this by integrating the Docker Desktop extension [PHP Dumper](https://github.com/artifision/php-dumper-docker-extension) into DDEV project.

This allows you to:

- auto-expand dumps to a specific level
- filter dumps by time frame
- pin dumps
- compare 2 dump

![Dump](images/php-dumper.png)

## What does this add-on do?

1. Adds Docker host as an extra host in the web container.
2. Sets environment variables to redirect "var_dump" output to PHP Dumper Docker extention.

## Requirements

- [DDEV](https://ddev.com)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [symfony/var-dumper](https://symfony.com/doc/current/components/var_dumper.html)

If you project is based on Symfony (such as Laravel, Drupal), it may already include 'var-dumper'.

## Installation

1. Install the PHP Dumper extension via [Docker Desktop GUI](https://docs.docker.com/desktop/extensions/marketplace/#install-an-extension) or using the following command.

    ```shell
    docker extension install artifision/php-dumper-docker-extension:latest
    ```

1. Install var-dumper, if you project does not already include it.

    ```shell
    composer require --dev symfony/var-dumper
    ```

1. Install ddev-php-dump addon and restart to activate the addon.

    ```shell
    ddev get tyler36/ddev-php-dumper
    ddev restart
    ```

## Usage

- Open PHP-dumper panel in Docker Desktop.
- Use `dump()` command in your project.
- For Laravel projects, use `dd()`.

![Dump](images/php-dumper.png)

## Troubleshooting

- Visit the test page, <http://localhost:9913/dump> to check if the extension can correctly receive data.
- Ensure `symfony/var-dumper` is installed and is the latest version.

    ```shell
    composer update symfony/var-dumper
    ```

**Contributed and maintained by [@tyler36](https://github.com/tyler36)**
