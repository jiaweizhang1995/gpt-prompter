# GPT-5.5 Prompt Guidance Reference

Source: https://developers.openai.com/api/docs/guides/prompt-guidance
Reviewed: 2026-05-30

Use this file to turn official GPT-5.5 prompt guidance into practical prompt-writing decisions. It is a working summary, not a verbatim copy of the docs.

## Core Model Posture

GPT-5.5 generally benefits from shorter, clearer, outcome-focused prompts. Start by defining:

- the outcome
- success criteria
- constraints and side-effect limits
- available context and evidence
- output contract
- stopping rules

Avoid carrying forward long legacy prompt stacks unless those instructions encode real product requirements.

## Reasoning Effort

Do not solve reasoning effort only in natural language if the user is using the API. Prefer an API note.

Recommended starting point:

- `medium`: balanced default for quality, reliability, latency, and cost.
- `low`: good first test for latency-sensitive workflows that still involve planning, tools, search, or multi-step judgment.
- `none`: reserve for latency-critical tasks that do not need reasoning or chained tool calls.
- `high` or `xhigh`: use only when evals show a measurable quality gain worth the extra latency and cost.

Prompt implication: do not force exhaustive deliberation by default. Add success criteria and stop rules instead.

## Personality and Collaboration Style

Use personality to shape how the assistant sounds. Use collaboration style to shape how it works.

Keep both short. They should not replace goals, success criteria, tool rules, output format, or stopping conditions.

Good fields to specify:

- warmth, directness, formality, humor, empathy
- when to ask versus assume
- how proactive the assistant should be
- how much context to provide
- how to handle uncertainty, risk, and correction

## Preambles for Tool-Heavy Workflows

For long, tool-heavy, or streaming workflows, add a short user-visible preamble rule:

```text
Before using tools for a multi-step task, send a brief update that acknowledges the request and states the first action. Keep updates short and high-signal.
```

Use this to improve perceived responsiveness. Do not require a preamble for trivial one-shot answers.

## Outcome-First Prompting

Prefer destination over route.

Instead of listing every internal step, state:

- what must be resolved
- what facts or actions must be completed
- what the final answer must contain
- what to do when required evidence or input is missing

Use process steps only when the order itself is required by policy, safety, product behavior, or tool constraints.

Use absolute words sparingly:

- Use `MUST`, `NEVER`, `ONLY` for true invariants.
- Use decision rules for judgment calls.

## Stop Rules

Every non-trivial agentic prompt should say when to stop, retry, ask, or answer.

Useful stop-rule patterns:

```text
Use the fewest useful tool loops, but do not let speed outrank correctness, required evidence, calculations, or required citations.
```

```text
After each tool result, decide whether the core request can now be answered with enough support. If yes, answer instead of searching again.
```

```text
If the missing information would materially change the answer, ask for the smallest missing input. Otherwise make a reasonable assumption and label it.
```

## Formatting and Verbosity

GPT-5.5 follows format and tone instructions well. Use that control deliberately.

Prefer API configuration for response length when available:

- `text.verbosity: low` for concise answers
- default `medium` for normal production responses

Prompt guidance:

- State audience and length when output quality depends on them.
- Use paragraphs by default for normal explanations and reports.
- Use bullets, tables, headers, or numbered lists only when they improve scanning or satisfy the product UI.
- For rewrites, tell the model what to preserve before asking it to polish.

Rewrite pattern:

```text
Preserve the artifact type, length, structure, and intent. Improve clarity, flow, and correctness quietly. Do not add new claims, new sections, or a more promotional tone unless requested.
```

## Grounding, Citations, and Retrieval Budgets

For factual or research prompts, define:

- which claims need support
- what sources are allowed
- how citations should appear
- when to search again
- what to do when evidence is weak or absent

Retrieval-budget pattern:

```text
Start with one broad retrieval pass using short, discriminative keywords. Search again only if a required fact, date, owner, parameter, source, or document is missing, or if the user asked for exhaustive coverage.
```

Missing-evidence pattern:

```text
Do not turn missing evidence into a factual negative. If support is insufficient, say what is known, what is unsupported, and what would be needed to answer.
```

Creative drafting guardrail:

```text
Use provided or retrieved facts for concrete product, customer, metric, roadmap, date, capability, or competitive claims. If support is thin, use placeholders or clearly labeled assumptions instead of inventing specifics.
```

## Prompt the Model to Check Its Work

When validation is possible, ask for it explicitly.

For coding:

```text
After changes, run the most relevant validation available: targeted unit tests, type checks, lint checks, build checks, or a minimal smoke test. If validation cannot be run, explain why and give the next best check.
```

For visual artifacts:

```text
Render before finalizing. Inspect for layout, clipping, spacing, missing content, and visual consistency. Revise until the rendered output matches the requirements.
```

For plans:

```text
Include requirements coverage, named files/APIs/systems, state transitions or data flow, validation checks, failure behavior, privacy/security considerations, and open questions that materially affect implementation.
```

## Phase Parameter for Responses Workflows

Prompt-level behavior:

- Ask for preambles or intermediate user-visible updates only when useful.
- Keep final-answer requirements separate from progress updates.

Implementation note for API users:

- If using `previous_response_id`, prior assistant state is preserved automatically.
- If manually replaying assistant output items, preserve original assistant `phase` values unchanged.
- Use `phase: "commentary"` for intermediate updates and `phase: "final_answer"` for final responses.
- Do not add `phase` to user messages.

## Suggested Complex Prompt Shape

Use this only when the task is complex enough to benefit from structure:

```text
Role: [brief job and domain]

# Personality
[tone and collaboration style]

# Goal
[user-visible outcome]

# Context
[facts, constraints, inputs, current state]

# Success criteria
[what must be true before stopping]

# Constraints
[policy, safety, scope, evidence, side effects]

# Tools
[available tools, when to use them, permission gates]

# Output
[sections, length, format, tone]

# Stop rules
[when to answer, retry, fallback, abstain, or ask]
```

Delete any empty section.
