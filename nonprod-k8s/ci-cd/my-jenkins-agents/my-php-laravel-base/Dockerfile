#### Docker base image (laravel-php) Base Image Name - mydev/php-laravel-base:1.0.0

# Laravel application
FROM php:7.4-apache
LABEL maintainer="gsundar93@gmail.com"

# Install common tools and libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    zip \
    unzip \
    vim \
    openssl \
    libz-dev \
    libjpeg-dev \
    libmcrypt-dev \
    autoconf \
    file \
    g++ \
    gcc \
    libonig-dev \
    gnupg

# Install PHP database modules
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Install PHP intl module
RUN apt-get update && apt-get install -y libicu-dev \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install intl

# Install PHP Image module and libraries
RUN apt-get update && apt-get install -y \
	libfreetype6-dev libjpeg62-turbo-dev libpng-dev libgd-dev \
	&& docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install exif


RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pgsql pdo_pgsql


# PHP Zip Archive
RUN apt-get install -y libzip-dev \
    && docker-php-ext-install zip    