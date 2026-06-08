---
name: goal-prompt-writer
description: Draft copy-ready Codex `/goal` prompts from rough user requirements. Use when the user asks to write, generate, polish, or convert a task into a Codex Goal prompt; mentions `/goal`, goal mode, Codex goal, "直接复制给 Codex", "帮我写 goal prompt", "把需求变成 /goal", "持续执行目标", or gives a feature/fix/migration objective and wants a reusable goal command. Return text only; do not start or activate the goal unless the user explicitly asks after the draft.
---

# Goal Prompt Writer

Turn a rough requirement into a copy-ready `/goal` command that another Codex thread can execute as a persistent objective.

## Output Contract

Default to one fenced `text` block containing a single `/goal ...` prompt. Add at most one short sentence before it when helpful. Do not call `create_goal`, do not activate Goal mode, and do not make code changes.

Write in the user's language. If the user writes Chinese, output Chinese.

Keep the goal under 4,000 characters. If the objective needs more detail, ask the goal to read a specific file instead of embedding a long spec.

## Goal Shape

Every final prompt should include:

- Outcome: what must be true when done.
- Context: repo, files, systems, symptoms, or product behavior that matter.
- Implementation scope: the concrete slices Codex should pursue.
- Constraints: behavior/API/design/security/data that must not regress.
- Verification: commands, tests, logs, screenshots, benchmarks, or manual checks.
- Iteration policy: how Codex should choose the next step after each result.
- Blocked condition: when to stop and what evidence to report.

Use this compact structure:

```text
/goal <desired end state>, verified by <specific evidence>, while preserving <constraints>. Context: <relevant repo/system facts>. Implement: <ordered slices>. Between iterations, <next-action policy>. If blocked, stop with <attempts, evidence, blocker, next input needed>.
```

## Workflow

1. Restate the user's rough objective internally in one sentence.
2. Infer safe defaults from the current thread and repo. For coding work in a visible repository, inspect lightweight context only when it materially improves file names, commands, or verification.
3. Ask a clarifying question only when a wrong assumption would be risky. Otherwise write the goal with explicit assumptions.
4. Convert vague desires into observable success criteria. Prefer "verified by tests/build/curl/browser/benchmark/log evidence" over "make it better".
5. Include boundaries that protect user work: preserve existing behavior, avoid unrelated refactors, avoid destructive operations, and respect dirty worktrees.
6. Make verification runnable. If exact commands are unknown, ask Codex inside the goal to discover and run the repo's relevant checks, then report what was run.

## Style Rules

- Be specific enough for autonomous work, but not so prescriptive that Codex cannot adapt to the codebase.
- Use ordered implementation slices for multi-part work.
- Prefer concrete nouns: file names, endpoints, commands, metrics, user-visible behavior.
- Include "do not" constraints only for real risks.
- Make the final prompt copy-pasteable; avoid commentary after the fenced block.
- Never represent "ran out of budget" or "did some work" as success.

## Useful Patterns

For a feature:

```text
/goal Implement <feature> so <user-visible outcome>, verified by <tests/build/manual check>, while preserving <compatibility constraints>. Context: <files/endpoints/components>. Implement <slice 1>, <slice 2>, and <slice 3>. Between iterations, run the smallest relevant check and choose the next failing or unimplemented slice. If blocked, stop with attempted paths, evidence, blocker, and the next decision needed.
```

For a bug:

```text
/goal Fix <bug/symptom>, verified by reproducing the failure before the fix when possible and then passing <test/check>, while preserving existing public behavior. Context: <error/log/files>. Between iterations, state the observed failure, hypothesis, change, and next check. If blocked, stop with repro attempts, evidence, blocker, and next input needed.
```

For a migration/refactor:

```text
/goal Complete <migration> across <scope>, verified by <build/typecheck/tests/search checks>, while preserving user-facing behavior and avoiding unrelated cleanup. Migrate one coherent slice at a time, run relevant checks, and choose the next slice from remaining references. If blocked, stop with unmigrated surfaces, failed checks, blocker, and next input needed.
```
