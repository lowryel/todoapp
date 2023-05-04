FROM python:3.10-slim-buster AS builder

WORKDIR /todo/
COPY . /todo/

RUN pip install --upgrade pip
# RUN pip install -r requirements.txt
RUN chown -R www-data:www-data /todo/
USER www-data

RUN chmod +x start-server.sh


FROM python:3.10-alpine

WORKDIR /app/

COPY --from=builder /todo/ /app/
COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8020

STOPSIGNAL SIGTERM
CMD ["./start-server.sh"]
