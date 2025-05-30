#
### ONLY USED TO SETUP LOCAL DEV ENVIRONMENT
#

.DEFAULT_GOAL := install

#################################################
# Target shortcuts

all: install

clean: env/clean

install: env/sync

lock: req/lock

upgrade: req/upgrade

ruff: ruff/check

#################################################
### Targets
.PHONY: \
	env/clean \
	env/sync \
	req/lock \
	req/upgrade \
	ruff/check

env/clean:
	rm -rf .venv/

env/sync:
	uv sync

req/lock:
	uv lock

req/upgrade: ${venv}
	uv lock --upgrade

ruff/check:
	ruff check --select I --no-fix . || true
	ruff format --check .
