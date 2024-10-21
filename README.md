<<<<<<< HEAD
# Hypertube

## Project Overview
Hypertube is a web application that enables users to search for and watch videos directly on the site. The application integrates a video player and uses the BitTorrent protocol to download videos while streaming them simultaneously. This means users can start watching the video as it's downloading, without waiting for the full download to complete.

To enhance search capabilities, the system queries at least two external sources for video content. Users can select a video, which will be downloaded from the server and streamed to the player directly.

### Key Features
- **Search Engine**: Queries multiple external sources for video content.
- **Video Streaming**: Supports streaming videos while downloading via BitTorrent.
- **Authentication**: Custom authentication provided by the `auths` app.
- **Dependency Management**: Managed with Poetry, with support scripts for installing dependencies and running migrations.
- **Pre-Commit Hooks**: Formatting enforced using `flake8` to maintain code quality.
- **Optional Docker Support**: Docker and Docker Compose are provided to optionally run the project in a containerized environment.

## Table of Contents
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [Running the Project](#running-the-project)
- [Docker Setup (Optional)](#docker-setup-optional)
- [Development Workflow](#development-workflow)
- [Code Style](#code-style)
- [Contributing](#contributing)
- [License](#license)

## Installation

### Prerequisites
Before you start, ensure you have the following tools installed:
- **Python 3.9+**
- **Poetry**: For dependency management.
- **PostgreSQL**: The project uses PostgreSQL as its database.

### Steps to Install

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd hypertube


2. **Install Dependencies**:
   Run the script `check_dependencies.sh` to install all dependencies using Poetry:

   ```bash
   ./check_dependencies.sh


## Set Up Environment Variables

### create env variable
   Run the following command
   ```bash
   cp .env.example .env
=======
>>>>>>> 15edbe2... feat: set up project structure
