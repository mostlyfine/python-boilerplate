.DEFAULT_GOAL := help
UV ?= uv

.PHONY: $(shell grep -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | sed 's/://')

help: ## Show available make targets
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "\033[36m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Initialize project (uv)
	@$(UV) init

sync: ## Install/sync Python dependencies (uv)
	@$(UV) sync

check: typecheck lintfix fmt sqlfmt test ## type-check/lint/format/test (ruff + ty + sqlfluff + pytest)

marimo: ## Launch marimo editor
	@$(UV) run marimo edit

run: ## Run main.py via uv
	@$(UV) run src/main.py

fmt: ## Format with ruff
	@$(UV) run ruff format

lint: ## Lint with ruff (no auto-fix)
	@$(UV) run ruff check

lintfix: ## Lint with ruff (auto-fix)
	@$(UV) run ruff check --fix

typecheck: ## Type-check with ty
	@$(UV) run ty check

test: ## Run tests with pytest
	@$(UV) run pytest

sqllint: ## Lint SQL files with sqlfluff (no auto-fix)
	@$(UV) run sqlfluff lint --ignore-local-config --config .sqlfluff

sqlfmt: ## Format SQL files with sqlfluff (auto-fix)
	@$(UV) run sqlfluff fix --ignore-local-config --config .sqlfluff

clean: ## Remove common local caches
	@rm -rf .ruff_cache .pytest_cache __pycache__ .mypy_cache .ty_cache *.pyc
