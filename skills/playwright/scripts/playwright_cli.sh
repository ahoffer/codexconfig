#!/usr/bin/env bash
set -euo pipefail

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx is required but not found on PATH." >&2
  exit 1
fi

CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
LOCAL_CLI="$CODEX_HOME/playwright/node_modules/.bin/playwright-cli"

has_session_flag="false"
for arg in "$@"; do
  case "$arg" in
    --session|--session=*)
      has_session_flag="true"
      break
      ;;
  esac
done

if [[ -x "$LOCAL_CLI" ]]; then
  cmd=("$LOCAL_CLI")
else
  cmd=(npx --yes --package @playwright/cli playwright-cli)
fi
if [[ "${has_session_flag}" != "true" && -n "${PLAYWRIGHT_CLI_SESSION:-}" ]]; then
  cmd+=(--session "${PLAYWRIGHT_CLI_SESSION}")
fi
cmd+=("$@")

exec "${cmd[@]}"
