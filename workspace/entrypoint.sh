#!/bin/bash

docker_passenger_api_cmd="docker exec -w /var/www/html/ramzy-rides-passenger-api -t laradock_workspace_1"

$docker_passenger_api_cmd composer install
$docker_passenger_api_cmd php artisan migrate:refresh --seed