#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e


check_dependencies() {
    echo "Checking Poetry dependencies..."
    poetry check
}

update_dependencies() {
    echo "Updating dependencies to sync with pyproject.toml..."
    poetry update
}

install_dependencies() {
    echo "Installing dependencies..."
    poetry install --sync
}

lock_dependencies() {
    echo "Regenerating poetry.lock (without updating dependencies)..."
    poetry lock --no-update
}

check_env() {
    echo "Checking Poetry environment..."
    poetry env info
}


main() {
    check_dependencies
    update_dependencies
    install_dependencies
    lock_dependencies
    check_env
    echo "All steps completed successfully."
}

# Run the main function
main
