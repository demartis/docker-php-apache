Ready-to-use Apache+PHP image
=============================
    

![Docker Automated build](https://img.shields.io/docker/cloud/automated/demartis/apache-php)
![Docker Build Status](https://img.shields.io/docker/cloud/build/demartis/apache-php)
[![Build Status](https://travis-ci.org/demartis/docker-php-apache.svg?branch=master)](https://travis-ci.org/demartis/docker-php-apache)
![GitHub last commit](https://img.shields.io/github/last-commit/demartis/docker-php-apache.svg)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/demartis/docker-php-apache.svg)
![GitHub language count](https://img.shields.io/github/languages/count/demartis/docker-php-apache.svg)
![GitHub](https://img.shields.io/github/license/demartis/docker-php-apache)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fdemartis%2Fdocker-php-apache.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fdemartis%2Fdocker-php-apache?ref=badge_shield)

## Table of Contents
[TOC]

## About
These images are configured:
- by using only official public images 
- by following the [official Docker best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- by following the [official PHP image best practices](https://hub.docker.com/_/php)

## What's included
- based on *apache 2.4 + php 7.4 - 7.3 - 7.2* (from latest [PHP Official 7.x-apache-buster](https://hub.docker.com/_/php?tab=description&page=1&name=-apache-buster))
- enabled most *common php ext* (like opcache, gd, imagick. See below the complete list)
- added *certbot* to bettter working with apache


## Tags 

Each tag points to respective latest release

| Apache + PHP 7.4 | Apache + PHP 7.3 | Apache + PHP 7.2 |
|:----------------:|:----------------:|:----------------:|
|     `latest`     |                  |                  |
|      `7.4`       |      `7.3`       |      `7.2`       |
|                  |                  |                  |


## Simple Usage

1. Pull

    ```bash
    docker pull demartis/apache-php:7.4
    ```
2. Check
    ```bash
    docker run --rm demartis/apache-php:7.4 apache2 -v && php --version && php -m
    ``` 
3. Run

    ```bash
    docker run -d \
        -p 127.0.0.1:80:80 \
        demartis/apache-php:7.4
    ```
4. check on you browser http://127.0.0.1/phpinfo.php

## Simple docker-compose example:
```yaml
# docker-compose.yml

version: "3.8"
services:

  web:
    image: demartis/apache-php:7.4
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./data/var/www:/var/www:cached
      - ./data/etc/sites-available:/etc/apache2/sites-available/
      - ./data/etc/sites-enabled:/etc/apache2/sites-enabled/
      - ./data/etc/php.ini:/usr/local/etc/php/php.ini
      - ./logs/apache/:/var/log/apache2
      - ./data/etc/letsencrypt/:/etc/letsencrypt
```


## PHP enabled modules (php -m)
[PHP Modules]
- apcu
- calendar
- Core
- ctype
- curl
- date
- dom
- exif
- fileinfo
- filter
- ftp
- gd
- gettext
- hash
- iconv
- imagick
- intl
- json
- libxml
- mbstring
- mcrypt
- memcached
- mysqli
- mysqlnd
- openssl
- pcntl
- pcre
- PDO
- pdo_mysql
- pdo_sqlite
- Phar
- posix
- readline
- redis
- Reflection
- session
- shmop
- SimpleXML
- sockets
- sodium
- SPL
- sqlite3
- standard
- timezonedb
- tokenizer
- xml
- xmlreader
- xmlwriter
- Zend OPcache
- zip
- zlib

[Zend Modules]
- Zend OPcache


## Links
[GitHub](https://github.com/demartis/docker-php-apache), 
[DockerHub](https://hub.docker.com/repository/docker/demartis/apache-php), 
[Fossa](https://app.fossa.com/projects/git%2Bgithub.com%2Fdemartis%2Fdocker-php-apache),
[My Linkedin Profile](https://www.linkedin.com/in/rdemartis)
