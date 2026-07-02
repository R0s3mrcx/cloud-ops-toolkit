#!/usr/bin/env bats

setup() {
    SCRIPT="scripts/docker-health.sh"
}

@test "script exists" {
    [ -f "$SCRIPT" ]
}

@test "prints the title" {
    run bash "$SCRIPT"

    [[ "$output" == *"DOCKER HEALTH CHECK"* ]]
}

@test "returns 0 or 1" {
    run bash "$SCRIPT"

    [ "$status" -eq 0 ] || [ "$status" -eq 1 ]
}