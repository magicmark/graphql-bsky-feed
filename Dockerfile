FROM python:3.12-slim

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uwsgi", "--http", "0.0.0.0:8000", "--master", "-p", "4", "-w", "app:app"]