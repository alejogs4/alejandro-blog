+++
date = '2025-07-20T15:17:55+01:00'
draft = false
title = 'KISS and other design principles misconceptions'
publishDate = '2025-07-19T15:00:55+01:00'
description = "A pragmatic look at software design principles like KISS, SRP, and DRY, exploring how they are often misunderstood and how to apply them effectively."
tags = ["software-design", "architecture", "best-practices", "refactoring"]
+++

Over the years, the tech industry has gained experience with practices that are helpful for writing maintainable and evolvable software. However, many of these "best practices," design patterns, or design principles are often applied daily in ways far from their authors' original intent. They can become dogmatic, used for their own sake or without considering the context in which they are being applied.

The goal and challenge here are to distance ourselves from dogma, embrace pragmatism, and understand the trade-offs when we decide to build a piece of software in a particular way. Every decision has a consequence, and the accumulation of these consequences can either add or remove complexity and cognitive load from our codebases. This affects our users—who, as we will see in this blog post, are not only the end-users but also other developers and even our future selves.

## Keep it simple, stupid (KISS)

Simplicity is something everyone on a project seeks. It's the desire to grow in features and revenue without suffering slowdowns in productivity and shipping times. In this search for "simplicity," we often forget for whom this simplicity is important and what simplicity actually is. To better illustrate this, let's use simplicity's antonym: complexity. A less complex system is, by definition, a simple system, and the opposite means we face a complex or non-simple system. Complexity is a helpful term as it has been widely studied in science and engineering. Specifically, in [Out of the Tar Pit](https://curtclifton.net/papers/MoseleyMarks06a.pdf), the authors of this amazing paper define two classes of complexity: **Essential Complexity** and **Accidental Complexity**.

#### Essential Complexity

Some domain problems, and therefore the software for them, are complex by definition. An aircraft system is far more complex than a coffee shop's software. As explained in the paper, essential complexity tells us there is an inherent complexity within the problem we are solving that we cannot escape. Attempting to eliminate this essential complexity is not only impossible but also counterproductive. When we try, we are merely shifting the burden from our implementation to the users. They will have to figure out more on their own to use our software successfully, instead of us, the implementers, figuring it out for them.

#### Accidental Complexity

Some complexity is unavoidable, but what about the kind we can avoid or reduce? That's accidental complexity—the complexity born from *how* the software is implemented. Whether we rely on global state or use explicit dependencies, have deep inheritance hierarchies, or separate immutable computations from the necessary side effects a system needs to be useful (e.g., Object-Oriented Programming vs. Functional Programming), the goal is the same. The idea behind every programming paradigm, best practice, or design principle is to reduce this accidental complexity so that the system does not become more complex than it needs to be.

As stated above, complexity is essentially unavoidable. However, if complexity cannot be completely removed, it should be **hidden** from the eyes of the user of that system or piece of functionality. When a customer fills out a form, the entire system might be involved in applying business rules, performing verifications, or writing information. These operations are hidden from the customer because, at that **layer**, those details are irrelevant to what they are trying to achieve. This principle can and should be extrapolated to any layer we are working on in the system. Details relevant at the customer level are different from those at the function level. Truly hiding these details from the user of that layer is what makes a system *simple*, regardless of whether the implementation is *complex*—since, as we've discussed, that complexity might be essential.

A real-world example of this is how programming languages and their standard libraries handle file system interactions. In NodeJS, reading the content of a `.txt` file looks like this:

```javascript
const { readFile } = require('node:fs/promises');

const contents = await readFile('./file.txt', { encoding: 'utf8' });
console.log(contents);
```

What might not be obvious here is that, under the hood, the `readFile()` function needs to parse the provided path and *try* to resolve the file in the *underlying* operating system where the program is running. Additionally, it needs to *verify* permissions for that file, *read* its content, and use the second parameter to return the content in the specified encoding (`utf8` in this case). All of that complexity is encapsulated and hidden behind an easy-to-use interface. The implementation, both on the NodeJS side and in the underlying C++ engine, is as extensive and complex as you can imagine. However, all that complexity is ultimately wrapped beautifully and hidden in an interface where we only have to pass the path of the file we want to consume (the second parameter is optional; a buffer is returned by default).

