---
created: 2025-05-14T16:43:40 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-hardcoding-logic-use-the-chain-of-responsibility-instead-62146c9cf93a
author: Maxim Gorin
---

# Chain of Responsibility Pattern Explained with Real Examples and Kotlin Code | Medium

---
## Stop Hardcoding Logic: Use the Chain of Responsibility Instead

[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--62146c9cf93a---------------------------------------)

In our previous article, [**The Observer Pattern: Let Your Code React Instead of Constantly Checking**](https://maxim-gorin.medium.com/the-observer-pattern-let-your-code-react-instead-of-constantly-checking-c6cd1d1e3b88), we explored how the Observer pattern lets parts of a system react to events in a decoupled way. Continuing our series on behavioral design patterns, this article examines another behavioral pattern: the **Chain of Responsibility**. As the name suggests, this pattern creates a _chain_ of potential handlers for a request. Instead of one object assuming responsibility for handling a request, the request is passed along a sequence (chain) of handlers until one is able to process it. This approach decouples the sender of a request from the receiver, promoting flexibility and cleaner code design.

The Chain of Responsibility (CoR) pattern — _also known as the “Chain of Command” pattern_ — helps avoid tight coupling between senders and receivers of requests. Much like the Observer pattern, CoR is a behavioral pattern that focuses on how objects communicate and organize behavior. But where Observer broadcasts to many listeners, Chain of Responsibility passes a message through a pipeline of handlers one-by-one. Let’s dive into what CoR entails, when to use it, and how to implement it (with a Kotlin example).

![](https://miro.medium.com/v2/resize:fit:700/1*B56aScssDb6nTEr71XcQUA.png)

Chain of Responsibility (CoR) pattern

## What is the Chain of Responsibility Pattern?

**Definition:** Chain of Responsibility is a design pattern in which a request is passed sequentially through a chain of potential handlers until one of them handles the request. Each handler in the chain has a chance to either process the request or pass it to the next handler. The client (the code that issues the request) doesn’t need to know which handler will actually deal with the request — it simply sends it into the chain. This decouples the client from the specific receiver that performs the action, following the _Open/Closed Principle_ by allowing new handlers to be added without modifying existing code.

In simpler terms, CoR turns a series of conditional checks into a flexible object-oriented structure. It’s essentially an object-oriented alternative to writing a long `if-else if-else` or `switch` statement to handle various conditions. Instead of the sender explicitly choosing a code path, the chain structure decides which handler (if any) will handle the request. This can make the code more extensible – you can rearrange or add new handlers to the chain (even at runtime) without changing the code that dispatches the request.

![](https://miro.medium.com/v2/resize:fit:700/0*8XhOpN1cLYqqTPJR.jpg)

[W3sDesign Chain of Responsibility Design Pattern UML — Chain-of-responsibility pattern — Wikipedia](https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern)

**How it works:** You typically define a common interface (or abstract class) for all handlers, often with a method like `handle(request)` (or similar) and a reference to the _next_ handler in the chain. Each concrete handler will attempt to handle the request; if it cannot, it forwards the request to the next handler in line. This continues until a handler handles the request or the end of the chain is reached. If no handler in the chain can handle the request, the request may go unhandled (which is why it’s common to have a default or fallback handler at the end of the chain).

## A Real-World Analogy

To ground the concept, let’s use a real-world analogy. Imagine you’re feeling unwell and need medical advice. You start by visiting a **general practitioner (GP)**. The GP listens to your symptoms and decides if they can treat you. If it’s a common cold or a minor issue, the GP “handles” it by prescribing medication. However, if it’s something beyond their expertise, they refer you to the next specialist in line — perhaps an **ENT specialist** for ear/nose/throat issues, or a **cardiologist** if it seems heart-related. The GP effectively passes your case along to the next doctor in the chain.

You then visit the specialist. The specialist examines you and either treats the issue (if it falls under their specialty) or refers you further — maybe to a **surgeon** or another super-specialist. This continues until you finally reach a doctor who can diagnose and treat your ailment. If none of the doctors in this referral chain can help, you might end up at a research hospital or a top expert as the last resort. At that point, if even they cannot figure it out, you might not get an immediate answer (i.e., the request goes unhandled).

In this analogy:

-   **You (the patient)** are the _request_.
-   **Doctors** are the _handlers_ in the chain.
-   Each doctor either handles your problem (treats you) or passes you to the _next_ doctor (next handler) if they can’t help.

Crucially, you didn’t need to know in advance which doctor would solve your issue. You simply started at the first contact and were _routed dynamically_ through a chain of experts. The process avoided a scenario where you, as the patient, had to check a bunch of conditions (“If it’s a heart issue go to cardiology, if it’s an ear issue go to ENT, if it’s something else, go to…”) on your own. Instead, the chain took care of that decision-making. This mirrors how the Chain of Responsibility pattern allows a request to find a suitable handler without the sender explicitly coding all those conditional checks.

This analogy highlights the key idea: **the request is passed along a chain of potential handlers until one handles it**. The originator of the request isn’t tightly coupled to any specific handler; it just knows the first link in the chain.

## When (and Why) to Use Chain of Responsibility

**Dynamic request routing:** The Chain of Responsibility pattern is ideal when you have a scenario where a request could be handled by more than one object, and you won’t know beforehand which one will actually handle it. In other words, when _the handler of a request should be determined dynamically at runtime_, CoR shines. The client code can send off the request and remain agnostic about who ends up processing it.

You might consider using CoR when:

-   **You have multiple handlers for a type of request, and which one handles it may depend on runtime conditions.** For example, an event in a GUI might be handled by the control that’s clicked, or if that doesn’t handle it, by its parent container, and so on up the hierarchy. CoR is frequently used in UI frameworks for event propagation: the event bubbles through a chain of UI components until one consumes it.
-   **You want to avoid monolithic conditional logic.** If you find yourself writing a big `if/else if/else if/...`chain or a `switch` statement to decide what to do with a request, that’s a code smell CoR can address. The pattern distributes those condition checks into separate handler classes. This not only makes the code cleaner, but also makes it easy to add new conditions (handlers) without modifying the existing dispatching logic – adhering to the Open/Closed Principle.
-   **You need flexible chains that can be extended or reordered.** Because handlers are separate objects, you can compose different chains easily. For instance, you might set up a chain of content filters (profanity filter, spam filter, etc.) for messages. You could enable or disable certain filters by adding or removing them from the chain without touching the code of the others. The chain can even be configured at runtime (e.g., reading handler configuration from a file), allowing dynamic reconfiguration of how requests are handled.

Let’s list a few concrete scenarios where Chain of Responsibility is appropriate:

-   **Event Handling in UI or Game Engines:** An input event (like a keystroke or mouse click) is passed through a chain of elements (e.g., from a focused widget up through parent containers) until one of them handles the event.
-   **Logging Systems:** A logging request might be passed through a chain of log handlers. For example, one handler could log to console, another to a file, another to a remote server. Each handler decides if it can log a message of a certain severity or type. A debug message might be handled (and suppressed) by a console logger, whereas an error message might propagate further to an email-alert handler. This is a form of filtering chain.
-   **Technical Support Escalation:** As mentioned, helpdesk calls or support tickets can be escalated through Level 1, Level 2, Level 3 support, etc., until resolved. Each support level is a handler that either solves the issue or hands it off to the next level.
-   **Approval Workflows:** Business processes where an order, expense, or request needs approval by someone with sufficient authority. The request flows upward through management levels until someone with the right permissions handles it.

By using a Chain of Responsibility, we achieve a form of _loose coupling_: the code sending the request doesn’t have to be updated every time we add a new way to handle the request. We avoid hard-coding dependencies on specific handler classes. If a new handler is needed, we just create it and link it into the chain. This makes the system more **extensible** and **maintainable**. In contrast, a giant `switch` or `if-else` chain would need modification (and recompilation) for every new condition, violating open-closed and single-responsibility principles.

**Avoiding if-else ladders:** Perhaps the biggest motivation for CoR is to replace brittle conditional logic with a more flexible design. Long conditional statements can become unwieldy and are hard to maintain or extend. By using objects and polymorphism (each handler deciding for itself if it can handle the request), CoR allows what some have called a more _object-oriented version of the if-else chain_. The logic that was once all jammed in one method is now distributed across classes, each focused on a particular kind of handling — improving clarity and reuse.

## Example in Kotlin: A Helpdesk Support Chain

To illustrate Chain of Responsibility in code, we’ll use Kotlin and model a simple **helpdesk support escalation** chain. Imagine we have three levels of support: **Tier1Support**, **Tier2Support**, and **Tier3Support**. Each support agent can handle issues of a certain complexity or type, and will escalate (pass along) issues they can’t resolve to the next level.

We start by defining a handler interface (or abstract base class) that all support tiers will implement. This will include a reference to the next handler and a method to handle a support request:

```
<span id="e973" data-selectable-paragraph=""><br><span>interface</span> <span>SupportHandler</span> {<br>    <span><span>fun</span> <span>handleRequest</span><span>(issue: <span>SupportIssue</span>)</span></span><br>}<br><br><br><span>data</span> <span>class</span> <span>SupportIssue</span>(<span>val</span> description: String, <span>val</span> complexity: <span>Int</span>)</span>
```

We’ll use a `complexity` level (say 1 for simple issues, up to 3 for very complex issues) to decide which tier can handle it. Now, let’s create an abstract base class that implements the interface and provides the chaining behavior:

```
<span id="21f6" data-selectable-paragraph=""><br><span>abstract</span> <span>class</span> <span>AbstractSupportHandler</span>(<span>private</span> <span>val</span> next: SupportHandler? = <span>null</span>) : SupportHandler {<br><br>    <br>    <span>abstract</span> <span><span>fun</span> <span>canHandle</span><span>(issue: <span>SupportIssue</span>)</span></span>: <span>Boolean</span><br><br>    <br>    <span>abstract</span> <span><span>fun</span> <span>doHandle</span><span>(issue: <span>SupportIssue</span>)</span></span><br><br>    <span>override</span> <span><span>fun</span> <span>handleRequest</span><span>(issue: <span>SupportIssue</span>)</span></span> {<br>        <span>if</span> (canHandle(issue)) {<br>            doHandle(issue)<br>            <br>        } <span>else</span> {<br>            <span>if</span> (next != <span>null</span>) {<br>                println(<span>"<span>${this::class.simpleName}</span> can't handle (complexity=<span>${issue.complexity}</span>). Passing to <span>${next::class.simpleName}</span>..."</span>)<br>                next.handleRequest(issue)  <br>            } <span>else</span> {<br>                println(<span>"Issue '<span>${issue.description}</span>' could not be handled by anyone in the chain."</span>)<br>            }<br>        }<br>    }<br>}</span>
```

In `handleRequest`, we check `canHandle`. If true, we call `doHandle` (which the concrete class will define) and then stop. If `canHandle` is false, we delegate to the `next` handler in the chain (if there is one). If there’s no next handler, it means the issue went unhandled.

Now let’s create concrete handlers for each support tier:

```
<span id="1a32" data-selectable-paragraph=""><span>class</span> <span>Tier1Support</span>(next: SupportHandler? = <span>null</span>) : AbstractSupportHandler(next) {<br>    <span>override</span> <span><span>fun</span> <span>canHandle</span><span>(issue: <span>SupportIssue</span>)</span></span>: <span>Boolean</span> {<br>        <br>        <span>return</span> issue.complexity &lt;= <span>1</span><br>    }<br>    <span>override</span> <span><span>fun</span> <span>doHandle</span><span>(issue: <span>SupportIssue</span>)</span></span> {<br>        println(<span>"Tier1Support: Resolved issue '<span>${issue.description}</span>'."</span>)<br>    }<br>}<br><br><span>class</span> <span>Tier2Support</span>(next: SupportHandler? = <span>null</span>) : AbstractSupportHandler(next) {<br>    <span>override</span> <span><span>fun</span> <span>canHandle</span><span>(issue: <span>SupportIssue</span>)</span></span>: <span>Boolean</span> {<br>        <br>        <span>return</span> issue.complexity &lt;= <span>2</span><br>    }<br>    <span>override</span> <span><span>fun</span> <span>doHandle</span><span>(issue: <span>SupportIssue</span>)</span></span> {<br>        println(<span>"Tier2Support: Resolved issue '<span>${issue.description}</span>'."</span>)<br>    }<br>}<br><br><span>class</span> <span>Tier3Support</span>(next: SupportHandler? = <span>null</span>) : AbstractSupportHandler(next) {<br>    <span>override</span> <span><span>fun</span> <span>canHandle</span><span>(issue: <span>SupportIssue</span>)</span></span>: <span>Boolean</span> {<br>        <br>        <span>return</span> issue.complexity &lt;= <span>3</span><br>    }<br>    <span>override</span> <span><span>fun</span> <span>doHandle</span><span>(issue: <span>SupportIssue</span>)</span></span> {<br>        println(<span>"Tier3Support: Resolved issue '<span>${issue.description}</span>'."</span>)<br>    }<br>}</span>
```

Each tier has its own `canHandle` logic (based on complexity threshold) and a `doHandle` that prints a resolution message. In a real system, `doHandle` might perform the actual work of resolving the issue.

Now, let’s see how to set up the chain and use it:

```
<span id="8171" data-selectable-paragraph=""><span><span>fun</span> <span>main</span><span>()</span></span> {<br>    <br>    <span>val</span> tier3 = Tier3Support()                      <br>    <span>val</span> tier2 = Tier2Support(next = tier3)<br>    <span>val</span> tier1 = Tier1Support(next = tier2)          <br><br>    <br>    <span>val</span> supportChain: SupportHandler = tier1<br><br>    <br>    <span>val</span> simpleIssue = SupportIssue(<span>"Forgotten password"</span>, complexity = <span>1</span>)<br>    <span>val</span> intermediateIssue = SupportIssue(<span>"System running slow"</span>, complexity = <span>2</span>)<br>    <span>val</span> hardIssue = SupportIssue(<span>"Data loss in database"</span>, complexity = <span>3</span>)<br>    <span>val</span> impossibleIssue = SupportIssue(<span>"Quantum server anomaly"</span>, complexity = <span>5</span>)<br><br>    <br>    supportChain.handleRequest(simpleIssue)<br>    supportChain.handleRequest(intermediateIssue)<br>    supportChain.handleRequest(hardIssue)<br>    supportChain.handleRequest(impossibleIssue)<br>}</span>
```

If we run this, the output might look like:

```
<span id="a65c" data-selectable-paragraph="">Tier1Support: Resolved issue 'Forgotten password'.<br><br>Tier1Support can't handle (complexity=2). Passing to Tier2Support...<br>Tier2Support: Resolved issue 'System running slow'.<br><br>Tier1Support can't handle (complexity=3). Passing to Tier2Support...<br>Tier2Support can't handle (complexity=3). Passing to Tier3Support...<br>Tier3Support: Resolved issue 'Data loss in database'.<br><br>Tier1Support can't handle (complexity=5). Passing to Tier2Support...<br>Tier2Support can't handle (complexity=5). Passing to Tier3Support...<br>Issue 'Quantum server anomaly' could not be handled by anyone in the chain.</span>
```

This demonstrates the chain in action:

-   The Tier1 handler immediately handled the simple issue.
-   A more complex issue had to be passed to Tier2.
-   The very complex issue went all the way to Tier3.
-   An “impossible” issue (complexity 5) went through all handlers and remained unhandled at the end, triggering the message from Tier3 that nobody could handle it.

In this example, each handler had overlapping capability (Tier2 can handle Tier1 issues too, etc.). We could refine conditions to avoid redundant handling, but the idea is clear: each object gets a shot at the request in turn.

This implementation focuses on a clean, object-oriented approach. **Kotlin specifics:** We used an abstract base class to hold the chain logic, but we could also have each class implement the interface and manage the `next` handler reference internally (perhaps via a constructor parameter as we did). Kotlin’s primary constructors allowed us to easily pass the `next` handler on object creation (`Tier2Support(next = tier3)`). We could further simplify by using default interface methods or higher-order functions, but the above is straightforward OOP.

The Chain of Responsibility pattern offers several advantages:

## Reduced Coupling

The request sender does not need to know which specific object will handle its request. The sender only knows about the chain (often just the first handler). This decouples the sender from concrete handler classes. For example, in our Kotlin example, the client code only dealt with the `SupportHandler` interface and didn’t need to reference each tier class.

## Flexibility and Extensibility

It’s easy to add new handlers or change the order of handlers in the chain. You can change the chain composition without modifying the code that sends requests. If a new kind of support tier is introduced, we can just insert a new handler into the chain. This makes the system open for extension (new handlers) without altering existing handler logic — a win for the Open/Closed Principle.

## Dynamic Control Flow

Handlers can be assembled dynamically at runtime. For instance, you might let users configure which rules (handlers) apply for processing a request. Since all handlers share a common interface, you can chain them in any combination. The condition–action blocks (which would be `if` branches in a monolithic approach) can be rearranged or swapped out easily.

## Responsibility Segregation

Each handler class has a single, well-defined responsibility (handling one particular kind of request or condition). This tends to result in cleaner code, as each class is focused on one task (in our example, each tier class had logic only for its own complexity level). It aligns with the Single Responsibility Principle by avoiding one mega-class that does all the dispatch logic.

## Option for Default Handling

You can designate a default or fall-back handler at the end of the chain to catch any requests that no other handler processed. This ensures nothing falls through the cracks. For example, we could add a `DefaultSupportHandler` at the end of our chain that logs unresolved issues or notifies someone, rather than just dropping the request.

## Reusability of Handlers

Because handlers are separate classes, they can often be reused in different contexts or chains. You might have a set of handlers that can be assembled in different sequences for different scenarios. This modularity can reduce duplicate code.

To summarize these, the pattern excels at creating flexible, decoupled systems where multiple objects can cooperate to handle a variety of requests. It transforms conditional logic into a more maintainable form.

## Drawbacks and Limitations

No design pattern is a silver bullet. Chain of Responsibility has its downsides and pitfalls, which you should be aware of:

## Uncertain Handling

There’s no guarantee that a request will be handled unless you ensure a final catch-all handler. If the chain is missing a suitable handler, the request might reach the end unhandled. In our analogy, that’s like a patient not finding any doctor who knows what the illness is.

Always consider having a default handler at the end of the chain (even if it just logs an error or throws an exception) so that requests don’t vanish silently.

## **Harder to Debug**

Following the flow of a request through a chain can be trickier than reading a straight-line sequence of `if-else` statements. If the chain is long or dynamically configured, a developer might need to mentally track which handler will get it next. It can be non-obvious which handler actually handled a request, especially if you’re not familiar with the chain setup.

Good logging and naming can help. In a complex chain, each handler can log when it receives and passes on a request, as we did in our example. This makes debugging easier by tracing the chain’s decisions.

## Performance Overhead

If the chain gets long, the request might pass through many objects before getting handled. Each link adds a function call (or worse, a network hop if handlers are distributed). For high-throughput or performance-critical sections, this overhead could be a concern. In contrast, a direct approach might handle certain cases faster.

Keep the chain as short as reasonable and avoid unnecessary work in each handler when not handling. Also, if performance is critical, consider caching results (if one handler handles a certain kind of request often, maybe short-circuit next time) or ensure that common cases are handled early in the chain.

## Potential for Over-Engineering

This is the big one — it’s easy to get carried away and introduce a Chain of Responsibility where a simple conditional would do. Overusing the pattern can lead to a convoluted network of handler classes that are hard to follow. If you only ever have two possible handlers, for example, a chain might be overkill compared to an `if/else`. We’ll discuss this more in the next section.

## Order Sensitivity

The order of handlers in the chain matters. A request will be handled by the _first_ capable handler it encounters. If the chain is assembled incorrectly, a lower-priority handler might catch a request that a higher-priority handler should have handled. For instance, if you put a generic handler before a more specific one, the generic might always handle those requests and shadow the specific handler. You have to be careful in how you order and design the chain.

## Coupling in the Chain

While the pattern decouples senders from receivers, the handlers themselves are somewhat coupled to the concept of a chain. Each handler knows about a “next” handler. If not using a framework or base class that hides this, each concrete handler class has to manage forwarding, which is a small boilerplate cost. It’s usually fine, but in languages without default interface methods or inheritance, it might require duplicate code (Kotlin handled this with an abstract class in our example to avoid duplication).

It’s worth noting that many of these cons can be managed with good practices. But the key is to apply the pattern judiciously.

## Conclusion

The Chain of Responsibility pattern is a powerful way to let your code handle requests more flexibly by **passing the buck along a linked list of handlers**. It helps eliminate hard-coded conditional logic and makes it easy to add new ways of handling a request without touching existing code. We’ve seen how it works conceptually and in practice with a Kotlin example that demonstrates the pattern’s mechanics.

When applied in the right scenarios, CoR can lead to cleaner, more maintainable code. It embodies solid design principles: decoupling, single responsibility, and open-closed. However, it’s important to use it judiciously — not every problem needs a chain of handlers. For simple cases, a chain might be over-engineering. But when you do have a problem that fits (multiple potential handlers, complex or evolving criteria, a desire for configurability), Chain of Responsibility is like having a well-organized assembly line for your requests.

As with any design pattern, the goal is to improve your codebase’s clarity and flexibility. CoR is one more tool in your toolbox. In the context of behavioral patterns, it provides a nice contrast to Observer: rather than broadcasting events to everyone, it hands off requests down a line until someone takes charge. Knowing when to broadcast and when to hand-off is part of the art of software design.

If this article helped you better understand the Chain of Responsibility pattern — or made you rethink how you’re handling conditional logic in your own code — let me know! Have you used this pattern in a project? Did it simplify your architecture or create unexpected complexity? Write a comment, share your experience, or send the article to a teammate who might be stuck in an `if-else` jungle. Let’s keep the conversation going!
