FROM python:3.8-buster


RUN apt-get update && apt-get install nginx vim -y --no-install-recommends
COPY nginx.default /etc/nginx/sites-available/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# working directory
WORKDIR /usr/src/todo

# setup environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy the entire project folder into the working directory
COPY . /usr/src/todo/

# install dependencies
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt
RUN chown -R www-data:www-data /usr/src/todo

# Expose the application to port 8000
EXPOSE 8020
STOPSIGNAL SIGTERM

CMD ["start-server.sh"]
