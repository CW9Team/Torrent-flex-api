#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Return the exit status of the last command in the pipe that failed
set -o pipefail


# Step 1: Check for pending migrations
echo "🔍 Checking for pending migrations..."
PENDING_MIGRATIONS=$(poetry run python manage.py showmigrations --plan | grep '\[ \]' || true)

if [ -z "$PENDING_MIGRATIONS" ]; then
  echo "✅ No pending migrations."
else
  echo "⚠️  Pending migrations found."
fi

# Step 2: Try to create new migrations
echo "⚙️  Creating new migrations (if needed)..."
poetry run python3 manage.py makemigrations --noinput || {
  echo "❌ Error: Unable to create new migrations."
  exit 1
}

# Step 3: Check for migration conflicts and merge
MIGRATION_CONFLICTS=$(python manage.py makemigrations --check --noinput 2>&1 || true)

if [[ "$MIGRATION_CONFLICTS" == *"conflicts detected"* ]]; then
  echo "⚠️  Conflicts detected. Attempting to merge migrations..."
  python manage.py makemigrations --merge --noinput || {
    echo "❌ Error: Unable to merge migrations."
    exit 1
  }
fi

# Step 4: Apply migrations
echo "🚀 Applying migrations..."
python manage.py migrate --noinput || {
  echo "❌ Error: Failed to apply migrations."
  exit 1
}

# Step 5: Post-migration checks
echo "🔍 Performing post-migration sanity checks..."
python manage.py showmigrations | grep '\[ \]' && {
  echo "❌ Error: Some migrations are still pending after attempting to migrate."
  exit 1
}

echo "✅ Migrations applied successfully."
