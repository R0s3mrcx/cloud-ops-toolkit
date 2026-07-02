#!/bin/bash
# docker-health.sh
# Simple script to check Docker status

echo "=========================="
echo "DOCKER HEALTH CHECK"
echo "=========================="

if ! command -v docker > /dev/null
then
    echo "Docker is not installed"
    exit 1
fi

echo "Docker version:"
docker --version

echo ""

if ! docker info > /dev/null 2>&1
then
    echo "Docker is not running"
    exit 1
fi

echo "Docker is running"

echo ""

echo "Running containers:"
docker ps

echo ""

echo "All containers:"
docker ps -a

echo ""

echo "Docker images:"
docker images

echo ""

RUNNING=$(docker ps -q | wc -l)

echo "Total running containers: $RUNNING"

echo ""
echo "=========================="
echo "Docker check finished"
echo "=========================="

exit 0