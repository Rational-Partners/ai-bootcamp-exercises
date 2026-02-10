# AI Bootcamp Exercises

This repo sets up both bootcamp exercises in a Docker container so you can start coding with Claude Code immediately.

## Prerequisites

Before the session, please install:

1. **Docker Desktop** - https://www.docker.com/products/docker-desktop/
   - After installing, open Docker Desktop and let it finish starting up
   - Test it works: `docker run hello-world`

2. **Git** - https://git-scm.com/downloads (most machines already have this)

3. **Claude Code** - `npm install -g @anthropic-ai/claude-code`
   - If you don't have npm: install Node.js from https://nodejs.org/ first
   - Sign in: run `claude` and follow the prompts

## Setup

### Mac / Linux

Open Terminal and run:

```
git clone https://github.com/Rational-Partners/ai-bootcamp-exercises.git
cd ai-bootcamp-exercises
./scripts/setup.sh
```

### Windows

Open PowerShell (not cmd.exe) and run:

```
git clone https://github.com/Rational-Partners/ai-bootcamp-exercises.git
cd ai-bootcamp-exercises
.\scripts\setup.ps1
```

### What happens

1. Both exercise repos are cloned into the `exercises/` folder
2. A Docker container is built with Node.js and all tools
3. Dependencies are installed and the database is set up
4. All development servers start automatically

When you see the URLs printed, you're ready to go.

## Verify it's working

Open these in your browser:

- http://localhost:4000 — Exercise 1 frontend (React dashboard)
- http://localhost:5001/health — Exercise 1 backend API
- http://localhost:3000/api/tasks — Exercise 2 API

## Using Claude Code

**Keep the Docker terminal running.** Open a **new** terminal window:

```
# For Exercise 1 (Day 1 - Dashboard App):
cd ai-bootcamp-exercises/exercises/ai-training-practical
claude

# For Exercise 2 (Day 2 - Bug Triage):
cd ai-bootcamp-exercises/exercises/ai-training-practical-two
claude
```

Claude Code edits files on your machine. The Docker container detects the changes and reloads automatically. Refresh your browser to see updates.

## Stopping and restarting

```
# Stop: press Ctrl+C in the Docker terminal, or:
docker compose down

# Restart (no rebuild needed):
docker compose up

# Full rebuild (if something goes wrong):
docker compose down -v
docker compose up --build
```

## Troubleshooting

### Docker Desktop isn't running
You'll see "Cannot connect to the Docker daemon." Open Docker Desktop and wait for it to finish starting.

### Port already in use
Another application is using port 3000, 4000, or 5001. Close it and try again. On Mac: `lsof -i :4000` to find what's using it.

### Container starts but frontend doesn't load
Wait 30 seconds — the first `npm install` takes time. Watch the Docker terminal for the "Starting all development servers" message.

### Changes aren't appearing in the browser
Try a hard refresh (Cmd+Shift+R on Mac, Ctrl+Shift+R on Windows). If that doesn't work, the file watcher may need a moment — wait 5 seconds and refresh again.

### Windows: scripts won't run
Run `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` in PowerShell first, then try again.

### Need a completely fresh start
```
docker compose down -v
rm -rf exercises/
./scripts/setup.sh
```
