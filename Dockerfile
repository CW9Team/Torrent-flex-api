FROM python:3.11-slim AS builder


WORKDIR /app
RUN apt-get update \
    && apt-get install -y gcc libpq-dev \
    && apt-get clean

COPY puprofect.toml poetry.lock /app/
RUN pip install poetry \
    &&  poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

COPY . /app/
