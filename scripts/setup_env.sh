#!/usr/bin/env bash
set -euo pipefail

PYTHON=${PYTHON:-python3}
VENV_DIR=${VENV_DIR:-.venv}

echo "Creating virtual environment in $VENV_DIR using $PYTHON"
$PYTHON -m venv "$VENV_DIR"

echo "Activating virtual environment..."
# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

echo "Upgrading pip..."
pip install --upgrade pip

if [ -f requirements.txt ]; then
  echo "Installing Python packages from requirements.txt"
  pip install -r requirements.txt
else
  echo "No requirements.txt found; skipping pip install."
fi

echo "Setup complete. To activate the environment run:"
echo "  source $VENV_DIR/bin/activate"
