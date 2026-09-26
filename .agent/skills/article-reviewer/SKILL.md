---
name: article-reviewer
description: >
  Provides comprehensive, constructive technical reviews on blog posts and software engineering articles focusing on accuracy, clarity, controversial claims, and structure.
  Trigger: When reviewing, critiquing, auditing, or providing technical feedback on an article or blog post draft.
license: Apache-2.0
metadata:
  author: gentleman-programming
  version: "1.0"
---

## When to Use

- Providing technical peer review on software engineering blog posts and drafts
- Auditing technical claims, code snippets, architectural decisions, and trade-offs before publication
- Assessing controversy or polemic risk in engineering opinions
- Evaluating whether technical depth, narrative structure, and actionable takeaways match the target audience
- *Note*: Focus strictly on technical substance. Do not focus on grammar, spelling, or stylistic prose (delegate those to `blog-editor`).

## Critical Patterns

### 1. Technical Correctness & Production Quality
- **Fact-check technical claims**: Verify accuracy of framework APIs, system architecture models, and tooling references.
- **Inspect code snippets**: Check syntax, idiomatic best practices, edge cases, error handling, performance implications, and security vulnerabilities.
- **Enforce trade-offs**: Flag false dichotomies or one-sided assertions. Ensure architectural decisions clearly acknowledge trade-offs and constraints.

### 2. Technical Clarity & Audience Fit
- Ensure concepts build logically from prerequisites to advanced implementations.
- Identify jargon or abstractions that need precise definitions, diagrams, or concrete code examples.
- Validate that the depth matches the intended reader audience (neither overly simplistic nor unnecessarily arcane).

### 3. Polemic & Controversy Assessment
- Identify inflammatory, dogmatic, or condescending statements that could alienate the community.
- Differentiate clearly between empirical engineering facts and subjective opinions/preferences.
- Suggest acknowledging counterarguments and alternative approaches to preempt unnecessary backlash.

### 4. Practical Value & Actionability
- Verify whether the article leaves readers with concrete, actionable engineering takeaways or patterns.
- Ensure all technical examples are complete, reproducible, and practically applicable.

### 5. Constructive Senior Tone
- Frame feedback constructively: explain *why* something is technically flawed and show how to fix it.
- Highlight strengths, elegant explanations, and strong technical arguments alongside critique.

## Inputs & Context

When executing this review, identify and utilize:
1. **Article**: The post or draft to review (`{{article}}`).
2. **(Optional) Context**: Target audience level, publication venue, or specific concerns (`{{context}}`).

## Deliverable Format

Provide the review structured in the following sections:

1. **Executive Summary**:
   - High-level assessment of strengths and primary technical concerns.
   - **Recommendation**: `Publish as-is` | `Publish with minor revisions` | `Needs significant revision` | `Not ready for publication`.

2. **Technical Correctness**:
   - Identified factual inaccuracies, outdated practices, or anti-patterns.
   - Concrete suggestions and corrected code/concepts.

3. **Technical Clarity & Communication**:
   - Unclear concepts or missing prerequisite context.
   - Opportunities for helpful analogies, diagrams, or snippets.

4. **Polemic Risk Assessment**:
   - Controversial claims or alienating tone.
   - Guidance on reframing arguments to withstand peer scrutiny.

5. **Technical Structure & Argumentation**:
   - Narrative flow issues from problem statement to solution.

6. **Prioritized Recommendations**:
   - Actionable checklist categorized by priority (`[High]`, `[Medium]`, `[Low]`).

7. **Positive Aspects**:
   - High-quality technical points, strong analogies, and strengths to preserve.
