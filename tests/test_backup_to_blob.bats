#!/usr/bin/env bats

setup() {
    SCRIPT="scripts/backup-to-blob.sh"

    mkdir -p test-folder
    echo "hello" > test-folder/file.txt
}

teardown() {
    rm -rf test-folder backups
}

@test "fails if no folder is provided" {
    run bash "$SCRIPT"

    [ "$status" -eq 1 ]
}

@test "creates a local backup" {
    run bash "$SCRIPT" test-folder --local-only

    [ "$status" -eq 0 ]
}

@test "creates a .tar.gz file" {
    bash "$SCRIPT" test-folder --local-only

    ls backups/*.tar.gz
}