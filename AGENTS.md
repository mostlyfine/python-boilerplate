# Project Guidelines

## Code Style
- Source of truth is `pyproject.toml` + `.vscode/settings.json`.
- Use Ruff for lint/format (`make lint`, `make lintfix`, `make fmt`).
- Keep line length at 120 (`[tool.ruff].line-length = 120`) and double quotes (`[tool.ruff.format].quote-style = "double"`).
- Follow Google-style docstring rules enforced by Ruff pydocstyle (`[tool.ruff.lint].pydocstyle.convention = "google"`).
- Keep Ruff target-version aligned with `pyproject.toml` (`[tool.ruff].target-version = "py312"`).
- Write type hints in production code and tests (see `src/main.py`, `tests/test_main.py`).

## Architecture
- Minimal single-module app: runtime entry is `src/main.py` with `main()`.
- Tests live in `tests/`; `tests/test_main.py` validates output behavior of `main.main()`.
- Pytest import path is `src` (`[tool.pytest.ini_options].pythonpath = ["src"]`).
- Keep new features in `src/` and mirror with tests under `tests/`.

## Build and Test
- Setup tools: `mise install`.
- Sync deps: `make sync` (uses `uv sync`).
- Run app: `make run`.
- Validate changes: `make check` (runs `typecheck + lintfix + fmt + test`).
- Focused commands: `make typecheck`, `make lint`, `make lintfix`, `make fmt`, `make test`.
- Utility commands from `Makefile`: `make help`, `make init`, `make clean`, `make marimo`.
- `make test` uses pytest options from `pyproject.toml` (`-v --cov --cov-branch --cov-report=term:skip-covered`).

## Project Conventions
- Prefer Make targets over raw commands so local/CI behavior stays consistent.
- Use `uv` workflow for dependencies; avoid introducing `pip`/`requirements.txt` flow unless requested.
- Keep module imports compatible with pytest `pythonpath = ["src"]`.
- Apply TDD when adding behavior: add/adjust tests in `tests/` before or with implementation.
- Repository policy note: branch naming / PR title / commit message conventions are not explicitly defined in tracked docs.

## Integration Points
- Environment/toolchain is managed via `mise.local.toml` + `uv` (including `.venv` behavior and env loading).
- VS Code auto-format/lint integration is configured in `.vscode/settings.json`.
- MCP servers are configured in `.vscode/mcp.json` (`fetch`, `context7`).
- Optional interactive work uses `make marimo`.
- Debug/test launch presets are available in `.vscode/launch.json`.

## Security
- No dedicated security scanner is configured in Makefile; do not claim security gates that do not exist.
- Treat values loaded from `.env` (via `[env]._.file` in `mise.local.toml`) as sensitive; never hardcode secrets.
- Respect local Python environment behavior in `mise.local.toml` (`_.python.venv`, `UV_PYTHON`) and avoid bypassing it with ad-hoc env setup.
- Keep dependency updates in `pyproject.toml` and `uv.lock` together to preserve reproducibility and reviewability.
