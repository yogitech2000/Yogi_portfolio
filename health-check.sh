#!/bin/bash
# Health check script for Yogaganapathi Terminal Portfolio

HEALTH_URL="http://localhost/health"
APP_URL="http://localhost"

echo "🔍 Checking application health..."

# Check if container is running
if docker ps | grep -q yogaganapathi-terminal; then
    echo "✅ Container is running"
else
    echo "❌ Container is not running"
    exit 1
fi

# Check health endpoint
if curl -s --max-time 5 "$HEALTH_URL" > /dev/null; then
    echo "✅ Health endpoint responding"
else
    echo "❌ Health endpoint not responding"
    exit 1
fi

# Check main application
if curl -s --max-time 5 "$APP_URL" | grep -q "Yogaganapathi"; then
    echo "✅ Application is accessible"
else
    echo "❌ Application not accessible"
    exit 1
fi

echo "🎉 All health checks passed!"
exit 0