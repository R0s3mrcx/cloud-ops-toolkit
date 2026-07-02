# Cloud Ops Toolkit

![CI](https://github.com/r0s3mrcx/cloud-ops-toolkit/actions/workflows/ci.yml/badge.svg)
![License](https://img.shields.io/github/license/r0s3mrcx/cloud-ops-toolkit)
![Last Commit](https://img.shields.io/github/last-commit/r0s3mrcx/cloud-ops-toolkit)
![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions&logoColor=white)

A small collection of Bash scripts for common Linux and Cloud operations.

This project was created to practice Bash scripting, Linux administration, Docker, Azure CLI, and CI/CD using GitHub Actions.

The scripts are intentionally kept simple to focus on Bash fundamentals and Linux administration concepts.

# Features

## 1. Server Health Check

Checks the basic health of a Linux server.

It verifies:

- RAM usage
- Disk usage
- Internet connectivity
- Docker status

Returns:

- Exit code `0` → Everything is healthy.
- Exit code `1` → One or more checks failed.

Run:

```bash
./scripts/server-health.sh
```

## 2. Docker Health Check

Checks whether Docker is installed and running.

It also displays:

- Docker version
- Running containers
- All containers
- Docker images
- Total running containers

Run:

```bash
./scripts/docker-health.sh
```

## 3. Backup to Azure Blob Storage

Creates a compressed `.tar.gz` backup of a folder.

The backup can:

- Be stored locally (`--local-only`)
- Be uploaded to Azure Blob Storage using Azure CLI

Examples:

Create a local backup only:

```bash
./scripts/backup-to-blob.sh ./my-folder --local-only
```

Upload the backup to Azure:

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


# Automated Tests

The project includes automated tests written with **Bats**.

The tests verify things such as:

- Expected exit codes
- Expected output messages
- Backup creation
- Archive contents
- Script execution


# CI/CD

Every push automatically triggers a GitHub Actions workflow that runs:

- ShellCheck
- Bats tests

This helps verify that every script passes static analysis and basic testing before changes are merged.


# Technologies

- Bash
- Linux
- Docker
- Azure CLI
- GitHub Actions
- ShellCheck
- Bats


# Requirements

Before running the scripts you should have:

- Bash
- Docker (for `docker-health.sh`)
- Azure CLI (for Azure uploads)
- Bats (for running tests)
- ShellCheck (optional, used in CI)


# Installation

Clone the repository:

```bash
git clone https://github.com/r0s3mrcx/cloud-ops-toolkit.git
```

Go into the project:

```bash
cd cloud-ops-toolkit
```

Give execution permission to the scripts:

```bash
chmod +x scripts/*.sh
```

# What I Learned

While building this project I practiced:

- Bash scripting
- Linux commands
- Variables
- Conditional statements (`if`)
- Exit codes
- Basic error handling
- Docker CLI
- Azure CLI
- GitHub Actions
- ShellCheck
- Automated testing with Bats


# Future Improvements

Some ideas for future versions:

- Log file support
- CPU usage checks
- Email or Slack notifications
- Automatic backup retention
- Restore backup script
- Support for Azure Storage authentication using Managed Identity


# License

This project is licensed under the MIT License.

See the `LICENSE` file for details.
