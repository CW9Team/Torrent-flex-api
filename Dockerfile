<<<<<<< HEAD
# Stage 1: Build dependencies
FROM python:3.12-slim AS builder

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install --no-cache-dir poetry

# Install gunicorn
RUN pip install gunicorn

# Copy only the files needed for installation
COPY pyproject.toml poetry.lock ./

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

# Stage 2: Run application
FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy installed packages from builder stage
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
# Copy project files
COPY . .

# Create a non-root user and switch to it
# RUN useradd -m appuser
# USER appuser

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE hypertube.settings

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["gunicorn", "hypertube.wsgi:application", "--bind", "0.0.0.0:8000"]
=======
FROM python:3.11-slim

WORKDIR /app
RUN apt-get update \
    && apt-get install -y gcc libpq-dev \
    && apt-get clean

COPY puprofect.toml poetry.lock /app/
RUN pip install poetry \
    &&  poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

COPY . /app/
>>>>>>> 15edbe2... feat: set up project structure
