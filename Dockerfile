FROM python:3.8.10-slim

WORKDIR /app

COPY . /app

RUN apt-get update && \
    apt-get install -y build-essential gcc netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]
