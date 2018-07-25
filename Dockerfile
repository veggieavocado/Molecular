FROM python:3.7

RUN apt-get update && \
    apt-get install -y && \
    pip3 install uwsgi

COPY . /app

WORKDIR /app

RUN pip3 install --upgrade pip && \
    pip3 install -q Django==1.11 && \
    pip3 install -r requirements.txt

RUN python manage.py makemigrations && \
    python manage.py migrate

EXPOSE 8000

CMD ["uwsgi", "--ini", "/app/config/uwsgi.ini"]