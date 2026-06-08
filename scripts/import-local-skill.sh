#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <skill-name>" >&2
  exit 2
fi

skill_name="$1"
codex_home="${CODEX_HOME:-$HOME/.codex}"
source_dir="$codex_home/skills/$skill_name"
target_dir="skills/$skill_name"

if [[ ! "$skill_name" =~ ^[a-z0-9][a-z0-9-]*$ ]]; then
  echo "Invalid skill name: $skill_name" >&2
  echo "Use lowercase letters, numbers, and hyphens." >&2
  exit 2
fi

if [[ ! -f "$source_dir/SKILL.md" ]]; then
  echo "Missing source skill: $source_dir/SKILL.md" >&2
  exit 1
fi

mkdir -p skills
rm -rf "$target_dir"
mkdir -p "$target_dir"

rsync -a \
  --exclude '.DS_Store' \
  --exclude '.git' \
  --exclude '__pycache__' \
  --exclude '*.pyc' \
  "$source_dir/" "$target_dir/"

echo "Imported $source_dir -> $target_dir"
echo "Review with: git diff -- $target_dir"
