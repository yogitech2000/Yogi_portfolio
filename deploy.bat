@echo off
REM Yogaganapathi Terminal Portfolio - Windows Deployment Script


echo 🚀 Yogaganapathi Terminal Portfolio - Cloud Deployment
echo =====================================================

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not installed. Please install Docker first.
    pause
    exit /b 1
)
echo [INFO] Docker is installed

REM Check if docker-compose is available
docker-compose --version >nul 2>&1
if %errorlevel% equ 0 (
    set COMPOSE_CMD=docker-compose
    echo [INFO] docker-compose is available
) else (
    docker compose version >nul 2>&1
    if %errorlevel% equ 0 (
        set COMPOSE_CMD=docker compose
        echo [INFO] Docker Compose V2 is available
    ) else (
        set COMPOSE_CMD=
        echo [WARNING] docker-compose not found. Using manual Docker commands.
    )
)

REM Main logic
if "%1"=="build" goto build
if "%1"=="start" goto start
if "%1"=="stop" goto stop
if "%1"=="restart" goto restart
if "%1"=="status" goto status
if "%1"=="logs" goto logs
if "%1"=="cleanup" goto cleanup
if "%1"=="deploy" goto deploy
if "%1"=="help" goto help

:help
echo Yogaganapathi Terminal Portfolio - Windows Deployment Script
echo.
echo Usage: %0 [command]
echo.
echo Available commands:
echo   build    - Build the Docker image
echo   start    - Start the application
echo   stop     - Stop the application
echo   restart  - Restart the application
echo   status   - Show application status
echo   logs     - Show application logs
echo   cleanup  - Clean up Docker system
echo   deploy   - Full deploy (build + start)
echo   help     - Show this help
echo.
goto end

:build
echo [INFO] Building Docker image...
docker build -t yogaganapathi-terminal .
echo [INFO] Build completed successfully!
goto end

:start
echo [INFO] Starting the application...
if defined COMPOSE_CMD (
    %COMPOSE_CMD% up -d
    echo [INFO] Application started with %COMPOSE_CMD%
) else (
    docker run -d --name yogaganapathi-terminal -p 80:80 --restart unless-stopped yogaganapathi-terminal
    echo [INFO] Application started with Docker
)
goto end

:stop
echo [INFO] Stopping the application...
if defined COMPOSE_CMD (
    %COMPOSE_CMD% down
) else (
    docker stop yogaganapathi-terminal 2>nul
    docker rm yogaganapathi-terminal 2>nul
)
echo [INFO] Application stopped
goto end

:restart
call :stop
call :start
goto end

:status
echo [INFO] Application Status:
echo.
if defined COMPOSE_CMD (
    %COMPOSE_CMD% ps
) else (
    docker ps | findstr yogaganapathi-terminal
    if %errorlevel% neq 0 echo No running containers found
)
echo.
echo [INFO] Container Logs (last 10 lines):
docker logs --tail=10 yogaganapathi-terminal 2>nul
if %errorlevel% neq 0 echo No logs available
goto end

:logs
echo [INFO] Application Logs:
docker logs -f yogaganapathi-terminal
goto end

:cleanup
echo [INFO] Cleaning up...
docker system prune -f
echo [INFO] Cleanup completed
goto end

:deploy
call :build
call :start
echo [INFO] Deployment completed!
echo [INFO] Access your application at: http://localhost
goto end

:end
echo.
pause