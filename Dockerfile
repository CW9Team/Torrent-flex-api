FROM python:3.12 AS builder

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app

COPY pyproject.toml poetry.lock  /app/

RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry update \
    && poetry lock \
    && poetry install --without dev \
    && poetry install --no-interaction --no-ansi

COPY . /app

RUN chmod +x handel_migrations.sh && chmod +x entrypoint.sh && ./handel_migrations.sh


FROM python:3.12 AS final


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app

COPY --from=builder /app /app

ENTRYPOINT ["/app/entrypoint.sh"]