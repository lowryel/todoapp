# todoapp
# daily task app

* Run: 'docker build -t someImageName .' independently

* Then run:
    docker run -it -p 8020:8020 \
        -e DJANGO_SUPERUSER_USERNAME= \
        -e DJANGO_SUPERUSER_PASSWORD= \
        -e DJANGO_SUPERUSER_EMAIL= \
        todo

> Afterwards
* Add your auth details to CI environment variable
* Then pass your dockerhub auth details into a job in CI pipeline

