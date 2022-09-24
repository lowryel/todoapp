FROM python:3.8.3-alpine

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

# Expose the application to port 8000
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
