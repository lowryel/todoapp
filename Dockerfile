FROM python:3.10-slim-buster AS builder


RUN apt-get update && apt-get install nginx vim -y --no-install-recommends
COPY nginx.default /etc/nginx/sites-available/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# working directory
WORKDIR /todo/


# copy the entire project folder into the working directory
COPY . . /todo/

# install dependencies
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt
RUN chown -R www-data:www-data /todo

FROM python:3.8.16-slim

WORKDIR /app/
COPY --from=builder /todo/ /app
# Expose the application to port 8020
EXPOSE 8020
STOPSIGNAL SIGTERM

CMD ["./start-server.sh"]
