#!/bin/bash

# Yogaganapathi Terminal Portfolio - Cloud Deployment Script
# This script helps deploy the application to cloud VMs

set -e

echo "🚀 Yogaganapathi Terminal Portfolio - Cloud Deployment"
echo "====================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is installed
check_docker() {
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed. Please install Docker first."
        exit 1
    fi
    print_status "Docker is installed: $(docker --version)"
}

# Check if docker-compose is available
check_docker_compose() {
    if command -v docker-compose &> /dev/null; then
        print_status "docker-compose is available: $(docker-compose --version)"
        return 0
    elif docker compose version &> /dev/null; then
        print_status "Docker Compose V2 is available: $(docker compose version)"
        return 0
    else
        print_warning "docker-compose not found. Using manual Docker commands."
        return 1
    fi
}

# Build the application
build_app() {
    print_status "Building Docker image..."
    docker build -t yogaganapathi-terminal .
    print_status "Build completed successfully!"
}

# Run the application
run_app() {
    print_status "Starting the application..."

    if check_docker_compose; then
        docker-compose up -d
        print_status "Application started with docker-compose"
    else
        # Manual Docker run
        docker run -d \
            --name yogaganapathi-terminal \
            -p 80:80 \
            --restart unless-stopped \
            yogaganapathi-terminal
        print_status "Application started with Docker"
    fi
}

# Stop the application
stop_app() {
    print_status "Stopping the application..."

    if check_docker_compose; then
        docker-compose down
    else
        docker stop yogaganapathi-terminal 2>/dev/null || true
        docker rm yogaganapathi-terminal 2>/dev/null || true
    fi

    print_status "Application stopped"
}

# Show status
show_status() {
    print_status "Application Status:"
    echo ""

    if check_docker_compose; then
        docker-compose ps
    else
        docker ps | grep yogaganapathi-terminal || echo "No running containers found"
    fi

    echo ""
    print_status "Container Logs (last 10 lines):"
    docker logs --tail=10 yogaganapathi-terminal 2>/dev/null || echo "No logs available"
}

# Clean up
cleanup() {
    print_status "Cleaning up..."
    docker system prune -f
    print_status "Cleanup completed"
}

# Main menu
show_menu() {
    echo ""
    echo "Available commands:"
    echo "  build    - Build the Docker image"
    echo "  start    - Start the application"
    echo "  stop     - Stop the application"
    echo "  restart  - Restart the application"
    echo "  status   - Show application status"
    echo "  logs     - Show application logs"
    echo "  cleanup  - Clean up Docker system"
    echo "  deploy   - Full deploy (build + start)"
    echo "  help     - Show this help"
    echo "  exit     - Exit"
    echo ""
}

# Main script logic
main() {
    check_docker

    case "${1:-help}" in
        build)
            build_app
            ;;
        start)
            run_app
            ;;
        stop)
            stop_app
            ;;
        restart)
            stop_app
            run_app
            ;;
        status)
            show_status
            ;;
        logs)
            print_status "Application Logs:"
            docker logs -f yogaganapathi-terminal
            ;;
        cleanup)
            cleanup
            ;;
        deploy)
            build_app
            run_app
            print_status "Deployment completed!"
            print_status "Access your application at: http://localhost"
            ;;
        help|*)
            echo "Yogaganapathi Terminal Portfolio - Deployment Script"
            echo ""
            echo "Usage: $0 [command]"
            echo ""
            show_menu
            ;;
    esac
}

# Run main function with all arguments
main "$@"