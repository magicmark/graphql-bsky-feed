FROM python:3.12

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /db
CMD uwsgi \
    --http 127.0.0.1:8080 \
    --wsgi-file server/app.py \
    --callable app \
    --processes 1 \
    --threads 1