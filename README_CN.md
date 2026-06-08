# Jimmy 的 Codex Skills

[English README](README.md)

这个仓库现在是一个个人 Codex skills 目录。每个 skill 都放在 `skills/` 下面的独立目录里，这样以后不管你继续新增 prompt 类、goal 类、运维类还是代码类 skill，都不会把指令、参考资料和脚本混在仓库根目录。

## Skills

| Skill | 用途 | 安装 URL |
| --- | --- | --- |
| `gpt-prompter` | 把粗略需求整理成生产可用的 GPT-5.5 prompt。 | `https://github.com/jiaweizhang1995/gpt-prompter/tree/main/skills/gpt-prompter` |
| `goal-prompt-writer` | 把粗略需求整理成可直接复制的 Codex `/goal` prompt。 | `https://github.com/jiaweizhang1995/gpt-prompter/tree/main/skills/goal-prompt-writer` |

## 安装

把单个 skill 的目录 URL 交给 Codex 安装：

```text
$skill-installer install https://github.com/jiaweizhang1995/gpt-prompter/tree/main/skills/gpt-prompter
```

也可以 clone 之后手动复制：

```bash
mkdir -p ~/.codex/skills
cp -R skills/gpt-prompter ~/.codex/skills/gpt-prompter
cp -R skills/goal-prompt-writer ~/.codex/skills/goal-prompt-writer
```

安装或更新后，重启 Codex，让它重新加载 skill metadata。

## 仓库结构

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

每个 skill 目录都应该自包含：

- `SKILL.md` 必须存在，并且 frontmatter 里要有 `name` 和 `description`。
- `references/` 放只有需要时才读取的长参考资料。
- `scripts/` 放这个 skill 专用的确定性脚本。
- `agents/` 放 Codex app metadata，比如 `openai.yaml`。

## 新增或更新 Skill

如果 skill 已经在你的本地 Codex skills 目录里：

```bash
./scripts/import-local-skill.sh goal-prompt-writer
git diff -- skills/goal-prompt-writer
```

如果这是一个新 skill，再把它补到上面的 `Skills` 表格里。

尽量让每个 skill 目标窄、可移植、能独立安装。除非这个 skill 明确是个人或项目专用，否则不要把某个仓库的隐含假设写死进去。
