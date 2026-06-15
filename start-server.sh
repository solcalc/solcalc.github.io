#!/bin/bash
# Simple script to start a local web server for testing

echo "Starting local web server..."
echo "Open http://localhost:8000 in your browser"
echo "Press Ctrl+C to stop"
echo ""

python3 -m http.server 8000 --bind 127.0.0.1
