FROM python:3.10-slim-buster AS builder

WORKDIR /todo/

COPY appf/. /todo/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN adduser www-data
RUN chmod +x start-server.sh

FROM python:3.10-alpine

WORKDIR /app/

COPY --from=builder /todo/ /app/

RUN chown -R www-data:www-data /app/
USER www-data

COPY requirements /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN chown -R www-data:www-data /app/
EXPOSE 8020

STOPSIGNAL SIGTERM

CMD ["./start-server.sh"]
