# Frontend Prompt Reference

Source: https://developers.openai.com/api/docs/guides/frontend-prompt
Reviewed: 2026-05-30

Use this when generating prompts for GPT-5.5 to build or modify web apps, sites, dashboards, games, UI prototypes, or frontend-heavy coding tasks. This is an adapted reference based on the official frontend prompt instructions, not a verbatim copy.

## When to Include This Guidance

Include a tailored subset when the user asks for:

- a website, web app, dashboard, SaaS tool, CRM, admin panel, portfolio, product page, landing page, game, or UI prototype
- frontend polish, visual taste, responsive behavior, layout fixes, or browser verification
- a coding-agent prompt that will implement UI

Do not paste every rule into every prompt. Select the rules that affect the requested artifact. Most frontend prompts should include only 3-5 frontend quality constraints plus one validation rule.

## Adapted Frontend Instruction Block

```prompt
## Frontend quality guidance

Build the actual usable experience as the first screen unless the request explicitly asks for a marketing landing page.

Design for the product, audience, and workflow:
- Match any existing design system, component library, spacing, typography, and interaction patterns.
- Choose layout density and tone for the domain. Operational tools such as SaaS, CRM, admin, finance, or support software should feel quiet, organized, scan-friendly, and work-focused. Games, consumer apps, portfolios, and editorial pages can be more expressive.
- Make common workflows efficient and complete, including expected empty, loading, error, disabled, hover, focus, and success states.

Use familiar controls:
- Use icons for tool actions, swatches for colors, segmented controls for modes, toggles or checkboxes for binary settings, sliders or numeric inputs for values, menus for option sets, and tabs for parallel views.
- Use icon libraries already present in the project. Prefer Lucide when it is available.
- Keep cards restrained. Do not nest cards inside cards. Use cards for repeated items, modals, or framed tools, not as the default page-section treatment.

Avoid common generated-UI defaults:
- Do not add decorative gradient blobs, bokeh, floating orbs, or generic abstract SVGs.
- Do not use oversized marketing heroes for operational tools.
- Do not place visible instructions in the UI explaining keyboard shortcuts, visual style, or how to use obvious controls.
- Do not make a palette that is just variations of one hue. Avoid default-looking purple/blue gradients, beige/sand monotones, dark slate monotones, and brown/orange monotones unless the brief requires them.

For landing or branded pages:
- Make the brand, product, person, venue, or object visible in the first viewport.
- Use a real, generated, or otherwise relevant image/scene when visual assets matter.
- Do not make the hero a split card layout. Text should sit naturally over or within the main visual treatment, not inside a generic card.
- The first viewport should hint at the next section on both mobile and desktop.

For websites, products, and games:
- Use visual assets when they help the user inspect the thing being built. Prefer real, generated bitmap, or domain-relevant assets over abstract placeholders.
- For games or simulations with established rules, physics, parsing, or AI engines, use proven libraries for the core logic unless the user asks for a from-scratch implementation.
- For 3D, use Three.js where appropriate. The main 3D scene should be full-bleed or unframed rather than trapped in a decorative preview card.

Layout and typography requirements:
- Ensure text fits inside its parent at mobile and desktop sizes. Wrap or resize responsibly rather than letting text overlap.
- Reserve hero-scale type for true heroes. Use compact, readable type in panels, sidebars, toolbars, cards, and dashboards.
- Use stable dimensions for fixed-format UI such as boards, grids, tiles, counters, icon buttons, and toolbars so hover states or dynamic text do not shift the layout.
- Do not scale font size directly with viewport width. Use normal responsive type scales.
- Keep letter spacing at 0 unless the existing design system requires otherwise.
- Ensure UI elements and text never overlap incoherently.

Verification:
- If the app needs a dev server, start it and provide the local URL.
- If a static HTML file is enough, provide the file path instead of starting a server.
- Before finishing, verify the UI at representative mobile and desktop widths.
- For canvas, game, or 3D work, use screenshots and pixel checks to confirm the scene is nonblank, correctly framed, interactive or moving when expected, and free of overlap.
```

## Frontend Prompt Builder Fields

When creating a frontend prompt, collect or infer:

- Product type and target user
- First-screen goal
- Primary workflow
- Data shown or manipulated
- Existing stack and component library
- Design system constraints
- Required responsive breakpoints
- States to implement
- Visual assets required
- Verification method

## Compact Frontend Prompt Skeleton

```prompt
Role: You are a senior frontend engineer and product-minded UI designer.

# Goal
Build [artifact] for [audience] so they can [primary workflow].

# Product context
[domain, product type, existing stack, design system, data, constraints]

# UX requirements
- First screen: [actual usable experience or landing hero requirement]
- Core workflow: [steps/user jobs]
- Required states: loading, empty, error, disabled, hover, focus, success
- Responsive behavior: verify at [mobile width] and [desktop width]

# Visual direction
[domain-appropriate style, density, typography, color boundaries, asset requirements]

# Implementation constraints
[files, libraries, dependencies, do-not-touch list, backend/API boundaries]

# Validation
Run [tests/build/lint/browser checks]. Render the UI and inspect for text fitting, overlap, spacing, clipping, missing states, and visual consistency.

# Output
Summarize changed files, validation performed, and any remaining risk.
```

## Extra-Compact Frontend Prompt Skeleton

Use this for ordinary UI tasks where the user did not ask for a full system prompt:

```prompt
Role: You are a senior frontend engineer with strong product taste.

# Goal
Build [artifact] for [audience] so they can [primary workflow].

# Requirements
- Match the existing stack and design conventions.
- Make the first screen immediately usable, not a marketing explainer.
- Include loading, empty, error, hover/focus, and responsive states where relevant.
- Keep the visual style domain-appropriate; avoid generic gradients, nested cards, and text overlap.

# Validation
Run the relevant build/test check and inspect the UI at mobile and desktop widths.

# Output
List changed files, validation run, and any remaining risk.
```
