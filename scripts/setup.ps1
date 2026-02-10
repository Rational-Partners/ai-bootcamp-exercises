Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  AI Bootcamp Exercises - Setup" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Check Docker is running
$dockerCheck = docker info 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Docker is not running." -ForegroundColor Red
    Write-Host "Please start Docker Desktop and try again."
    exit 1
}

# Clone exercise repos if not present
if (-not (Test-Path "exercises")) { New-Item -ItemType Directory -Path "exercises" | Out-Null }

if (-not (Test-Path "exercises\ai-training-practical")) {
    Write-Host "Cloning Exercise 1 (dashboard app)..."
    git clone https://github.com/Rational-Partners/ai-training-practical.git exercises\ai-training-practical
} else {
    Write-Host "Exercise 1 already cloned."
}

if (-not (Test-Path "exercises\ai-training-practical-two")) {
    Write-Host "Cloning Exercise 2 (bug triage API)..."
    git clone https://github.com/Rational-Partners/ai-training-practical-two.git exercises\ai-training-practical-two
} else {
    Write-Host "Exercise 2 already cloned."
}

Write-Host ""
Write-Host "Building and starting Docker container..."
Write-Host "(This may take a few minutes the first time)"
Write-Host ""

docker compose up --build
