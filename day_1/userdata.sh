#!/bin/bash

apt-get update
apt-get upgrade

apt-get install nginx \
    php

service nginx start