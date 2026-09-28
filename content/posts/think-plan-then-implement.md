+++
date = '2026-09-28T22:38:01+02:00'
draft = false
title = 'Thinking: How to really stay in the loop'
description = "Blind AI code generation leads to 'AI Cognitive Surrender', and how a disciplined Think-Plan-Implement workflow keeps software engineers in control."
tags = ["ai", "architecture", "software-engineering", "workflow"]
+++

It's 1:00 PM and you are about to go to lunch. You've already shipped three or four PRs to your integration branch the same volume of work that would have done half a week just two years ago. When you return from a satisfying meal, a coworker text you on Slack:

> Hey! How's it going? I was just wondering what this block of code you merged this morning is doing. Time for a quick chat?

You join the call, stare at the lines of code on your screen, and swallow hard. Those lines mean almost nothing to you. You don't understand them, and worse, you don't grasp the intention behind them.

And why did this happen? Because that code was generated and merged without you ever truly being in the loop.

## Software: An output of comprehension

A couple of years ago, this scenario was virtually impossible. Our velocity was limited by human typing speed. Writing code by hand forced us to sit with the problem, breaking down uncertainties line by line.

Today, we live in a very different world. A world where overly confident models paired with developers lazy enough to offload their critical thinking can produce entire codebases based on assumptions and comprehension gaps. However software has never been about coded lines, it has always been about comprehending the business domain, understanding the problem at hand, and communicating that solution in software terms.

In the past which only feels distant because of the madness pace of this industry, comprehension suffered from ambiguous requirements or the steep learning curve of a new domain (if it's your first financial project, you're obviously not a financial expert on your first day). But human typing speed, despite being one of the bottlenecks that delayed projects, gave our brains the needed breathing room to absorb domain rules and technical constraints.

We are no longer limited by typing speed. And even though that sounds like pure progress, it has introduced a trap.

## AI Cognitive Surrender

I love coding. I have been writing software for more than a decade, but what I love even more is the feeling of a solved problem. Being more specific **me solving** the problem. That creative satisfaction is a common trait that every engineer who is genuinely passionate about their craft can relate.

How you define that `craft` shapes how you experience these times. If your craft was writing code by hand, these are unsatifying times. Coding by hand is no longer what we are paid for, [maybe it never was](https://alejandrogarciaserna.com/posts/king-context/) even if it was a satisfying, rewarding part of our job.

Historically, our industry relied on code writing as the vehicle to fill gaps in understanding. Despite proven practices like domain modeling, design docs, or TDD as a design tool, most engineers worked through uncertainties only when their [fingers hit the keyboard](https://www.lucasfcosta.com/blog/design-docs). When we jump to AI without adapting that mental process, we fall into **AI Cognitive Surrender**.

AI Cognitive Surrender is the habit of letting tools "get the job done" without grasping what that output actually does neither at a high architectural level nor at a low implementation level. It is born out of pressure and an identity crisis that over rely on coding as the main skill a software engineer had.

It’s the familiar "Claude told me this" syndrome: pasting tickets into prompts and copying generated solutions into pull requests without knowing the **why**, the **how**, or even the **what**. We go back into the old "code monkey" pattern. Without a shift in how we work, our careers risk becoming passive and boring.

So what is the cure? We must **think**.

## Think, plan, and then implement

We are still learning how to work alongside these models. But the goal is clear: [keep the engineer firmly in the loop while retaining the speed advantages AI offers](https://www.lucasfcosta.com/blog/backpressure-is-all-you-need).

To build software that remains comprehensible and maintainable, any sustainable methodology requires three distinct phases:

- **A thinking phase** to dissect the problem, clarify domain invariants, and eliminate ambiguity.
- **A planning phase** to structure tasks into a clear blueprint lives in a markdown file, an issue tracker or in our context windows.
- **An implementation phase** governed by deterministic guardrails that verify the changes meet our architectural and quality standards.

Whether you practice Spec-Driven Development (SDD) or adopt [skills and workflows like the ones Matt Pocock shared](https://www.youtube.com/watch?v=M6mYodf0dJM), you need these three steps.

### 1. Think

We are in the AI era, so let AI help you explore the problem. Before writing code, use AI to visualize uncertainties through text, diagrams, or architectural queries. [You can use custom prompts, thinking skills](https://github.com/alejogs4/personal-skills/blob/main/think/SKILL.md), or tools like Matt Pocock’s `grill-me` skill to challenge your assumptions.

Use whatever helps you build a solid mental model: sketch diagrams, list edge cases, or discuss domain invariants. The goal is to deeply grasp the desired behavioral outcome before any code is generated.

This matters because while we may spend less time typing by hand, **code quality matters more than ever**. AI can generate syntactically convincing code at superhuman speeds, but it has no innate understanding of operational trade-offs, security invariants, or domain nuances. Understanding the purpose and constraints of your solution is what separates you from solving a problem yourself or delegating your own thinking.

### 2. Plan

Tools like Antigravity have just introduced dedicated plan modes. Some might view planning as overhead or a relic of older (funny enough that by old we mean early this year) times. But planning isn't just about feeding context to the model; **planning is for us**.

A plan provides a concise, inspectable blueprint of the work about to be performed. It bridges the high-level intent from our thinking session with the low-level execution steps.

Once formulated, this plan can be saved in a markdown file, tracked in Linear, or passed to a dedicated implementer agent with a clean context window.

### 3. Implement

This is where determinism becomes non negotiable.

Once you have a plan, implementation must be constrained by strict feedback loops:

- **Automated test oracles (TDD)**: Test-Driven Development shines brighter than ever with AI. Giving an agent a failing test provides an deterministic expectation. The agent iterates until the test turns green, ensuring the behavioral requirement is actually met and reduce the odd of a hallucinated answer.
- **Static analysis and compiler checks**: Strict type checking and linters catch API mismatches, undefined variables, and broken contracts instantly.
- **Structural inspection**: Because the plan broke down the implementation into discrete chunks, reviewing the resulting pull request is no longer an overwhelming wall of unknown code. You review against specific requirements and verified assertions.


It is 14:25. If you adopt this Think, Plan, Implement you won't just ship faster than you did a year ago. You will understand your codebases more deeply, master your business domain, and evolve into an engineer who truly gets the **why** behind every technical decision.
