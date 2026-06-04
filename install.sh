#!/usr/bin/env bash
set -euo pipefail

# Symlink claude-anki into ~/.claude so the /anki:* commands and the anki skill load.
# Works regardless of where you clone the repo (each machine resolves its own path).

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE="${HOME}/.claude"

mkdir -p "${CLAUDE}/commands" "${CLAUDE}/skills"

# Stable data root: lessons/template/README are read through this path, so it is
# identical on every machine no matter where the repo lives on disk.
ln -sfn "${REPO}"             "${CLAUDE}/anki-data"
ln -sfn "${REPO}/commands"    "${CLAUDE}/commands/anki"
ln -sfn "${REPO}/skills/anki" "${CLAUDE}/skills/anki"

echo "linked:"
echo "  ${CLAUDE}/anki-data     -> ${REPO}"
echo "  ${CLAUDE}/commands/anki -> ${REPO}/commands"
echo "  ${CLAUDE}/skills/anki   -> ${REPO}/skills/anki"
echo
echo "restart Claude Code to pick up: /anki:today  /anki:yesterday  /anki:review  /anki:list"
