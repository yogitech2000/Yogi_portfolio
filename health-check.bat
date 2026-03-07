@echo off
REM Health check script for Yogaganapathi Terminal Portfolio

set HEALTH_URL=http://localhost/health
set APP_URL=http://localhost

echo 🔍 Checking application health...

REM Check if container is running
docker ps | findstr yogaganapathi-terminal >nul
if %errorlevel% equ 0 (
    echo ✅ Container is running
) else (
    echo ❌ Container is not running
    exit /b 1
)

REM Check health endpoint (requires curl or similar)
curl -s --max-time 5 %HEALTH_URL% >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Health endpoint responding
) else (
    echo ❌ Health endpoint not responding
    exit /b 1
)

REM Check main application
curl -s --max-time 5 %APP_URL% | findstr Yogaganapathi >nul
if %errorlevel% equ 0 (
    echo ✅ Application is accessible
) else (
    echo ❌ Application not accessible
    exit /b 1
)

echo 🎉 All health checks passed!
exit /b 0