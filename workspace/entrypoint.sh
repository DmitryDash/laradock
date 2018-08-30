#!/bin/bash

docker_passenger_api_cmd="docker exec -w /var/www/html/ramzy-rides-passenger-api -t laradock_workspace_1"
docker_worker_cmd="docker exec -w /var/www/html/ramzy-rides-passenger-api -t laradock_php-worker_1"

$docker_passenger_api_cmd composer install
$docker_passenger_api_cmd php artisan migrate:refresh --seed

$docker_worker_cmd supervisorctl stop all
$docker_worker_cmd supervisorctl start all