# GPT Prompter

[English README](README.md)

GPT Prompter 是一个 Codex skill，用来为 GPT-5.5 编写生产可用的 prompt。它可以帮助 Codex 创建、改写、迁移和诊断 prompt，并参考 OpenAI GPT-5.5 的 outcome-first prompting、工具调用、检索预算、验证规则和前端 UI prompt 指南。

## 安装

跟你的 Codex 说：

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

也可以用它来：

- 把旧 prompt 改写成 GPT-5.5 风格
- 为 GPT-5.5 coding agent 写 prompt
- 加入检索、引用和事实约束
- 加入验证规则和停止条件
- 基于 OpenAI 前端指南生成 UI/frontend prompt

## 包含内容

- `SKILL.md`：Codex skill 主指令
- `references/gpt-5.5-prompt-guidance.md`：GPT-5.5 prompt 规则
- `references/frontend-prompt.md`：前端 prompt 指南
- `references/prompt-patterns.md`：可复用 prompt 模板

