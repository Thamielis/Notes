---
created: 2025-05-14T16:37:10 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/the-observer-pattern-let-your-code-react-instead-of-constantly-checking-c6cd1d1e3b88
author: Maxim Gorin
---

# Observer Design Pattern Explained with Real-Life Analogy and Swift Example | Medium

---
## The Observer Pattern: Let Your Code React Instead of Constantly Checking

[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--c6cd1d1e3b88---------------------------------------)

In our design pattern series, we’ve been exploring powerful object-oriented design tools. In the previous article, [**Stop Writing If-Else Trees: Use the State Pattern Instead**](https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c), we saw how the State pattern can clean up complex conditional logic. Now, we continue that journey by examining another fundamental pattern: **the Observer pattern**. This pattern enables objects to react to changes in other objects automatically, without tight coupling. It’s a behavioral pattern that exemplifies the classic **publisher-subscriber** model, where a “subject” broadcasts changes and any number of “observers” receive those updates.

![](https://miro.medium.com/v2/resize:fit:700/1*ownoGP6PPyVL6y6iNna64Q.png)

Observer Design Pattern

## What is the Observer Pattern?

The Observer design pattern defines a **one-to-many relationship** between objects such that when one object’s state changes, all its dependents are notified and updated automatically. In practice, one object (the _Subject_ or _Publisher_) maintains a list of interested dependents (_Observers_ or _Subscribers_) and notifies them whenever a specified event or state change occurs. This allows for a **publish/subscribe mechanism**: the subject publishes updates, and observers subscribe to receive those updates.

Most UI frameworks and event-driven systems make heavy use of this idea. For example, GUI elements can listen for a button’s “click” event (the button is the subject, listeners are observers), or a model object can notify multiple view components when its data changes. The Observer pattern is one of the original GoF (Gang of Four) design patterns, praised for promoting loose coupling and flexibility in design.

## Real-World Analogy

To ground the concept, let’s use a real-world analogy. Imagine a **space mission control center** as the subject and various subsystems as observers. The mission control computer continuously monitors critical data like oxygen levels, fuel status, or pressure. Whenever something important changes (say oxygen level drops), it instantly **notifies** several subsystems: the life support system turns on backup oxygen, an alarm system sounds alerts, and a status dashboard updates for engineers. Each subsystem had _subscribed_ to the mission control’s alerts about oxygen changes. The mission control (subject) doesn’t need to know how each subsystem handles the alert; it simply broadcasts the event. The observers (subsystems) automatically react in their own way — one starts a backup pump, another triggers an alarm, another logs the data. This setup mirrors the Observer pattern: one publisher (mission control) and multiple subscribers (life support, alarm, dashboard) that respond when the publisher “pushes” an update.

In this analogy, if the oxygen level goes back up, the mission control might notify all subscribers again, and some observers might then deactivate their emergency responses. The benefit is clear — each component stays in sync with the central data **without constantly checking** it. The subsystems don’t have to repeatedly ask “is there an oxygen update now?”; they simply wait until they are told. This efficient notification system ensures everyone reacts to changes timely, much like how the Observer pattern keeps object state changes from going unnoticed by other parts of a program.

_(Notice that this analogy is not a one-to-one mapping to software components, but it captures the spirit: a single source publishes events, many receivers take action. No one is spamming queries or locked in a tight loop of checks.)_

## How the Observer Pattern Works

![](https://miro.medium.com/v2/resize:fit:700/0*g0wytfORHlsbuB33.png)

[Observer Design Pattern UML Class Diagram — Observer pattern — Wikipedia](https://en.wikipedia.org/wiki/Observer_pattern)

At its core, the Observer pattern involves two sets of actors: **Subjects** and **Observers** (sometimes called Publishers and Subscribers, respectively). Let’s break down their roles and the collaboration:

-   **Subject (Publisher):** This is the object that has some interesting state or event. It maintains a list of observers and provides methods for observers to attach (subscribe) or detach (unsubscribe). When the subject’s state changes or an event occurs, it **notifies** all registered observers, usually by calling a specific update method on each observer. The subject doesn’t need to know details about the observers — only that they conform to an expected interface (e.g. they have an `update()` method). Its sole responsibility is to keep track of observers and inform them of changes.
-   **Observer (Subscriber):** This is an interface or abstract type that defines the update method (the callback that subjects will invoke on notifications). Concrete observer classes implement this interface and define what to do when they receive an update. Observers _register_ themselves with a subject to receive updates, and they should be able to **unregister** if they no longer need those updates. When notified, an observer typically will query the subject for details or use the data passed in the notification to react accordingly.
-   **Notification mechanism:** When an event happens, the subject goes through its list of observers and notifies each one. This can be done **synchronously** (the subject calls each observer’s update method immediately, one after the other) or asynchronously (the subject schedules notifications to happen on another thread or event loop). The classic implementation is often synchronous for simplicity — the subject simply iterates and calls observer methods. In more advanced scenarios or frameworks, notifications might be dispatched asynchronously to avoid slowing down the subject or to allow observers to handle data at their own pace.
-   **Data updates (Push vs Pull):** An important design decision is how much data the subject pushes to observers. In a _push_ model, the subject includes details about what changed (perhaps sending along the new state or change info) in the notification. In a _pull_ model, the subject just notifies that “something changed,” and each observer is expected to pull the details it needs by querying the subject. The push model can send relevant data directly (saving observers from having to query), but if not designed carefully it might send data that some observers don’t need or send large payloads. The pull model keeps the notification simple (just a nudge), but requires observers to know how to get the information they need from the subject. Both approaches are used in practice. The right choice depends on context, but either way, the core pattern remains the same.

In code (in any language), the pattern usually involves a Subject class with methods like `attach(observer)`, `detach(observer)`, and `notifyObservers()`, and an Observer interface with an `update()` method (often parametrized with update info). Observers register themselves with the subject, and the subject invokes `observer.update(...)` when appropriate. This design ensures that **observers automatically stay in sync** with the subject’s state changes, without the subject being tightly integrated with observer logic. You can add new observer types without modifying the subject, which is a big win for the _Open/Closed Principle_ (the subject is open for extension via new observers, but closed for modification).

Before diving into code, one important aspect to note is that observers and subjects are **loosely coupled**. The subject doesn’t need to know concrete classes of observers, only that they adhere to the observer interface. This means you can add or remove observers at runtime independently. The observers know about the subject (they typically register with a specific subject instance), but ideally only through an abstraction (like knowing the subject’s interface or at least that it is the type of subject they care about). This decoupling makes the pattern flexible: we can broadcast to any number of observers, and observers can even be added or removed on the fly as the program runs.

## Example: Implementing Observer in Swift

To illustrate, let’s implement a simple version of the Observer pattern in Swift. Imagine we have a blog that publishes articles and readers who subscribe to be notified of new posts. We’ll create a `Blog` subject and a `Subscriber` (observer) protocol that readers conform to:

```
<span id="419f" data-selectable-paragraph=""><br><span>protocol</span> <span>BlogSubscriber</span>: <span>AnyObject</span> {<br>    <span>func</span> <span>update</span>(<span>newArticle</span> <span>title</span>: <span>String</span>)<br>}<br><br><br><span>class</span> <span>Blog</span> {<br>    <span>private</span> <span>var</span> subscribers <span>=</span> [<span>BlogSubscriber</span>]()  <br><br>    <span>func</span> <span>subscribe</span>(<span>_</span> <span>subscriber</span>: <span>BlogSubscriber</span>) {<br>        subscribers.append(subscriber)<br>    }<br><br>    <span>func</span> <span>unsubscribe</span>(<span>_</span> <span>subscriber</span>: <span>BlogSubscriber</span>) {<br>        <br>        subscribers.removeAll { <span>$0</span> <span>===</span> subscriber }<br>    }<br><br>    <span>func</span> <span>publish</span>(<span>article</span> <span>title</span>: <span>String</span>) {<br>        <span>print</span>(<span>"Blog: Publishing new article '<span>\(title)</span>'"</span>)<br>        notifySubscribers(title)<br>    }<br><br>    <span>private</span> <span>func</span> <span>notifySubscribers</span>(<span>_</span> <span>title</span>: <span>String</span>) {<br>        <span>for</span> subscriber <span>in</span> subscribers {<br>            subscriber.update(newArticle: title)<br>        }<br>    }<br>}<br><br><br><span>class</span> <span>Reader</span>: <span>BlogSubscriber</span> {<br>    <span>let</span> name: <span>String</span><br>    <span>init</span>(<span>name</span>: <span>String</span>) { <span>self</span>.name <span>=</span> name }<br><br>    <span>func</span> <span>update</span>(<span>newArticle</span> <span>title</span>: <span>String</span>) {<br>        <span>print</span>(<span>"<span>\(name)</span> was notified about a new article: <span>\(title)</span>"</span>)<br>        <br>    }<br>}<br><br><br><span>let</span> techBlog <span>=</span> <span>Blog</span>()<br><span>let</span> alice <span>=</span> <span>Reader</span>(name: <span>"Alice"</span>)<br><span>let</span> bob <span>=</span> <span>Reader</span>(name: <span>"Bob"</span>)<br><br>techBlog.subscribe(alice)<br>techBlog.subscribe(bob)<br><br>techBlog.publish(article: <span>"Understanding the Observer Pattern"</span>)<br><br><br><br><br><br>techBlog.unsubscribe(bob)  <br><br>techBlog.publish(article: <span>"Swift Observer Pattern in Practice"</span>)<br><br><br></span>
```

In this code:

-   `Blog` is the subject. It keeps a list of `BlogSubscriber` observers. The `subscribe` and `unsubscribe` methods allow readers to start or stop getting notifications.
-   `BlogSubscriber` is a protocol (restricted to class types with `AnyObject` so we could use weak references if needed). It requires an `update(newArticle:)` method, which the subject will call on each observer when a new article is published.
-   `Reader` is a concrete observer (subscriber) that implements the `update` method. In our example, it just prints a message, but in a real app it might, say, display a notification or fetch the new article content.
-   When `publish(article:)` is called on the Blog, it prints a log and then calls `notifySubscribers`, which iterates through all current subscribers and calls their update method with the new article title. In this way, _Alice_ and _Bob_ (observers) are notified of the event **immediately** as it happens.
-   We demonstrate that observers can unsubscribe. After Bob unsubscribes, publishing another article only notifies Alice. This prevents Bob from receiving updates he’s no longer interested in.

This implementation is intentionally simple. In a real-world Swift scenario, you might use a more robust approach to avoid potential memory leaks — for instance, storing subscribers in a way that doesn’t keep them alive forever (more on that soon), or leveraging Swift’s Combine framework which provides a built-in publish-subscribe mechanism. But as a didactic example, this shows the essence of the Observer pattern in action: **the blog doesn’t need to know anything about Reader’s internals** (only that it has an `update` method), and Readers don’t actively query the blog – they simply react when the blog pushes an update to them.

## Pros and Benefits of Observer Pattern

The Observer pattern offers several advantages:

-   **Decoupling of Components:** The subject and observers are loosely coupled. The subject doesn’t need to know the concrete class of observers (only that they follow an interface), and observers don’t need to know much about the subject beyond the fact that it can be observed. This promotes a modular design where components can be developed and understood in isolation.
-   **Dynamic and Flexible Behavior:** Observers can be added or removed at runtime easily. This means you can **dynamically adjust** who is listening to events. For example, if a new logging component needs to listen to events, it can subscribe on the fly. The system can scale from zero to many observers without code changes in the subject.
-   **Automatic Updates:** Observers automatically stay in sync with the subject’s state. There’s no need for imperative checks or polling loops. This leads to cleaner code, as the logic of “when X changes, do Y” is handled by the pattern’s structure rather than scattered checks. It’s easier to **maintain consistency** between related parts of a program. (For instance, in a model-view scenario, if the model changes, all views reflecting that model update immediately by design.)
-   **Broadcast Communication:** One event can result in any number of reactions. This **one-to-many broadcast** capability is very powerful. Without Observer, you might have to call each component explicitly (violating open/closed principle if new components are added). With Observer, the subject doesn’t care how many observers exist; it just emits the event and all interested parties get it. It’s an elegant way to **notify multiple parts of a system** without hard-coding dependencies.
-   **Encourages Reuse and Separation of Concerns:** Because the pattern decouples what happens (event generation) from what responds (event handling), you can reuse the subject in different contexts with different observers, or reuse observers with different subjects (provided the interface matches). Concern of generating an event is separated from concern of using the event. This often leads to code that adheres to SOLID principles (especially the Open/Closed and Single Responsibility principles).

## Conclusion

The Observer pattern is a timeless solution for scenarios where changes in one part of a system need to be communicated to other parts. By adopting a publish-subscribe model at the object level, it **reduces coupling** and makes your design more flexible and responsive. We saw how it allows a subject to broadcast events to any number of interested observers, and how that can be preferable to hard-coded logic or continuous polling. We also discussed when it’s appropriate to use this pattern versus relying on more elaborate event systems or reactive libraries. Understanding Observer not only helps you write such patterns yourself, but also to use and recognize event-driven frameworks in various languages (from UI callbacks to full reactive streams) which are built on these same fundamentals.

When using Observer, keep in mind best practices around managing subscriptions and avoiding memory leaks. Make sure your observers don’t overstay their welcome, and be mindful of performance if you’re notifying very large numbers of observers or very frequently. Use the pattern judiciously — it’s excellent for certain problems, but not every communication in a program needs to be an observer relationship.

In the toolbox of design patterns, Observer stands out as the one that **turns a web of if-else checks or direct calls into a clean notification system**. Alongside patterns like State (from our previous discussion) that help manage object behavior, Observer helps manage object interactions. Together, these patterns (and others in the series) provide time-tested ways to write cleaner, more maintainable code. As you continue to encounter complex scenarios in software design, remember the Observer pattern as an option for handling change and notification elegantly — your future self (and your collaborators) will thank you when the code scales with grace.

If this article helped clarify the Observer pattern or gave you a fresh perspective on using it effectively, I’d love to hear your thoughts. Have you used Observer in an unexpected way? Faced any interesting challenges with it in production? Drop a comment, share your experience, or pass the article along to a teammate who’s wrestling with complex state updates — let’s keep the conversation going! 🚀
