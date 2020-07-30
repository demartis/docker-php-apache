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


## Tags 

Each tag points to respective latest release

|       tag        |       tag        |       tag        |
|:----------------:|:----------------:|:----------------:|
|     `latest`     |                  |                  |
|      `7.4`       |      `7.3`       |      `7.2`       |
|                  |                  |                  |

## About
These images are configured:
- by using official public images as much as possible 
- by following the [official Docker best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- by following the [official PHP image best practices](https://hub.docker.com/_/php)

## Usage

1. Pull

    ```bash
    docker pull demartis/apache-php:7.4
    ```
2. Run it

    ```bash
    docker run --rm -ti 
        -v ./data/var/www:/var/www:cached
        -v ./data/etc/sites-available:/etc/apache2/sites-available/
        -v ./data/etc/sites-enabled:/etc/apache2/sites-enabled/ 
        demartis/apache-php:7.4  
    ```

## docker-compose example:
```yaml
# docker-compose.yml

version: "3.7"
services:

  web:
    image: demartis/apache-php:7.4
    links:
      - "db:localhost"
    ports:
      - "80:80"
      - "443:443"
    environment:
      APACHE_RUN_USER: "#1000"
    volumes:
      - ./data/var/www:/var/www:cached
      - ./data/etc/sites-available:/etc/apache2/sites-available/
      - ./data/etc/sites-enabled:/etc/apache2/sites-enabled/
      - ./data/etc/php.ini:/usr/local/etc/php/php.ini
      - ./logs/apache/:/var/log/apache2
      - ./data/etc/letsencrypt/:/etc/letsencrypt
```

## Links
[GitHub](https://github.com/demartis/docker-php-apache), 
[DockerHub](https://hub.docker.com/repository/docker/demartis/apache-php), 
[Fossa](https://app.fossa.com/projects/git%2Bgithub.com%2Fdemartis%2Fdocker-php-apache)
[Linkedin](https://www.linkedin.com/in/rdemartis)


These images are configured:
- by using official public images as much as possible 
- by following the [official Docker best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- by following the [official PHP image best practices](https://hub.docker.com/_/php)