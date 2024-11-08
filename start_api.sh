#!/bin/sh
# Start Uvicorn processes
echo "Starting Uvicorn."

# Running Uvicorn server
exec uvicorn src.server.app:get_application --workers 1 --host 0.0.0.0 --port 8000 --proxy-headers
