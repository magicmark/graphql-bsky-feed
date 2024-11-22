FROM alpine:3.7

WORKDIR /usr/src/app

RUN apk add --no-cache \
        uwsgi-python3 \
        python3

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /db

CMD [ "uwsgi", "--http", "0.0.0.0:8080", \
               "--uid", "uwsgi", \
               "--plugins", "python3", \
               "--callable", "app", \
               "--wsgi-file", "server/app.py" \
               "--processes", "1", \
               "--threads ", "1" ]

# CMD uwsgi \
#     --socket 127.0.0.1:8080 \
#     --wsgi-file server/app.py \
#     --callable app \
#     --processes 1 \
#     --threads 1