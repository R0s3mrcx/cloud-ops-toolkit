# Cloud Ops Toolkit

![CI](https://github.com/r0s3mrcx/cloud-ops-toolkit/actions/workflows/ci.yml/badge.svg)
![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=white)
![License](https://img.shields.io/github/license/r0s3mrcx/cloud-ops-toolkit)

A collection of Bash scripts that automate common Linux, Docker, and Azure operational tasks.

The repository includes reusable scripts, automated testing with Bats, and continuous integration using GitHub Actions.

# Architecture

```
Linux Server
      │
      ▼
 Bash Scripts
      │
 ┌────┼─────────────┐
 ▼    ▼             ▼
Server Docker     Backup
Health Health     to Azure Blob
      │
      ▼
 Automated Tests (Bats)
      │
      ▼
 GitHub Actions CI
```

# Available Scripts

## server-health.sh

Checks the health of a Linux server.

Verifies:

- RAM usage
- Disk usage
- Internet connectivity
- Docker status

Returns:

- Exit code `0` → All checks passed
- Exit code `1` → One or more checks failed

Run:

```bash
./scripts/server-health.sh
```

## docker-health.sh

Checks whether Docker is installed and running.

Displays:

- Docker version
- Running containers
- All containers
- Docker images
- Total running containers

Run:

```bash
./scripts/docker-health.sh
```

## backup-to-blob.sh

Creates a compressed `.tar.gz` archive from a directory.

Supports:

- Local backup only (`--local-only`)
- Upload to Azure Blob Storage using Azure CLI

Examples:

Local backup:

```bash
./scripts/backup-to-blob.sh ./my-folder --local-only
```
Azure upload:

```bash
az login

./scripts/backup-to-blob.sh ./my-folder
```

# Project Structure

```
cloud-ops-toolkit/
│
├── scripts/
│   ├── backup-to-blob.sh
│   ├── docker-health.sh
│   └── server-health.sh
│
├── tests/
│   ├── backup-to-blob.bats
│   ├── docker-health.bats
│   └── server-health.bats
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── README.md
├── LICENSE
└── .gitignore
```

# Requirements

- Bash
- Docker (required for `docker-health.sh`)
- Azure CLI (required for Azure uploads)
- Bats (optional, for running tests locally)
- ShellCheck (optional)

# How to Run

Clone the repository:

```bash
git clone git@github.com:R0s3mrcx/cloud-ops-toolkit.git

cd cloud-ops-toolkit
```

Make the scripts executable:

```bash
chmod +x scripts/*.sh
```

# Testing

The project includes automated tests written with Bats.

The tests verify:

- Exit codes
- Expected output
- Backup creation
- Archive contents
- Script execution

Run all tests:

```bash
bats tests/
```

# CI

Every push triggers a GitHub Actions workflow that runs:

1. **ShellCheck** - Static analysis for Bash scripts.
2. **Bats** - Automated tests.

The workflow validates the scripts automatically without requiring Azure credentials.

# Future Improvements

- CPU usage monitoring
- Log file support
- Automatic backup retention
- Restore backup script
- Email or Slack notifications
- Azure authentication using Managed Identity

# License

This project is licensed under the MIT License.

See the `LICENSE` file for details.
