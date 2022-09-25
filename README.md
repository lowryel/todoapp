# todoapp
daily task app

* Run: 'docker build -t someImageName .' independently

* Then run:
    docker run -it -p 8020:8020 \
        -e DJANGO_SUPERUSER_USERNAME=Eugene \
        -e DJANGO_SUPERUSER_PASSWORD=cartelo009 \
        -e DJANGO_SUPERUSER_EMAIL=ellowry09@gmail.com \
        todo

> Afterwards
* Add your auth details to CI environment variable
* Then pass your dockerhub auth details into a job in CI pipeline

