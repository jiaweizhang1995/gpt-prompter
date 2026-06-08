# Jimmy's Codex Skills

[中文说明](README_CN.md)

This repository is a personal Codex skills catalog. Each skill lives in its own folder under `skills/`, so the repo can grow beyond the original `gpt-prompter` skill without mixing instructions, references, and helper files.

## Skills

| Skill | Purpose | Install URL |
| --- | --- | --- |
| `gpt-prompter` | Turn rough intent into a production-ready GPT-5.5 prompt. | `https://github.com/jiaweizhang1995/gpt-prompter/tree/main/skills/gpt-prompter` |
| `goal-prompt-writer` | Draft copy-ready Codex `/goal` prompts from rough requirements. | `https://github.com/jiaweizhang1995/gpt-prompter/tree/main/skills/goal-prompt-writer` |

## Install

Install a single skill by giving Codex the skill directory URL:

```text
$skill-installer install https://github.com/jiaweizhang1995/gpt-prompter/tree/main/skills/gpt-prompter
```

Or install manually after cloning:

```bash
mkdir -p ~/.codex/skills
cp -R skills/gpt-prompter ~/.codex/skills/gpt-prompter
cp -R skills/goal-prompt-writer ~/.codex/skills/goal-prompt-writer
```

Restart Codex after installing or updating skills so the metadata is reloaded.

## Repository Layout

```text
.
├── skills/
│   ├── gpt-prompter/
│   │   ├── SKILL.md
│   │   ├── agents/
│   │   └── references/
│   └── goal-prompt-writer/
│       ├── SKILL.md
│       └── agents/
└── scripts/
    └── import-local-skill.sh
```

Each skill folder should be self-contained:

- `SKILL.md` is required and must include `name` and `description` frontmatter.
- `references/` stores longer guidance loaded only when needed.
- `scripts/` stores deterministic helper scripts used by that specific skill.
- `agents/` stores Codex app metadata such as `openai.yaml`.

## Add Or Update A Skill

When a skill already exists in your local Codex skills folder:

```bash
./scripts/import-local-skill.sh goal-prompt-writer
git diff -- skills/goal-prompt-writer
```

Then update the `Skills` table above if this is a new skill.

Keep each skill narrow, portable, and easy to install independently. Avoid repository-specific assumptions inside a skill unless the skill is explicitly personal or project-local.
