+++
date = '2026-01-16T14:53:16+01:00'
draft = false
title = 'Context is (was always) the king'
description = "Why effective communication and context are critical for building successful software products, and how the 'broken telephone' effect impacts development."
tags = ["communication", "culture", "soft-skills"]
+++

Some years ago, a tech lead I deeply respect said something that became my mantra:

> For bad software we already have Excel

He didn't mean Excel was bad software; on the contrary, it remains one of the most incredible, refined, and robust tools ever written. His point was that most of what we build, even for "serious" projects, doesn't come close to that level of usefulness. Why? Why does our industry, despite having the most potent tools ever conceived, so often fail to build products that justify their own existence?

The answer lies in **communication**.

## Broken telephone game: our ability to say what we mean

As children in school (or adults in corporate training sessions we’d rather skip), most of us played the "broken telephone" game. A message is whispered from person to person, and by the end, it has inevitably mutated into something unrecognizable.

This happens because humans struggle to replicate information literally. We filter what we hear through our own vocabulary, biases, and expressions. When this human-to-human translation is multiplied across a chain of people, the original intent is often lost. In our industry, the clarity of our words is a deciding factor in whether a product succeeds or fails.

## Your context: Your understanding

When you start a new role, there is a grace period before you're expected to peak. This exists because every organization has its own business rules, specific domain knowledge, and team dynamics. This is your **context**. It is the degree to which you understand the jargon, the **ubiquitous language** of the product, and the technical nuances of the team.

Without this understanding, your skill as a programmer alone is insufficient; you won't produce high-quality work because you don't understand the **why**. Our job as engineers eventually transcends coding. Our fundamental value lies in understanding who we are working with, how the business makes money, and what the technical constraints are.

This has always been the case. Programmers in the 1960s had to master physics to put a man on the moon. Today, we must master healthcare logistics or financial regulations. However, the rise of agentic coding tools has brought this into sharp focus. As the cost of mere code writing decreases, our ability to understand and translate business needs is more valuable than ever.

## Building good context is about communication

Everything we do is communication. When we speak with other humans, we transmit our thoughts and intentions. With this, another person can make assumptions about who you are and what is reasonable to expect from someone like you.

The same applies to building software. Software building (just another human activity) is full of tools for communicating product and technical decisions. Just like clarity, consistency, and non-verbal communication, in software we have diagrams (Hello UML), design patterns, documentation, and many other things whose primary focus is **communication**. Think about it: design patterns have been successful over the years because with a single word we can encapsulate an entire design decision. If I say, "I built an adapter," everyone in the meeting instantly understands the architectural decision. A UML diagram (despite how much I hated them in college) is simply a visual language for communicating architectural decisions more clearly than a wall of text.

### Domain driven design

Domain-driven design, as a design approach, made a significant effort in this direction. The concepts and practices that promote an entire engineering team speaking in the same language—**the ubiquitous language**—ensure that everything said and built is covered by **bounded contexts** and makes communication patterns in an organization more visible and clearer with **context mappings**.

These techniques achieved something overlooked by most software engineers: they put the focus on the business or domain for which we are working and building software. This domain focus makes it much easier for us to keep in mind how the business makes money and how our decisions affect the operation of the business. But even more important, it transforms everybody's vocabulary so we as a team speak the same language. Refining this helps teams overcome the broken telephone problem over time.

### Visual Communication Tools

UML was always my nemesis. At some point, some misconceptions made me doubt its utility, along with some bad usages in practice. In the past, UML felt like bureaucracy—something I had to do in order to satisfy an old-fashioned technical leader or a college professor, where I spent time diagramming a system, showed it in a meeting, and nobody else saw it ever again. Besides, "diagramming a system"? Systems in production tend to get so big and messy that trying to understand an entire system from a single diagram is an impossible task, making the utility of these diagrams even lower.

This kind of misconception, in my opinion, stems from the fact that at some point our engineering education betrays us. We are taught these techniques for the sake of learning the techniques—how to apply them and what the rules and conventions are—but we are rarely told the `why` behind the technique, what its purpose is beyond passing the next exam. Mathematics provides another example. From a theoretical point of view, we might not see much use at first. But if we think about math in terms of abstraction and use cases, math, just like UML, turns into something much more interesting, approachable, and useful. Thus, UML precisely helps us communicate visually what the system does, how it behaves, and how the different components interact—a more effective way of seeing it than purely verbal and written description.

And of course you cannot understand a whole system from a single diagram, but there is another part of the puzzle. Your diagrams and therefore your context should not remain small just for the sake of it because context depends on the complexity of the problem you are solving ([accidental vs essential complexity](https://alejandrogarciaserna.com/posts/kiss-and-other-design-principles-misconceptions/))—but you should keep your context **focused**, just enough so your mind and your LLM can effectively understand the module or task at hand. That's why the old idea of [modularity](https://wstomv.win.tue.nl/edu/2ip30/references/criteria_for_modularization.pdf) shines. When Parnas described the modules concept, he made clear that modules improve system flexibility and comprehensibility by ensuring that your brain doesn't have to process the entire system at the same time, so you can have more mental space to reason about the task.


## On writing code

You notice here that I am not mentioning code, and I won't even show code examples. It's funny to think that for people like me, writing code was the most exciting part of my job. However, in the last few months, AI-based tools have made me realize that writing code is no longer my job. Was it ever? It never was. My job, and all our industry's job, was always to gather and absorb business and technical context to capture this ultimately in code. Since these AI tools already write code for me way faster than I will ever be capable of, it becomes clearer that our real value is when we use the tools at our disposal to make communication more effective, improving context and ultimately shipping better software.

Code will always be needed, and knowing how to write it matters—not because you have to write code. I find myself writing far less code than ever before, but learning about software engineering and computer science gives a professional the **critical thinking** needed to make decisions that make sense from both technical and product perspectives, guiding the AI models towards a solution that not only works but also scales in complexity and load over time without sacrificing the new building speed these tools give us. So learning these skills—the critical thinking and context building—is the difference between using AI effectively or not.


## Context is King: Working with AI-Based Tools

Now that we understand context is the foundation of effective software development, and unless you have been in a cave the last two years, you know that an increasing amount of code is being written with AI assistance. This is the truth: **AI tools don't eliminate the need for context—they amplify it**.

When you prompt an AI assistant to write code, you're essentially playing the broken telephone game in reverse. Instead of a message degrading as it passes through multiple humans, you're trying to compress your entire understanding of a problem, its constraints, business rules, and technical decisions into a few sentences or paragraphs. The quality of the output directly correlates with the quality and completeness of the context you provide.

This is where all those communication tools we discussed become critical. When working with AI tools:

- **Use your domain language**: Describe problems using the domain vocabulary your team has established.

- **Provide architectural context**: Share diagrams, technical specifications, or architectural decisions before asking for implementation. An AI that knows your system follows a CQRS pattern or uses event-driven architecture will generate code that fits your existing design.

- **Iterate on context, not just code**: Treat your prompts as a communication exercise. If the AI produces something that doesn't fit, don't just ask for fixes—examine what context was missing from your original communication and refine it.


When context is missing or poorly communicated, the AI's output makes it immediately obvious—the code might compile, but it won't solve your actual problem. This visibility forces us to confront what we've always known: **context isn't optional, it's the entire job**.

So the next time you open an AI coding assistant, remember: you're not just writing code faster, you're practicing the most critical skill in software development—effective communication of context. And that skill, unlike code generation, can't be automated away.

