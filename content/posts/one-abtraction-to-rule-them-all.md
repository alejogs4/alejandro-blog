+++
date = '2026-11-12T19:33:10+01:00'
draft = false
title = 'One Abstraction to Rule Them All'
description = "Why strong abstractions and codebase conventions reduce LLM slop and help both humans and AI agents express intent more clearly."
tags = ["ai", "software-design", "architecture", "software-engineering"]
+++
This year, our industry shifted its paradigms. We've gone through an almost overnight renaissance as AI agents make our day-to-day look very different from what we used to do. Still, what used to be true before that is still true? We keep losing ourselves in the `details`.

> "The devil is in the details."
> — Grandmas around the world

Details are what emerge when we zoom in. They're the subtle ingredient that turns a good recipe into an exquisite meal, or the exact angle that turns an ordinary shot into a National Geographic picture. But details are also distractions.

**Distractions** from the real job at hand, distractions that obscure the problem we're actually trying to solve. In software, distraction means complexity, and handling or hiding that complexity is essential to software engineering.

Abstractions are how we handle and hide that complexity. They work because they strip away the unneeded details of an operation, leaving only a small set of parameters and by doing so, they define the one right way to do it. For a human, a perfectly non-deterministic machine, having a single right way is a blessing. We don't have to think about *how* to do it; we're simply in charge of fulfilling the contract the abstraction demands. That unloads our brains and lets us express our intent more clearly.

### Agentic coding isn't too different from us

When we find a new hammer, everything looks like a nail. Once we're confident in how something works, we naturally spread it everywhere. Agentic development tools do the exact same thing: they spot how something is usually done in our codebase and follow the pattern. If we declare a controller, a repository, or anything else in a consistent way, we can be sure that the next time the tool needs to write one, it'll follow that pattern.

### Nothing beats conventions for reducing slop

Slop starts when, instead of being certain, LLMs guess. When they guess, it's because something isn't clear. An effective fix is to take the pattern or practice you want to spread across your codebase, turn it into a convention, and start using it. Progressively, your tools will pick it up, that practice will become the default, and you'll stop getting slop when tackling that problem.

Abstractions that encode strong conventions are everywhere, and many of them don't even have to be built by you:

- HTTP frameworks instead of fragile custom network primitives
- ORM data access instead of plain SQL
- Type-enforcing libraries such as Effect.ts instead of plain, limited TypeScript
- Domain-specific languages over imperative business rules

Today, we should be less and less afraid of abstractions. They used to be considered evil if we didn't get them right on the first try, because the cost of building, refining, or ripping them out was huge, human typing was expensive. But now that the gap between designing an abstraction and implementing it has shrunk, we're freer than ever to find clearer ways to express our intent, both to ourselves and to our new alien friends.



## Reference

[On Matt's podcast Lauren Tan defines this as "Stop the bleeding and make the right thing the easy thing"](https://www.youtube.com/watch?v=MN9dGgmLyso&t=2s)