In his wonderful book [A Philosophy of Software Design](https://www.amazon.com/Philosophy-Software-Design-2nd/dp/173210221X), John Ousterhout calls these kinds of functions **deep modules**. Deep modules are described as those that provide a lot of functionality through a simple interface. This is what we would also call a [Facade](https://refactoring.guru/design-patterns/facade). So, the next time you're thinking, or a well-intentioned coworker tells you, "let's keep it simple," ask yourself (or them): "Simple for whom?"

## Single Responsibility Principle

The SOLID principles, coined by Robert C. Martin, have been around for a long while, and for just as long, they have been the foundation upon which much of the software design world has been built. The first letter of this acronym, S, stands for the *Single Responsibility Principle*. This principle states that:

> A class should have one and only one reason to change, meaning that a class should have only one job.

In theory, this sounds perfectly reasonable, and it is. However, in practice, where do we draw the line for `one thing`? This blurry distinction, or a half-understood principle, makes it easy for developers to split the implementation of a given functionality in a way that improves neither clarity nor reusability.

Here, we have to make it clear that splitting or extracting code into a function, class, or module doesn't automatically make it more reusable. Why? Because code is only reusable if its implementation and signature are abstract enough for the contexts in which it is intended to be used. Let's take the array `map` function as an example:

```javascript
const numbers = [1, 2, 3, 4, 5, 6]
const squares = numbers.map(number => number * 2)

const employees = [...]
const employesNetSalaries = employees.map(employee => (
    ...employee,
    salary: employee.salary - taxes
))
```

`map()` is a function that, given an array as an implicit parameter and a function that acts as a mapper or transformer, applies this transformation to each element and returns a new array with the results.

Here we see a very generic, abstract function that is worth extracting. It makes few assumptions about the context where it's going to be used. The less coupled your abstraction is to the `where` or `how` of its usage, the better—that's a good signal it is well-designed. On the contrary, if a function you created can only be used in one place because it is tightly coupled to the context, it might not increase reusability, but it could still add clarity.

So, to give a clearer explanation of this principle, let's rephrase it as:

> A piece of code should have a single goal

`Goal`, rather than `thing`, is a more concrete term we can use as a heuristic when writing code. We can more easily ask ourselves: `What do I want as the outcome of this abstraction?` Code splitting can then be done if clarity or reusability is improved. And speaking of reusability...

## Don't Repeat Yourself

Code repetition has often been seen as the root of all evil in software development. Repeated or similar code is assumed to be inherently bad. But do you know what can be a worse fate for your codebase? Coupling. So let's talk briefly about it.

### Coupling and Information Leaks

How much do two objects know about each other? That's what coupling is all about. If two objects know or are aware of many details about each other, any change in how one object presents itself to the outside world (its API or interface) will ripple to the other. This means more places to modify and more variables to consider when refactoring. On the other hand, if two objects minimize their coupling as much as possible, changes to their internal structures should not leak to their consumers. In his paper [On the Criteria To Be Used in Decomposing Systems into Modules](https://dl.acm.org/doi/10.1145/361598.361623), David Parnas described this as `information hiding`. How much information is hidden is the criterion to verify a module's modularity, and therefore, the flexibility of the system.

The fundamental reason for the existence of classic design patterns, besides reusing solutions to common problems and serving as a form of technical communication, is to express relationships among objects. This communication is expressed through their *interfaces*—the contract they must fit—rather than the specifics of how they are built.

> Program based on interfaces, not on concrete implementations

On the other hand, an information leak occurs when an implementation detail is exposed through the abstraction's interface. This means the parameters, the return type, or the way these values are passed or used allows the client code to infer how the abstraction was implemented. This is somewhat unavoidable. Even well-built abstractions, if they solve a non-trivial problem, will likely leak part of their implementation to the outside world. Something as simple as which values are accepted as parameters or what the return type is constitutes information the world knows about our interfaces.

However, minimizing these kinds of problems is the fundamental job of software engineering. This leakage is problematic because this knowledge of how our software is used creates coupling—coupling we cannot eliminate completely but must strive to minimize. And it is here that some trends in avoiding repetition fail us.

Imagine the next form component in React:

```jsx
const UserForm = ({ page }) => {
    //...
    function onSubmit(values) {
        // ...
        if (page === '/signup') {
            // Add validations for signup
        }

        if (page === '/rating-book') {
            // Add validations before rate
        }

        // ...
        await submitUserInfo(values)
    }
    //...
}
```

This component has one major flaw: it is too context-dependent. Depending on where it is called, it behaves differently. This is problematic because any change to one page's implementation can potentially break the other places it's used. This not only makes the component's code harder to maintain and extend but also means we are coupling different pages together. To solve this, let's first use a definition from the world of abstraction:

> Abstraction is keeping the fundamental and adding the details

This separation between fundamentals and details—or separating policies from details—is key to building good abstractions. The fundamentals are everything needed to perform the action in its most basic form, and the details are the specializations for each use case. Let's refactor the previous component to understand this:

```jsx
const UserForm = ({ isValid }) => {
    //...
    function onSubmit(values) {
        // ...
        if (!isValid(values)) {
            // Do something if validation is wrong
        }

        // ...
        await submitUserInfo(values)
    }
    //...
}
```

This may seem like a simple change, but it demonstrates a fundamental skill in software design: the "taste" to know what is essential (the policy) and what is a detail. In abstraction design, code repetition is acceptable as long as this repetition keeps the code decoupled. Good software design helps us achieve precisely this.

Another case is when, in the pursuit of avoiding repetition, we couple two or more parts of our codebase at the information level. This happens when, even though abstractions solve very similar problems, the data they operate on is conceptually different.

So, whenever you are tempted to extract a function or create a class or component, think carefully about the interface design. Consider how this interface can serve a more abstract or general goal than the original code intended. If a good design isn't obvious, you might need to see more use cases to grasp it. In the meantime, be okay with a bit of repetition.

## YAGNI (You aren't gonna need it)
By now, it should be clear that the heuristic of hiding details behind a thoughtful interface is a cornerstone of good software design. The YAGNI principle tells us not to implement functionality until we have a clear, immediate need for it. The goal is to avoid building speculative features based on what you think you might need in the future.

This is sound guidance for avoiding unnecessary complexity. However, it's crucial to remember that we are operating in two distinct fields: the interface and the implementation. When we are told not to over-engineer, making this distinction is vital.

At the moment of designing and building new functionality, we must develop a clear understanding of the problem at hand. This understanding helps us distinguish between two related aspects:

1. **What is wanted now (The Implementation)**: This is the concrete code that solves the immediate problem.
2. **What the problem represents (The Interface)**: This is the abstraction or contract that models the problem domain.

According to YAGNI, we should only implement what is wanted right now. The number of use cases we've been exposed to is limited, so trying to build support for unknown and uncertain future scenarios is not only difficult but also provides no guarantee that the work will ever be useful.

However, we must understand the problem domain well enough to design an interface that can gracefully accommodate both current and likely future needs. Applying YAGNI too aggressively to your interface design is how you put yourself into a corner. **The key is to design for tomorrow, but only implement for today**.

Let's illustrate this with a common feature: a notification system.

The first requirement is simple: "When a user's subscription is about to expire, send them an email reminder."

```javascript
// WARNING: Inflexible Interface

/**
 * Sends a subscription reminder email to a user.
 * @param {object} user - The user object, e.g., { email: 'test@example.com', name: 'Alex' }
 * @param {string} message - The content of the email.
 */
async function sendEmailReminder(user, message) {
    console.log(`Connecting to SMTP server...`);
    console.log(`Sending email to ${user.email} with message: "${message}"`);
    // Complex email sending logic would go here...
    return { success: true };
}

// Usage
const currentUser = { email: 'customer@email.com', name: 'Sam' };
await sendEmailReminder(currentUser, 'Your subscription is expiring soon!');
```

This works perfectly for the current requirement. The problem is that the **interface** (sendEmailReminder) is a dead end. It's tightly coupled to "email."

What happens next month when the product manager says, "We also need to send reminders via SMS"? You can't use this function or you will have to modify it with the cost that comes with this refactor, this is due to not designing the interface for the future.

A pragmatic developer understands the problem is "sending notifications," not just "sending emails.", We will implement a more generic interface but keeping the implementation while keeping email sending as the only one supported

```javascript
// A flexible interface with a minimal implementation.

/**
 * Sends a notification through a specified channel.
 * @param {object} options
 * @param {string} options.channel - The channel to use ('email', 'sms', etc.)
 * @param {object} options.recipient - The recipient's details.
 * @param {string} options.message - The message content.
 */
async function sendNotification(options) {
    const { channel, recipient, message } = options;

    // We use a flexible interface, but only implement what's needed now.
    switch (channel) {
        case 'email':
            console.log(`Connecting to SMTP server...`);
            console.log(`Sending email to ${recipient.email} with message: "${message}"`);
            // Email-specific logic lives here.
            return { success: true };

        // We acknowledge other channels might exist, but we don't build them.
        // YAGNI prevents us from writing the SMS logic until it's actually required.
        case 'sms':
        case 'push':
        default:
            console.error(`Error: Channel "${channel}" is not implemented yet.`);
            return { success: false, error: 'Not implemented' };
    }
}

// Usage
const user = { email: 'customer@email.com', phone: '555-1234' };
await sendNotification({
    channel: 'email',
    recipient: user,
    message: 'Your subscription is expiring soon!'
});
```
This approach is superior for several reasons:

- **The Interface is Stable**: The sendNotification function and its signature are flexible. When the SMS requirement comes, you don't need to change how the function is called; you just add the logic for the sms case.
- **YAGNI is Respected**: We did not build the SMS or push notification systems. We saved that implementation effort until it was actually needed.
- **It's Extensible**: The design is "open for extension, but closed for modification." We can add new notification channels without modifying the function's contract or the existing email logic.

## Conclusion: Principles as Heuristics, Not Laws

Throughout this post, we've explored how well-intentioned principles like KISS, SRP, and DRY can be misapplied when treated as inflexible laws rather than as guiding heuristics. The common thread is the need for pragmatism over dogma.

  - **KISS** prompts us to ask, "Simple for whom?" It’s about managing and hiding complexity, not naively avoiding it.
  - **SRP** is more useful when we think in terms of a single, clear "goal" for a piece of code, rather than a nebulous "thing."
  - **DRY** warns us that premature or incorrect abstractions can create more problems—like tight coupling—than the duplication they aim to solve.
  - **YAGNI** teaches us the crucial difference between interface and implementation, urging us to design for tomorrow's plausible needs but only build for today's concrete requirements

Ultimately, building great software is a game of trade-offs. Every design decision adds or removes cognitive load and complexity. Instead of blindly following a rule, the real challenge is to pause and consider the context. By understanding the deeper goals behind these principles—managing complexity, improving clarity, and reducing coupling—we can make more informed, pragmatic decisions that truly lead to healthier, more maintainable codebases.