#!/bin/bash
# server-health.sh
# Simple script to check basic server health

echo "=========================="
echo "SERVER HEALTH CHECK"
echo "=========================="

STATUS=0

# ==========================
# Check RAM
# ==========================

echo ""
echo "Checking RAM..."

free -h

RAM_USED=$(free | grep Mem | awk '{print $3}')

RAM_TOTAL=$(free | grep Mem | awk '{print $2}')

RAM_PERCENT=$((RAM_USED * 100 / RAM_TOTAL))

echo "RAM usage: $RAM_PERCENT%"

if [ "$RAM_PERCENT" -gt 80 ]
then
    echo "WARNING: High RAM usage"
    STATUS=1
fi

# ==========================
# Check Disk
# ==========================

echo ""
echo "Checking Disk..."

df -h /

DISK_PERCENT=$(df / | grep / | awk '{print $5}' | sed 's/%//')

echo "Disk usage: $DISK_PERCENT%"

if [ "$DISK_PERCENT" -gt 80 ]
then
    echo "WARNING: High disk usage"
    STATUS=1
fi

# ==========================
# Check Internet
# ==========================

echo ""
echo "Checking Internet..."

if ping -c 1 google.com > /dev/null 2>&1
then
    echo "Internet: OK"
else
    echo "Internet: FAIL"
    STATUS=1
fi

# ==========================
# Check Docker
# ==========================

echo ""
echo "Checking Docker..."

if ! command -v docker > /dev/null
then
    echo "Docker: Not installed"
    STATUS=1


elif docker info > /dev/null 2>&1
then
    echo "Docker: Running"

else
    echo "Docker: Not running"
    STATUS=1
fi

# ==========================
# Final Result
# ==========================

echo ""
echo "=========================="

if [ "$STATUS" -eq 0 ]
then
    echo "Server status: HEALTHY"
else
    echo "Server status: ATTENTION NEEDED"
fi

echo "Health check finished"
echo "=========================="

exit $STATUS
