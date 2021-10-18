#!/bin/bash

docker-compose up --build
docker-compose start
docker-compose -f docker-compose-production.yml up