# todoapp
# daily task app

* Run: 'docker build -t todoapp .' independently

* Then run:
    docker run -it -p 8020:8020 \
        -e DJANGO_SUPERUSER_USERNAME= \
        -e DJANGO_SUPERUSER_PASSWORD= \
        -e DJANGO_SUPERUSER_EMAIL= \
        todoapp
* Run this command to bind your port "docker run -d -p 8020:8020 lowry09/todo:v1.0.2"
* This will make it easy for you to access the localhost on port 8020
> Afterwards
* Add your auth details to CI environment variable
* Then pass your dockerhub auth details into a job in CI pipeline


[![CircleCI](https://dl.circleci.com/status-badge/img/gh/lowryel/todoapp/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/lowryel/todoapp/tree/main)

* Note: virtual env is in Users folder with name (~/.djangoenv)

* run 'redis-server' to start the cache server
* run 'redis-cli -n 1' in another terminal
* then run 'keys *' to get the cached files
* run 'flushall' to clear the cached files
