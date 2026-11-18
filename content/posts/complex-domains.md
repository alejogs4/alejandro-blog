+++
date = '2026-11-18T20:46:50+01:00'
draft = false
title = 'Complexity is always there, and we cannot avoid it'
description = "Why domain complexity, not code generation, remains the real bottleneck for AI agents, and why understanding the problem space is still unavoidable."
tags = ["ai", "domain-driven-design", "software-engineering", "architecture"]
+++

Something I love about watching a demo of a flashy new product or AI agent (nobody builds anything else nowadays) is seeing how, even after working in tech for a while, it is still easy to underestimate the whole spectrum of moments where a software system can go wrong. The input we didn't expect, or the edge case we didn't have in mind either because it's genuinely rare, or because we don't know enough about the domain to even consider it, simply because the domain itself is complex.

## We build like we know

In both the pre and post AI eras, our speed is only as good as our knowledge of the domain under construction. Using the exact domain terms can steer agents in the right direction giving them, in just a few words, the right clues about where the code should live, which software components should interact, and under what rules those components execute their mission. All of this has to live somewhere. Call it a human brain for the nostalgic, or a knowledge graph for the hipsters, but we have to encode this knowledge somewhere. It isn't optional: no complex domain can be turned into working software without it.

Regardless of where you store it, this knowledge needs curation, cleaning, and a technical, product centric interpretation for building software. That inherent complexity remains a bottleneck for the speed and autonomy an AI agent can actually handle. Autonomy can only be granted when the agent operating under proper guardrails is given the exact, precise context it needs. But to build that context in the first place, the problem itself demands research, learning, and understanding.

## We cannot build what we don't fully understand

I worked as an engineer at a company that automates accounting and taxation processes with AI for Spanish firms. Accounting is a complex domain, and Spanish accounting and taxation are famously complex worldwide. In such a complex, regulated space, the speed at which we build software is strictly bottlenecked by gathering poorly documented rules and edge cases. And believe me, these can be as broad as certain goods being tax exempt, or as niche as a special tax charge for a sports team when one of its players owns 75% of their image rights.

Unfortunately, this is unavoidable. Our customers rely on the correctness of our application's processes because this software is mission critical for them and here we aren't talking about aircraft or medical software, we're talking about the applications a business relies on for its entire operation. Until we learn and understand this complexity, we cannot gather meaningful sources for our automated software factories or solo AI agents to implement and verify their own work. The complexity lies in learning what we have to build and how that new knowledge fits into the existing system.

Next time you see a flashy demo, before going hard on the hype and the "game changer" narrative, remember that the complexity underneath, and how messy these entropy magnet systems are in general, is what really slows us down. Even when it's hidden behind a beautiful UI, complexity is always there, and we cannot avoid it.
