#!/bin/bash
set -e

echo ""
echo "========================================="
echo "  AI Bootcamp Exercises - Starting Up"
echo "========================================="
echo ""

# --- Exercise 1: ai-training-practical ---
echo "[1/4] Installing dependencies for Exercise 1 (dashboard app)..."
cd /workspace/ai-training-practical
npm install --loglevel=warn

echo ""
echo "[2/4] Setting up database..."
cd backend
npx prisma generate
npx prisma migrate dev --name init 2>/dev/null || npx prisma migrate deploy 2>/dev/null || echo "  (migrations already applied)"
npx prisma db seed 2>/dev/null || echo "  (seed data already present)"
cd /workspace/ai-training-practical

# --- Exercise 2: ai-training-practical-two ---
echo ""
echo "[3/4] Exercise 2 (bug triage API) has zero dependencies - ready!"

# --- Start all servers ---
echo ""
echo "[4/4] Starting all development servers..."
echo ""
echo "========================================="
echo ""
echo "  Exercise 1 - Dashboard App:"
echo "    Frontend:  http://localhost:4000"
echo "    Backend:   http://localhost:5001"
echo "    Health:    http://localhost:5001/health"
echo ""
echo "  Exercise 2 - Bug Triage API:"
echo "    API:       http://localhost:3000"
echo "    Tasks:     http://localhost:3000/api/tasks"
echo ""
echo "  Edit code in: ./exercises/"
echo "  Use Claude Code on your machine!"
echo ""
echo "========================================="
echo ""

# Run all servers concurrently
npx concurrently \
  --names "FRONTEND,BACKEND,BUG-API" \
  --prefix-colors "cyan,yellow,green" \
  --kill-others-on-fail \
  "cd /workspace/ai-training-practical/frontend && npx vite --port 4000 --host 0.0.0.0" \
  "npm run dev --workspace=backend" \
  "cd /workspace/ai-training-practical-two && node --watch src/index.js"
