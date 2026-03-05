# Python Boilerplate with mise & uv

<div align="center">

[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![ty](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ty/main/assets/badge/v0.json)](https://github.com/astral-sh/ty)
[![Python](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://python.org)

[![Lint](https://github.com/mostlyfine/python-boilerplate/actions/workflows/lint.yml/badge.svg)](https://github.com/mostlyfine/python-boilerplate/actions/workflows/lint.yml)
[![Format](https://github.com/mostlyfine/python-boilerplate/actions/workflows/format.yml/badge.svg)](https://github.com/mostlyfine/python-boilerplate/actions/workflows/format.yml)
[![Typecheck](https://github.com/mostlyfine/python-boilerplate/actions/workflows/typecheck.yml/badge.svg)](https://github.com/mostlyfine/python-boilerplate/actions/workflows/typecheck.yml)
[![Test](https://github.com/mostlyfine/python-boilerplate/actions/workflows/test.yml/badge.svg)](https://github.com/mostlyfine/python-boilerplate/actions/workflows/test.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/mostlyfine/python-boilerplate/blob/main/LICENSE)

</div>

A modern Python development environment boilerplate using **mise** for toolchain management and **uv** for blazing-fast package management, with **Ruff** for linting/formatting, **ty** for type checking, **SQLFluff** for SQL linting, and **Dev Container** support.

---

## 📋 Table of Contents

- [✨ Features](#-features)
- [🚀 Quick Start](#-quick-start)
  - [Using Dev Container (Recommended)](#using-dev-container-recommended)
  - [Local Setup](#local-setup)
- [📚 Development Workflow](#-development-workflow)
  - [Installing Dependencies](#installing-dependencies)
  - [Running Tasks](#running-tasks)
  - [Package Management](#package-management)
- [🏗️ Project Structure](#️-project-structure)
- [⚙️ Configuration](#️-configuration)
  - [Ruff](#ruff)
  - [ty](#ty)
  - [SQLFluff](#sqlfluff)
  - [Pytest](#pytest)
- [🔄 Comparison with Traditional Python Development](#-comparison-with-traditional-python-development)
- [📄 License](#-license)

---

## ✨ Features

- 🚀 **Ultra-fast package management** with [uv](https://github.com/astral-sh/uv) (10–100x faster than pip)
- 🛠️ **Unified toolchain management** with [mise](https://mise.jdx.dev/) (Python version, uv, environment vars)
- ⚡ **Lightning-fast linting & formatting** with [Ruff](https://github.com/astral-sh/ruff) (replaces Black, isort, Flake8)
- 🔍 **Type checking** with [ty](https://github.com/astral-sh/ty)
- 🗄️ **SQL linting & formatting** with [SQLFluff](https://sqlfluff.com/) (BigQuery dialect)
- ✅ **Testing with coverage** via pytest + pytest-cov
- 🐳 **Dev Container ready** — reproducible environment with VS Code
- 📓 **Interactive notebooks** with [marimo](https://marimo.io/)
- 🎯 **Task automation** via `Makefile` (`make check`, `make fmt`, etc.)

---

## 🚀 Quick Start

### Using Dev Container (Recommended)

**Prerequisites**: [Docker](https://www.docker.com/) and [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

```bash
git clone https://github.com/mostlyfine/python-boilerplate.git
cd python-boilerplate
code .
```

When prompted, click **"Reopen in Container"**. uv is installed automatically via `postCreateCommand`.

### Local Setup

**Prerequisites**: [mise](https://mise.jdx.dev/)

```bash
# Install mise (macOS/Linux)
curl https://mise.run | sh
# or via Homebrew
brew install mise

# Clone the repository
git clone https://github.com/mostlyfine/python-boilerplate.git
cd python-boilerplate

# Install tools (uv, Python, etc.) and sync dependencies
mise install
make sync
```

---

## 📚 Development Workflow

### Installing Dependencies

```bash
# Sync all dependencies (including dev)
make sync          # shorthand for uv sync

# Or use uv directly
uv sync
uv sync --no-dev   # production only
```

### Running Tasks

All common tasks are available via `Makefile`:

```bash
make help          # Show all available targets

# Full validation pipeline (typecheck + lintfix + fmt + sqlfmt + test)
make check

# Individual tasks
make typecheck     # Type-check with ty
make lint          # Lint with Ruff (no auto-fix)
make lintfix       # Lint with Ruff (auto-fix)
make fmt           # Format with Ruff
make sqllint       # Lint SQL files with SQLFluff
make sqlfmt        # Format SQL files with SQLFluff
make test          # Run pytest with coverage

# Run the application
make run           # uv run src/main.py

# Launch marimo interactive notebook (port 2718)
make marimo

# Clean caches
make clean
```

### Package Management

Use `uv` instead of traditional `pip`:

```bash
uv add <package>              # Add a runtime dependency
uv add --group dev <package>  # Add a dev dependency
uv remove <package>           # Remove a dependency
uv sync                       # Sync lockfile to .venv
```

---

## 🏗️ Project Structure

```
.
├── .devcontainer/
│   └── devcontainer.json    # Dev Container configuration (Python 3.11-bookworm)
├── .github/
│   └── instructions/        # Coding guidelines for Copilot
├── .vscode/                 # VS Code settings, launch configs, MCP servers
├── src/
│   └── main.py              # Application entry point
├── tests/
│   └── test_main.py         # pytest test suite
├── mise.local.toml          # mise toolchain & env configuration
├── pyproject.toml           # Project metadata and dependencies
├── ruff.toml                # Ruff lint/format configuration
├── ty.toml                  # ty type checker configuration
├── .sqlfluff                # SQLFluff configuration (BigQuery)
├── pytest.ini               # pytest options and coverage settings
├── Makefile                 # Task automation
└── uv.lock                  # Locked dependency tree
```

---

## ⚙️ Configuration

### Ruff

Configured in [ruff.toml](ruff.toml):

| Setting | Value |
|---------|-------|
| `line-length` | `120` |
| `target-version` | `py312` |
| `quote-style` | `double` |
| `pydocstyle.convention` | `google` |
| Rules enabled | `F` (pyflakes), `E`/`W` (pycodestyle), `I` (isort), `D` (pydocstyle) |

### ty

Configured in [ty.toml](ty.toml) — checks `src/` and `tests/`, excludes `__pycache__`, `.venv`, etc.

### SQLFluff

Configured in [.sqlfluff](.sqlfluff):

| Setting | Value |
|---------|-------|
| Dialect | `bigquery` |
| Max line length | `80` |
| Indentation | `2 spaces` |

### Pytest

Configured in [pytest.ini](pytest.ini):

| Setting | Value |
|---------|-------|
| `pythonpath` | `src` |
| `testpaths` | `tests` |
| Coverage | branch coverage, terminal report |

---

## 🔄 Comparison with Traditional Python Development

| Traditional Method | This Project |
|---|---|
| `source .venv/bin/activate` | Use `uv run` or `make run` |
| `pip install -r requirements.txt` | `uv add` / `uv sync` |
| `pyenv` for Python version | Unified via `mise` |
| `black` + `isort` + `flake8` separately | Single `ruff` command |
| `mypy` for type checking | `ty` (faster, Astral) |
| Manual SQL style enforcement | `sqlfluff` lint & fix |
| Multiple tool config files | `ruff.toml`, `ty.toml`, `.sqlfluff` — each focused |

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
