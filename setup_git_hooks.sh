#!/bin/bash

ln -sf "$(pwd)/.githooks/commit-msg" .git/hooks/commit-msg
ln -sf "$(pwd)/.githooks/prepare-commit-msg" .git/hooks/prepare-commit-msg

chmod +x .githooks/commit-msg .githooks/prepare-commit-msg

echo "Git hooks have been set up successfully!"

git config --local core.hooksPath .githooks

echo "Project-specific Git configuration has been set."