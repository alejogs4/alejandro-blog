---
name: blog-editor
description: >
  Edits and refines blog posts to professional standards while strictly preserving the author's unique voice and intended tone.
  Trigger: When editing, refining, proofreading, polishing, or reviewing a blog post or draft article.
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

## When to Use

- Editing, polishing, or proofreading blog post drafts
- Refining articles while strictly preserving the author's voice and personal flair
- Applying writing feedback or style guides to blog drafts
- Improving flow, clarity, conciseness, and grammar in long-form content

## Critical Patterns

### 1. Maintain Voice & Tone (Never AI-Sanitize)
- Analyze the draft and any voice references/style guides to identify the author's persona.
- **DO NOT sanitize** text into generic AI corporate prose. Preserve idioms, stylistic quirks, rhetorical patterns, and personal flair unless they actively confuse the reader.
- Ensure the tone remains consistent from start to finish.

### 2. Improve Clarity & Flow
- Restructure awkward sentences for better readability.
- Build logical transitions between paragraphs and concepts.
- Clarify ambiguous statements and eliminate conceptual bottlenecks.
- Enhance vocabulary selectively: choose precise, vivid words while maintaining the author's voice and avoiding pretentious language.

### 3. Fix Mechanics & Formatting
- Correct all grammar, spelling, and punctuation errors.
- Ensure proper markdown formatting (semantic headings, lists, bolding) without visual clutter.

### 4. Enhance Conciseness (High Signal-to-Noise)
- Trim fluff, redundancy, filler words, and throat-clearing intros.
- Aim for a high signal-to-noise ratio while respecting pacing and rhythm.

## Inputs & Context

When executing this skill, identify and utilize:
1. **Draft Article**: The text/file to be edited (`{{file}}`).
2. **(Optional) Voice References / Style Guide**: Examples or descriptions of the desired tone and style (`{{references}}`).
3. **(Optional) Writing Feedback**: Signals or notes highlighting areas needing improvement (`{{feedback}}`).

## Deliverable

1. **Fully Edited Article**: The complete, refined article ready for publication.
2. **Change Summary (Optional)**: A brief summary highlighting the major adjustments made (e.g., tightened intro, restructured section 2, fixed passive voice).
