# syntax=docker/dockerfile:1
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*
COPY pyproject.toml* requirements*.txt* /app/

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY . /app


CMD ["bash", "-lc", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]