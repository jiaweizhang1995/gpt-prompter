# GPT Prompter

[English README](README.md)

GPT Prompter 是一个 Codex skill，用来为 GPT-5.5 编写生产可用的 prompt。它可以帮助 Codex 创建、改写、迁移和诊断 prompt，并参考 OpenAI GPT-5.5 的 outcome-first prompting、工具调用、检索预算、验证规则和前端 UI prompt 指南。

## 安装

使用 `npx` 安装：

```bash
npx skills add https://github.com/jiaweizhang1995/gpt-prompter.git -g -a codex -y
```

旧的 `npx add-skill` 包已经废弃，请使用 `npx skills add`。

也可以直接跟你的 Codex 说：

```text
安装这个 skill：https://github.com/jiaweizhang1995/gpt-prompter.git
```

Codex 会知道如何从这个 GitHub 仓库安装 skill。

## 使用

安装后，你可以这样对 Codex 说：

```text
Use $gpt-prompter to turn this rough idea into a production-ready GPT-5.5 prompt:
[你的想法]
```

GPT-5.5 更适合简短、结果导向的 prompt：说明什么是好的结果、哪些约束重要、有哪些可用证据，以及最终回答应该包含什么。这个 skill 会帮助 Codex 把粗略想法整理成这种结构，并只在有帮助时加入停止规则、证据处理、验证检查和前端指导。

## 包含内容

- `SKILL.md`：Codex skill 主指令
- `references/gpt-5.5-prompt-guidance.md`：GPT-5.5 prompt 规则
- `references/frontend-prompt.md`：前端 prompt 指南
- `references/prompt-patterns.md`：可复用 prompt 模板
