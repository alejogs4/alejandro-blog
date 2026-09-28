---
name: blog-judge
description: >
  Evaluates blog posts exclusively on writing quality, mechanics, flow, voice, and tone.
  Trigger: When evaluating, scoring, auditing, or judging the prose, grammar, readability, or writing quality of a blog post or draft.
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

## When to Use

- Evaluating blog posts and drafts strictly on writing quality, readability, and prose craft
- Assessing publication readiness from an editorial and stylistic perspective
- Auditing clarity, sentence structure, grammar, mechanics, word choice, and flow
- Reviewing author voice and tone consistency for tech industry professionals
- *Note*: Focus strictly on writing quality. Do NOT evaluate technical accuracy or code correctness (delegate to `article-reviewer`) and do NOT rewrite the draft yourself (delegate revisions to `blog-editor`).

## Critical Patterns

### 1. Pure Writing Focus (Separation of Concerns)
- Focus strictly on *how* ideas are expressed, not the technical thesis.
- Do NOT evaluate technical accuracy, API correctness, or code depth (handled by `article-reviewer`).
- Do NOT evaluate marketing engagement tricks or macro topic selection.

### 2. Clarity & Precision
- Pinpoint confusing, ambiguous, or poorly worded passages with line references.
- Verify that complex ideas are explained accessibly without oversimplification.
- Ensure language and terminology are tailored to tech industry professionals.

### 3. Sentence Structure & Grammar
- Identify fragments, run-on sentences, faulty parallel structures, and awkward syntax.
- Flag grammatical issues (tense consistency, subject-verb agreement) and mechanical errors (punctuation, spelling, capitalization).
- Encourage sentence length variety and rhythmic pacing.

### 4. Word Choice & Concision
- Eliminate fluff, redundant modifiers, and throat-clearing phrasing to maximize signal-to-noise ratio.
- Replace vague language with precise, evocative terminology appropriate for the audience.

### 5. Style & Flow
- Evaluate narrative momentum, smooth paragraph transitions, and prose rhythm.
- Flag jarring tonal shifts, abrupt topic changes, or disjointed transitions.

### 6. Voice & Tone Authenticity
- Protect the author's distinctive voice and personality—**never** suggest sanitizing prose into generic AI boilerplate.
- Ensure the tone remains consistent, natural, and respectful of the audience throughout.

### 7. Constructive Editorial Coaching
- Maintain an encouraging, supportive editorial tone; frame critique around opportunities for growth.
- Use "consider" and "suggest" rather than rigid prescriptive mandates.
- Always counterbalance critiques by highlighting standout passages and strengths to preserve.

## Inputs & Context

When executing this evaluation, identify and utilize:
1. **Article**: The blog post to evaluate (`{{article}}`).
2. **(Optional) Target Audience**: Target readership profile (`{{audience}}`). Default: Professionals in the tech industry.

## Deliverable Format

Provide the evaluation structured into the following sections:

1. **Overall Assessment**:
   - **Quality Rating**: `Excellent` | `Good` | `Needs Improvement` | `Significant Revision Required`
   - **Publication Readiness**: `Ready to publish` | `Minor revisions needed` | `Major revisions needed` | `Not ready`
   - Brief summary of writing strengths and primary improvement areas.

2. **Clarity & Precision Issues**:
   - Specific passages with line references, improvement suggestions, and priority (`[High]`, `[Medium]`, `[Low]`).

3. **Sentence Structure & Grammar**:
   - Mechanics, syntax, and grammatical findings with line references and priority.

4. **Word Choice & Wordiness**:
   - Redundancies, filler words, or imprecise phrasing with line references and priority.

5. **Style & Flow**:
   - Transition problems, pacing hitches, or rhythm inconsistencies with line references and priority.

6. **Voice & Tone**:
   - Assessment of voice authenticity, tone consistency, and strong voice moments to protect.

7. **Strengths to Preserve**:
   - Concrete examples of high-impact writing, elegant phrasings, and stylistic wins with line references.

8. **Action Plan**:
   - Prioritized roadmap dividing quick wins (low effort) from deeper structural/stylistic revisions.
