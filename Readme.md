# Python Boilerplate with mise & uv

A modern Python development environment boilerplate featuring fast and maintainable project setup with `mise` and `uv`.

> Reference: https://zenn.dev/ohashi_reon/articles/230e7ee6989233

## Features

- **mise**: Environment variable management, task runner, Python/uv version management
- **uv**: Fast virtual environment creation and package management
- **Ruff**: High-performance linter and formatter
- **ty**: Python type checker
- **marimo**: Interactive notebook environment

## Prerequisites

- [mise](https://mise.jdx.dev/) installation required

```bash
# macOS/Linux
curl https://mise.run | sh

# or via Homebrew
brew install mise
```

## Setup

```bash
# Install required tools with mise (uv, etc.)
mise install

# Install Python3 and Python package dependencies
mise run sync
# or shorthand: mise run s
```

## Usage

### Running Tasks

Execute various commands using Makefile:

```bash
# Sync dependencies
make sync

# Code check (Ruff + ty)
make  check

# Launch marimo notebook
make marimo

```

### Running Python Scripts

```bash
# Run Python via uv (no manual virtual environment activation required)
uv run main.py
```

### Package Management

Use `uv` instead of traditional pip commands:

```bash
# Add a package
uv add <package-name>

# Add a development package
uv add --group dev <package-name>

# Sync dependencies
uv sync

# Remove a package
uv remove <package-name>
```

## Project Structure

```
.
├── mise.local.toml      # mise configuration (tool versions)
├── pyproject.toml       # Project metadata and dependencies
├── uv.lock              # Dependency lock file
├── .python-version      # Python version specification
├── main.py              # Sample entry point
└── .venv/               # Virtual environment (auto-generated)
```

## Key Changes

Differences from traditional Python development:

| Traditional Method | This Project |
|-------------------|--------------|
| `source .venv/bin/activate` | Use `uv run` |
| `pip install -r requirements.txt` | `uv add` or `uv sync` |
| Version management with `pyenv` | Unified management with `mise` |
| Multiple tool configuration files | Consolidated in `mise.local.toml` |

## Development Tools

- **Ruff**: Linting and code formatting
- **ty**: Type checking (mypy compatible)
- **marimo**: Reactive Python notebook environment

## License

MIT
