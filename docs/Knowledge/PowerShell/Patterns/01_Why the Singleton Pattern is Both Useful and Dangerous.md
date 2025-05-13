---
created: 2025-05-14T16:26:58 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/prototype-pattern-explained-when-copying-is-smarter-than-creating-d05a85ae393a
author: Maxim Gorin
---

# Why the Singleton Pattern is Both Useful and Dangerous | by Maxim Gorin | Mar, 2025 | Medium

---
[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--1c32bdf688f0---------------------------------------)

## What is the Singleton Pattern?

The Singleton is a **creational** design pattern that restricts a class to only **one instance** and provides a global access point to that instance. In other words, no matter how many times you try to create the object, you always get back the same single instance. This is useful when exactly one object is needed to coordinate actions across the entire system. Typical implementations achieve this by making the class’s constructor private and exposing a static method or property to get the sole instance.

![](https://miro.medium.com/v2/resize:fit:700/1*h5clXjH6039E5Ml04iU1bw.png)

Singleton Design Pattern

## Real-World Analogy

Imagine you are in a gigantic airport with hundreds of gates, thousands of passengers, and an unlimited number of flights arriving and departing. Despite all this complexity, **there is only one air traffic control tower** that manages the entire airport’s operations.

All flights, pilots, and airlines must communicate with this **single** tower to obtain landing and takeoff permission, to coordinate and avoid disasters. If there were multiple independent towers controlling different parts of the same airport, the system would turn into chaos with conflicting instructions and potential crashes.

This is exactly how a Singleton works — it ensures that there exists one, central instance (the air traffic control tower) that coordinates all communication and directives, preventing inconsistencies and conflicts in the system.

## Problem It Solves

![](https://miro.medium.com/v2/resize:fit:700/0*u8QmpvEygCHQRz9G.png)

[A class diagram exemplifying the singleton pattern | Singleton pattern — Wikipedia](https://en.wikipedia.org/wiki/Singleton_pattern)

The Singleton pattern primarily solves **two problems** in software design:

1.  **Controlled Instantiation (Single Instance):** It ensures that a class has only one instance throughout the program. This is important when you need a single point of coordination or a single shared resource. For example, you might want only one connection to a database or one instance of a printer spooler to prevent conflicting accesses. By preventing additional instantiations, Singleton avoids inconsistencies that could occur if multiple instances were modifying the same resource concurrently.
2.  **Global Access Point:** It provides a well-known **global point of access** to that instance, rather than using global variables. In the absence of Singleton, one might use a global variable to share an object (like a global configuration or logger). But global variables can be overwritten or create namespace pollution. Singleton offers a controlled way to provide global access while protecting the instance from being replaced or duplicated. This means anywhere in the code, one can access the singleton instance (often via a static method like `getInstance()` or similar), ensuring all parts of the program use the same object.

By addressing these two issues, a Singleton makes sure **there is a single resource manager** and that it’s easily accessible. This can be crucial for coordinating actions across different parts of an application that need to share information or resources.

## Advantages of Singleton

Despite controversy around overuse, the Singleton pattern does have some clear advantages when used in the right context:

-   **Single Instance Enforcement:** It **guarantees only one instance** of a class is created. This avoids conflicts in managing shared resources because all code uses the same instance. For example, if your app uses a single configuration manager or a single cache, Singleton ensures all modules refer to that one object (preventing mismatched configurations or duplicate caches).
-   **Global Access Convenience:** The singleton instance is accessible globally, which simplifies interactions with it from anywhere in the program. You don’t need to pass the instance around constantly; any part of the code can call, for example, `Singleton.getInstance()` to retrieve it. This can make certain designs simpler (similar to how an app can globally access an application-wide logger or database connector).
-   **Lazy Initialization:** Singleton can be implemented to **initialize the instance only when it’s first needed (lazy loading)**. This can improve startup performance and resource usage. For instance, if the singleton object is heavy to create (say it loads a large config or connects to a DB), you can delay that cost until actually required. Many languages allow the singleton to be created on first use, and some (like Dart and Java) even naturally initialize static fields lazily, so you don’t pay the cost until necessary.
-   **Controlled Access/Safety:** By funneling access through a single instance, you can centralize certain checks or locking. In multi-threaded scenarios, a properly implemented singleton can ensure **thread-safe** access to a shared resource. Instead of having to manage multiple objects, you only have one, so coordinating thread access (with synchronization or locks) can be simpler. (However, it’s up to the implementation to actually be thread-safe; the pattern itself doesn’t guarantee thread safety unless designed that way.)
-   **Avoids Global Namespace Pollution:** Unlike true global variables, a Singleton typically resides in its class namespace and cannot be accidentally overwritten by another variable. This means you maintain a cleaner global namespace. The pattern encapsulates the global instance inside a class, which is a more organized approach than having lots of unrelated global objects floating around.

Keep in mind that these advantages apply when a singleton is genuinely needed. They can make code simpler and more efficient **when one instance truly makes sense** for the problem at hand.

## Disadvantages and How to Mitigate Them

Singletons are often criticized, especially when overused. Here are the key disadvantages of the Singleton pattern, along with notes on possible mitigations:

## Hidden Dependencies (Global State)

A singleton introduces global state into an application. Because any code can access the singleton instance from anywhere, it effectively behaves like a global variable. This can make it hard to track which parts of the program use or modify its state, potentially leading to unpredictable behavior or bugs.

**Mitigation  
**To avoid surprises, document clearly what the singleton does and consider restricting direct access. Some developers use Singleton only behind an interface; parts of the code depend on an interface, and the singleton implements it. This way you can swap it out in tests or later if needed. Also, keep the singleton’s state as minimal as possible to reduce complexity of global state.

## Tight Coupling

Components that use a singleton become tightly coupled to that concrete instance. Because the singleton is globally accessible, many parts of the code might directly call `Singleton.instance`. This makes it hard to change or replace that class later, since so many pieces depend on it. It also violates the principle of **dependency injection**, since classes are implicitly depending on a global.

**Mitigation  
**One solution is to depend on abstractions. For example, have the singleton class implement an interface, and have consumers depend on the interface rather than the concrete Singleton. You could then provide the singleton instance via that interface, or even replace it with a different implementation for testing or future needs. By coding to an interface or base class, you loosen coupling even if there’s only one implementation at runtime.

## Difficult Unit Testing

Singletons can make **unit testing** harder. Since the singleton is global, tests might inadvertently use the real singleton when you would prefer to use a mock or a fake. Also, if one test changes the singleton’s state, it can affect other tests that run later (because the instance persists).

**Mitigation  
**To test in isolation, you might allow the singleton to be reset or to inject a different instance in test mode. Another approach is to avoid calling the singleton directly in your business logic; instead inject its interface (as mentioned above) so you can provide a dummy implementation in tests. Some dependency injection frameworks can also override singletons for testing. At the very least, ensure your singleton class has a method to reset or replace its instance (to clean up between tests), if appropriate.

## Lifecycle and Resource Management

A singleton typically exists for the **entire lifetime of the application**. This means it is never garbage-collected (in many contexts) until the app shuts down. If it holds onto heavy resources (files, network connections, large chunks of memory), those won’t be freed until process end, which can be problematic. Also, if you ever need to **reinitialize** or reload the singleton (say, reload configuration), it can be complex to implement cleanly.

**Mitigation  
**Design singletons to release external resources if needed (for example, a singleton database connection could provide a `close()` that applications call on shutdown). In some cases, consider whether a singleton is truly needed or if you can use a scoped lifetime. Environments like web servers or Flutter apps might restart or hot-reload modules; be cautious that the singleton is re-created appropriately in those scenarios.

## Limited Extensibility

Because of the way singletons are implemented (with a static instance), they are not easily extensible or inheritable. You usually cannot subclass a singleton in a way that the whole system can transparently use the subclass instead — code is hardwired to use the exact Singleton class. Also, you cannot normally create a second instance of a subclass for special cases without altering the singleton class itself. This violates the **Open/Closed Principle** (classes are not open for extension in this regard).

**Mitigation  
**If you foresee the need for variants or subclasses, Singleton might not be the right pattern. One possible solution is to use a registry or **multiton** (a controlled map of instances) to allow a few instances identified by key, rather than one fixed instance (more on multiton below). Alternatively, use factory methods that can return a different implementation (for example, the Singleton’s static accessor could return an instance of a subclass based on configuration, though this adds complexity).

## Violation of Single Responsibility Principle (SRP)

A classic criticism is that Singleton classes have two responsibilities: one for their primary logic and another for managing their sole instance. In other words, a class doing its main job _and_ ensuring only one instance exists is taking on two roles. This is considered a design smell since a class should ideally have only one reason to change.

**Mitigation  
**The most direct way to address this is to separate the concerns — have the object’s creation and lifetime managed externally. For example, use a factory or builder object to manage the single instance. That factory would handle the “only one instance” logic, while the class itself just focuses on its primary work. We discuss this more in the section on SRP below. If using a dependency injection framework, you can configure it to treat a class as a singleton (single instance) without the class itself implementing the pattern — again separating responsibilities.

In summary, Singletons should be used judiciously. Many of these disadvantages can be alleviated by careful design (like using interfaces, dependency injection, or externalizing the instance control). However, if overused or used inappropriately, singletons can indeed lead to hard-to-maintain and tightly coupled code. Always weigh these trade-offs before choosing a Singleton solution.

## Constraints of Using Singleton

There are some important constraints and considerations to keep in mind when using the Singleton pattern:

-   **One Instance per Application (or Process):** A singleton guarantees a single instance _within a single runtime_. If you have multiple processes or a distributed system, each process might have its own singleton. For example, in a multi-process application (or in something like Flutter where each isolate has its own memory), you won’t get one shared instance across processes — just one per process. So the “single instance” is limited to the scope of one program or container.
-   **Thread Safety:** In a multi-threaded environment, you must ensure the singleton initialization is thread-safe. If two threads try to create the instance at the same time, you could accidentally create two instances. Many languages provide ways to make static initialization thread-safe by default (for instance, Java’s class loaders, or Dart’s lazy init). If not, you need to implement locking or use techniques like double-checked locking. Failing to do so can break the singleton guarantee and also introduce bugs or performance issues (e.g. contention if all threads funnel through one object without proper design). A poorly implemented singleton can become a bottleneck under concurrency.
-   **Lifecycle Tied to Application Lifetime:** As mentioned, singletons often live from creation until program termination. This means you can’t usually **destroy and recreate** a singleton in the middle of program execution (at least not without adding special methods to do so). If your application needs to “reset” the state (for example, a soft restart), the singleton might carry state over when you don’t want it to. This long lifecycle also means any memory or resources it holds are effectively global leaks if not managed. In constrained environments, consider providing a way to explicitly release resources or avoid using a singleton for heavy objects that need unloading.
-   **Memory and Performance Considerations:** A singleton might introduce slight memory overhead (it exists even when not actively in use if eagerly created). However, it might save memory compared to creating many instances of the same object. The main point is, if the singleton holds a lot of data, that memory is never freed. If it’s costly to create, the singleton saves time by not recreating it repeatedly. But if it’s rarely used, keeping it alive might be wasteful. Weigh the cost of having it always around versus the cost of constructing on demand.
-   **Inflexibility of Number of Instances:** Once you implement something as a Singleton, if later requirements change to allow more instances, it can be a non-trivial refactor. The code base may be littered with calls assuming a single instance. This is a constraint in design; you’re locking yourself to one instance. Make sure that is a logical, inherent limitation of the concept (e.g. “there should only ever be one of this”) and not just a convenience at the time. If there’s any doubt, consider a more flexible approach (like using a registry of instances or passing objects explicitly).
-   **Not a Substitute for Single Responsibility:** Using a singleton just to avoid passing an object around can be a red flag. If you find you’re making something a singleton primarily because “many parts of the code need it” rather than it **logically must be single**, you might be using the pattern out of convenience and creating unnecessary global state. That convenience can turn into a maintenance headache later. Always enforce that the singleton is justified by the problem (e.g. a single config, a single cache) and not simply to cut corners in object plumbing.

In essence, the constraint of Singleton is that you get **global, long-lived, single-instance access** — you should design with that in mind. Consider how that fits the lifecycle of your application and whether any future scenario could require more flexibility.

## Avoiding Single Responsibility Principle Violations

One noted issue with Singleton is that it can violate the Single Responsibility Principle (SRP). The class not only does its primary job but also controls its own instantiation and lifetime (enforcing the “only one instance” rule). Ideally, a class “should not care whether or not it is a singleton; it should be concerned with its business responsibilities only”.

**How to avoid this violation?** The key is to **separate the concerns of instance management from the class’s core logic**. Here are some approaches:

-   **Factory or Builder:** Instead of having the class enforce the singleton in its code, use a separate factory object to create or retrieve the single instance. The factory would check if an instance exists and either return it or create it if not. The main class can have an internal constructor that only the factory calls. This way, the class itself has one responsibility (its business logic), and the factory has the responsibility of limiting instantiation. For example, a `DatabaseConnection` class might be normal (not aware it's a singleton), and a `DatabaseConnectionFactory` ensures only one connection is ever created and handed out.
-   **Dependency Injection Container:** In modern applications, a dependency injection (DI) framework or service locator can manage singletons. You declare that a certain service or class should have a **singleton scope** in the application. The DI container then ensures only one instance is created and it injects that wherever needed. The class itself remains unaware of this; it just gets instantiated normally by the container. This approach cleanly separates responsibilities: the container manages object lifecycles, and the class just does its job. Many frameworks (Angular, Spring, etc.) allow configuring classes as singletons without the classes implementing the pattern themselves.
-   **Static Singleton Manager:** In simpler scenarios, you could use a separate static helper that holds the single instance. For example, instead of writing the get-instance logic inside the class, you have a standalone manager or even just a static field in another class. However, this is essentially what a DI container formalizes more cleanly.

By adopting these approaches, you adhere to SRP because **the class has only one reason to change: changes in its domain logic**, not changes in how its single instance is managed. As one Microsoft article put it, _“If you want to limit the ability to instantiate some class, create a factory… Now the responsibilities of creation are partitioned away from the responsibilities of the business entity.”_. This allows you to get the benefits of a single instance when needed, without burdening the class with that extra responsibility.

In summary, you can still achieve a singleton-like behavior while keeping SRP intact by externalizing the singleton enforcement. This makes your code cleaner and often more testable, as you can swap out that creation logic if needed (for example, substituting a different instance in tests or changing the instantiation policy later).

## Example: Singleton in Dart

Let’s illustrate how to implement and use the Singleton pattern in Dart. Instead of a logger, let’s consider a **Database Connection Manager**, where we want only one database connection instance to be used across the application.

```
<span id="c95a" data-selectable-paragraph=""><span>class</span> <span>DatabaseConnection</span> {<br>  <br>  DatabaseConnection._internal();</span>
```

```
<span id="5a1e" data-selectable-paragraph="">  // The single instance, stored in a static field<br>  static final DatabaseConnection _instance = DatabaseConnection._internal();</span><span id="6036" data-selectable-paragraph="">  // Factory constructor that returns the static instance<br>  factory DatabaseConnection() {<br>    return _instance;<br>  }</span><span id="b5d5" data-selectable-paragraph="">  // Example method to simulate a database query<br>  void query(String sql) {<br>    print('Executing query: \\$sql');<br>  }<br>}</span>
```

**Explanation:**

1.  **Private Constructor:** `DatabaseConnection._internal()` ensures that no external code can instantiate this class directly.
2.  **Static Instance:** `_instance` is a static field that holds the single instance of the class, ensuring only one object exists.
3.  **Factory Constructor:** The `factory DatabaseConnection()` constructor returns the single instance each time it's called, maintaining the singleton pattern.

**Usage:**

```
<span id="2226" data-selectable-paragraph=""><span><span>void</span> <span>main</span>()</span> {<br>  <span>var</span> db1 = DatabaseConnection();<br>  <span>var</span> db2 = DatabaseConnection();</span>
```

```
<span id="f58e" data-selectable-paragraph="">  db1.query("SELECT * FROM users");</span><span id="e991" data-selectable-paragraph="">  print(db1 == db2);  // true, both references point to the same instance<br>}</span>
```

If you run this, the comparison `db1 == db2` will return `true`, indicating that both variables reference the same singleton instance.

This pattern ensures that all parts of the application use the same database connection object, preventing the unnecessary creation of multiple connections and ensuring efficient resource management. However, in real-world applications, additional safeguards like connection pooling should be considered.

By using this Singleton, any part of the code can call `DatabaseConnection().query("SQL command")` without worrying about passing around the database instance. However, care should be taken when dealing with multi-threaded environments or isolates in Dart, as each isolate has its own memory space.

## Conclusion

The Singleton pattern provides a way to ensure a class has only one instance and to provide easy global access to that instance. It can be very useful for certain scenarios like centralized management of resources or configurations. We explored its definition, analogies, the problems it addresses, and its pros and cons. While Singleton can simplify access to shared resources (and reduce memory footprint by avoiding duplicate objects), it comes with downsides like hidden dependencies, tight coupling, and difficulties in testing and extending. Modern best practices urge caution with singletons: prefer clear dependency management and only use singletons when there’s a truly compelling need for one instance.

If used, singletons should be implemented in a clean, responsible way — for example, by separating the singleton’s core logic from the instantiation mechanism to respect design principles like SRP. We also discussed patterns related to Singleton (monostate, multiton, etc.) and how they compare.

In summary, Singleton is a powerful pattern but one that should be applied judiciously. **Reserve it for cases where one-and-only-one object is logically required**, and be mindful of the implications. When in doubt, consider alternatives that achieve similar goals with more explicit architecture. But when you do encounter that rare single-instance problem, the Singleton pattern remains a handy tool in the software design toolbox.

What do you think about the Singleton pattern? Have you encountered challenges using it in your projects? Share your thoughts and experiences in the comments below! If you found this article helpful, don’t forget to **leave some claps**, share it with your friends, and follow for more insights on software design and architecture. Your support helps keep this content going!
