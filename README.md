# GPT Prompter

[中文说明](README_CN.md)

GPT Prompter is a Codex skill for writing production-ready prompts for GPT-5.5. It helps Codex create, rewrite, migrate, and diagnose prompts using OpenAI's GPT-5.5 guidance for outcome-first prompting, tool use, retrieval budgets, validation, and frontend UI prompts.

## Install

Tell your Codex:

```text
Install this skill from https://github.com/jiaweizhang1995/gpt-prompter.git
```

Codex should clone the skill and install it into your local skills directory.

## Use

After installation, ask Codex:

```text
Use $gpt-prompter to turn this rough idea into a production-ready GPT-5.5 prompt:
[your idea]
```

GPT-5.5 works best with shorter, outcome-first prompts: describe what good looks like, the constraints that matter, the evidence available, and what the final answer should contain. This skill helps Codex turn rough instructions into that shape, adding stopping rules, evidence behavior, validation checks, and frontend guidance only when they improve the result.

## What's Included

- `SKILL.md`: the Codex skill instructions
- `references/gpt-5.5-prompt-guidance.md`: GPT-5.5 prompt rules
- `references/frontend-prompt.md`: frontend prompt guidance
- `references/prompt-patterns.md`: reusable prompt templates
