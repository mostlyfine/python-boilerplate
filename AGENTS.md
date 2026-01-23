# Agents and Tools

This document describes the development agents and tools available in this project.

## Directory Structure

```
python-boilerplate/
├── .devcontainer/          # Development container configuration
├── .venv/                  # Virtual environment (generated)
├── .vscode/                # VS Code settings
├── src/                    # Application source code
│   └── main.py             # Main application entry point
├── tests/                  # Test files
│   └── test_main.py        # Test cases for main module
├── AGENTS.md               # This file - Agents and tools documentation
├── Makefile                # Task automation commands
├── Readme.md               # Project documentation
├── mise.local.toml         # Local mise configuration
├── pyproject.toml          # Python project metadata and dependencies
└── uv.lock                 # Locked dependency versions (generated)
```

### Key Files

- **pyproject.toml**: Defines project metadata, dependencies, and tool configurations (pytest, ruff, etc.)
- **Makefile**: Provides convenient commands for development tasks
- **mise.local.toml**: Local environment configuration for mise
- **uv.lock**: Lock file ensuring reproducible builds
- **src/main.py**: Application entry point
- **tests/test_main.py**: Basic test for the main module

## Development Environment Agents

### mise
- **Purpose**: Environment variable management, task runner, and version management
- **Configuration**: `.mise.toml`, `mise.local.toml`
- **Usage**: Manages Python, uv, and other tool versions automatically
- **Key Commands**:
  - `mise install` - Install all required tools
  - `make sync` - Sync dependencies
  - `make check` - Run code quality checks

### uv
- **Purpose**: Fast Python package installer and virtual environment manager
- **Benefits**: Significantly faster than pip for dependency installation
- **Usage**: Automatically used by mise for package management
- **Key Features**:
  - Rapid dependency resolution
  - Virtual environment creation
  - Lock file management

## Code Quality Agents

### Ruff
- **Purpose**: High-performance Python linter and formatter
- **Speed**: 10-100x faster than traditional tools (flake8, pylint, black)
- **Configuration**: Defined in `pyproject.toml`
- **Features**:
  - Linting (syntax and style checks)
  - Automatic code formatting
  - Compatible with Black formatter rules

### ty
- **Purpose**: Python type checker
- **Usage**: Static type analysis for enhanced code safety
- **Benefits**:
  - Catches type-related bugs early
  - Improves code documentation
  - Better IDE support

## Development Agents

### marimo
- **Purpose**: Interactive Python notebook environment
- **Version**: >=0.18.4
- **Features**:
  - Reactive notebook execution
  - Better than traditional Jupyter for reproducibility
  - Modern UI/UX

### pytest
- **Purpose**: Testing framework
- **Version**: >=8.0.0
- **Configuration**: Test settings in `pyproject.toml`
- **Test Location**: `tests/` directory

## Workflow

1. **Setup**: `mise install` → `mise trust`
2. **Development**: Write code with type hints
3. **Quality Check**: `make check` (Ruff + ty)
4. **Testing**: Run tests with pytest
5. **Interactive Development**: Use marimo for exploration

## Makefile Commands

This project uses Makefile for common development tasks. All commands are executed via `make <target>`.

### Program Execution
```bash
make run          # Run main.py via uv
```

### Testing
```bash
make test         # Run all tests with pytest
```

### Type Checking
```bash
make typecheck    # Type-check with ty
```

### Formatting
```bash
make fmt          # Format code with ruff
```

### Linting
```bash
make lint         # Lint with ruff (no auto-fix)
make lintfix      # Lint with ruff (auto-fix)
```

### Combined Checks
```bash
make check        # Run all checks: typecheck + lintfix + fmt + test
```

### Other Commands
```bash
make sync         # Install/sync Python dependencies
make marimo       # Launch marimo editor
make clean        # Remove common local caches
make help         # Show all available targets
```

## CI/CD Recommendations

Consider integrating these agents into your CI pipeline:
- Ruff for linting and formatting checks
- ty for type checking
- pytest for automated testing

## References

- [mise Documentation](https://mise.jdx.dev/)
- [uv Documentation](https://github.com/astral-sh/uv)
- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [marimo Documentation](https://marimo.io/)
