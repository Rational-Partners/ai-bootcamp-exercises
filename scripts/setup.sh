#!/bin/bash
set -e

echo ""
echo "========================================="
echo "  AI Bootcamp Exercises - Setup"
echo "========================================="
echo ""

# Check Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "ERROR: Docker is not running."
  echo "Please start Docker Desktop and try again."
  exit 1
fi

# Clone exercise repos if not present
mkdir -p exercises

if [ ! -d "exercises/ai-training-practical" ]; then
  echo "Cloning Exercise 1 (dashboard app)..."
  git clone https://github.com/Rational-Partners/ai-training-practical.git exercises/ai-training-practical
else
  echo "Exercise 1 already cloned."
fi

if [ ! -d "exercises/ai-training-practical-two" ]; then
  echo "Cloning Exercise 2 (bug triage API)..."
  git clone https://github.com/Rational-Partners/ai-training-practical-two.git exercises/ai-training-practical-two
else
  echo "Exercise 2 already cloned."
fi

echo ""
echo "Building and starting Docker container..."
echo "(This may take a few minutes the first time)"
echo ""

docker compose up --build
