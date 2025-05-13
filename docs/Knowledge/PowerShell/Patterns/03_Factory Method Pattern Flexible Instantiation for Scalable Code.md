---
created: 2025-05-14T16:25:37 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c
author: Maxim Gorin
---

# Factory Method Pattern: Flexible Instantiation for Scalable Code | by Maxim Gorin | Mar, 2025 | Medium

---
[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--13f018209d79---------------------------------------)

In the previous article, **“**[**Prototype Pattern Explained: When Copying is Smarter Than Creating**](https://medium.com/p/d05a85ae393a)**”**, we explored how cloning objects can sometimes be more efficient than building them from scratch. Now, we continue our design patterns journey with another creational pattern — the Factory Method. This pattern is a staple in the famous Gang of Four design patterns catalog and is all about flexible object creation. In this article, we’ll explain what the Factory Method pattern is, why it’s useful, and how to implement it, all in a clear and friendly way. By the end, you’ll see how letting subclasses decide what to create can make your code more extensible and maintainable.

![](https://miro.medium.com/v2/resize:fit:700/1*nv1lFuEt4a_7T2-Evux85A.png)

Factory Method Design Pattern

## Alternative Names for the Pattern

Like many design patterns, the Factory Method has alternative names. The most notable is **Virtual Constructor**. This alias comes from the idea that the pattern provides a way to achieve a similar result to constructors (i.e., creating new objects) but using polymorphism (dynamic binding via a “virtual” method override). So if you ever hear someone mention a “virtual constructor” in an object-oriented design discussion, there’s a good chance they’re talking about the Factory Method pattern.

## What the Factory Method Pattern Is

**Factory Method** is a **creational design pattern** that defines an interface or abstract method for creating an object, but lets subclasses decide which class to actually instantiate. In other words, a base class (or interface) declares a factory method for producing some product object, and the subclasses override this method to create specific concrete products. The client code calls the factory method on the base class, but under the hood a subclass’s implementation is executed, returning a more specific type of object.

According to the classic GoF definition: _“Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.”_. This means the pattern pushes the decision of **which exact object to create** out of the client code and into specialized creator classes.

To visualize it, consider the typical structure of the Factory Method pattern. We have a **Creator** (often an abstract class) which declares the factory method (and possibly some general methods that use the created object). We also have a **Product** interface or abstract class, with multiple **ConcreteProduct** implementations. For each ConcreteProduct type, there is a corresponding **ConcreteCreator** class that overrides the factory method to instantiate that product. The Creator’s code (and the client) treats the product abstractly via the Product interface, without knowing the exact subclass.

The key point is that **object creation is delegated** to subclasses. The base Creator class doesn’t know exactly what concrete product will be produced; it just defines the method that asks for a product. Subclasses provide the implementation for that method, thereby determining the actual product class. This inversion of control in object creation gives the pattern its flexibility. The code that uses the factory (often called the _client_ of the pattern) doesn’t need to change when new product types are added — it simply relies on the abstract product interface.

## Analogy from Real Life

To ground this concept, let’s use a real-life analogy. Imagine a large pizza franchise with stores in New York and Chicago. Both cities make **cheese pizza**, but New York style pizza is thin crust, while Chicago style is deep dish. The franchise decides to provide a unified online ordering system. You call a single function `orderPizza("cheese")`, and depending on which store (New York or Chicago) is fulfilling the order, you get a thin crust or a deep dish pizza. From the customer’s perspective, they just ordered a cheese pizza; they don’t know or care which exact class of pizza they got – that’s decided by the store.

In this analogy, the _pizza store_ acts like the **Creator**, and `orderPizza` uses a **factory method** (let’s call it `createPizza`) internally. The **Product** is the pizza (with a base class or interface `Pizza`), and **ConcreteProducts** are `NYStyleCheesePizza`, `ChicagoStyleCheesePizza`, etc. The NewYorkStore class overrides `createPizza("cheese")` to return a `NYStyleCheesePizza`, while ChicagoStore returns a `ChicagoStyleCheesePizza`. The ordering process (perhaps preparing, baking, cutting, boxing the pizza) is defined in the base store, but the creation of the pizza is deferred to subclasses. This way, adding a new store location or a new pizza type means introducing new subclasses or product classes, without altering the core ordering code. This mirrors the Factory Method pattern – a general process with a “hole” (factory method) that subclasses fill in with specific instantiation logic.

## Differences from Using Regular Constructors

You might wonder, “Why go through this indirection? Why not just use `new` or constructors directly to create objects?” It’s a valid question. Using regular constructors is straightforward and usually the default. In fact, **by default, constructors should be preferred** because they’re simple and easy to understand. However, there are scenarios where constructors alone start to fall short, especially when constructing different subclasses based on context.

Consider a scenario without the Factory Method: you have some client code that needs to create different subclasses of a product. A common (but messy) approach is to use conditionals or `switch` statements in the client to decide which class to `new` up. This can lead to code like:

```
<span id="071f" data-selectable-paragraph=""><span>if</span> (<span>type</span> == <span>"Email"</span>) {<br>    notifier = <span>new</span> EmailNotifier();<br>} <span>else</span> <span>if</span> (<span>type</span> == <span>"SMS"</span>) {<br>    notifier = <span>new</span> SMSNotifier();<br>} .....</span>
```

This logic might be scattered across the codebase or centralized in a so-called “simple factory” function. The problem is that every time you add a new product type, you have to modify this conditional logic (violating the Open/Closed Principle). It also tangles the creation logic with business logic, making code harder to maintain.

The Factory Method pattern avoids this by **encapsulating the object creation in a method that can be overridden**. The base class provides a generic interface to get a product, and the subclasses handle the specifics. So the client code simply calls `creator.createProduct()` (or a higher-level operation that uses it) and doesn’t worry about which subclass is actually being instantiated. New product types can be supported by adding new subclasses, without changing the existing client code – adhering to Open/Closed Principle.

Another difference is **semantic clarity**. A factory method often has a descriptive name, like `createConnection()` or `makeVehicle()`, which can make the code more readable than a bare constructor call. For example, if you see `DatabaseConnection conn = DatabaseConnection.createOracleConnection("url")`, it’s immediately clear it returns some Oracle-specific connection. A constructor alone might not convey that intent without reading documentation or parameter names. Using a factory method _with a meaningful name_ can clarify the purpose of object creation.

That said, using a factory method introduces an extra level of indirection — the client calls a method which then calls a constructor internally. This is akin to the difference between using a pointer versus a direct value: an extra indirection adds complexity (and a _very slight_ runtime overhead) but increases flexibility. If you don’t need that flexibility, a direct constructor is simpler. Thus, it’s often wise to start with constructors, and only refactor to factory methods when you encounter problems like repetitive conditional instantiation logic or need for more flexibility (a classic YAGNI/KISS approach).

## Advantages of Factory Method

Using the Factory Method pattern can yield several benefits:

-   **Decoupling and Flexibility:** It **separates the object creation logic from the rest of the code**, meaning the client code doesn’t have to be changed when new types of objects are added. You get a flexible structure where adding a new concrete product just means adding a new subclass (and perhaps registering it somewhere), without breaking existing code that uses the abstract creator.
-   **Open/Closed Principle Compliance:** Because new product classes can be introduced via subclassing rather than by modifying existing logic, the system can be extended more gracefully. The application is more **modular and expandable** — you can introduce new subclasses without altering the core algorithms that use the products. This makes maintenance and evolution easier as requirements change.
-   **Improved Code Organization:** The pattern centralizes and **encapsulates the creation logic** in one place (the factory method and its subclasses). This can lead to cleaner code with less repetition. For example, if object creation is complex (involves several steps or configuration), that complexity is localized in the factory method implementation, not spread all over.
-   **Meaningful Naming:** Factory methods can have names that describe the intent of creation. This makes the code more self-documenting. A constructor can’t have a descriptive name beyond the class name, but a method like `createEncryptedConnection()` immediately conveys what it returns. This can clarify usage for other developers reading the code or using an API.
-   **Swapability and Testing:** If the product is accessed via an interface, it’s easy to substitute a different implementation without the client caring. In tests, you can inject a test subclass of the creator or a test implementation of the product. This **simplifies unit testing** because you can provide mock or stub products by overriding the factory method in a test subclass. The client code is written against the product interface, so it’s straightforward to swap in fakes. (Conversely, if creation was scattered via `new`, it’s harder to replace those with test doubles.)
-   **Controlled Access or Singletons:** A factory method can decide to return an existing instance instead of always creating a new one. This can be used for caching or implementing singletons/multitons. For instance, a factory method might keep a pool of objects and dispense one on each call. This is more of a specific use-case, but it’s something that cannot be achieved by a plain constructor (outside of the constructor managing a static pool itself, which is not a typical responsibility).

In summary, Factory Method provides an extra layer of flexibility in how objects are created and which classes are instantiated, leading to code that is easier to extend and manage in the face of change.

## Drawbacks and Potential Workarounds

No pattern is perfect. Factory Method introduces some trade-offs and potential downsides:

## Increased Complexity & Class Count

Perhaps the most obvious drawback is that it **adds more classes and layers** to your design. For each product hierarchy, you often end up with a parallel creator hierarchy. This can feel **heavy** when a simple `new` might have sufficed. If you have too many factories or too many small classes, it could complicate understanding and maintenance. The indirection might be overkill for simple cases.

**Workaround**

Don’t use the pattern blindly. If you only have one or two types and don’t expect to add more, a simple static factory or even an if/else in one place might be simpler. Use Factory Method when you really need the scalability and decoupling. Also, you can sometimes combine multiple related creation responsibilities into one factory class to avoid a proliferation of classes (though that starts to resemble the Abstract Factory pattern).

## Coupling between Creator and Product

The factory method pattern still has some coupling in that the _ConcreteCreator classes are tied to specific ConcreteProduct classes_. The abstract creator knows about the abstract product, but each concrete creator typically references a concrete product class in its implementation. If there’s a one-to-one relation between creator and product, you’ve essentially moved the dependency from the client to the factory. This is fine (and usually an improvement), but it’s not magic — new product types still require writing new code (just in a separate subclass).

**Workaround**

Often this coupling is acceptable because it’s on the subclass level, not in the high-level code. If it becomes an issue (say, you want to decouple even the creator from products), you might look at the Abstract Factory pattern or use dependency injection to provide the factory with product class information. Some languages with reflection or registration can even make the factory more data-driven (e.g., using a map of string->Class to instantiate), which can reduce explicit coupling.

## Client Must Choose the Right Factory

In many scenarios, the **client code needs to decide which ConcreteCreator to use** to get the desired product. For example, you might have to do `new EmailService()` vs `new PushService()` in the client. That’s effectively another kind of conditional logic, just one level up. The design assumes the context will provide or select the appropriate factory. If the client picks wrong or if you still have conditionals to select the factory, some complexity remains.

**Workaround**

Often the selection of factory is done in configuration or at a higher level (for instance, reading a config file that says “channel=push” and then the program uses `PushService`). You can also combine this with a simple registry or factory of factories (which edges into Abstract Factory or Service Locator territory). The key is that the decision of _which_ factory to use is made in one place, and then everywhere else can use the chosen factory polymorphically.

## Slight Performance Overhead

Because factory method relies on polymorphic calls (e.g., calling an overridden method) and sometimes extra object creation for the factory, there is a _minor_ performance cost compared to direct constructor calls. For most applications this cost is negligible (dynamic dispatch is very fast on modern JVMs and CPUs), but in extremely performance-critical inner loops, you might avoid virtual calls.

**Workaround**

If performance is truly a concern, one might use other techniques (like object pooling, pre-creating objects, or code generation to avoid polymorphism). But generally, prefer clarity over micro-optimizations; use profiling to determine if the factory indirection is a real bottleneck (it seldom is outside of tight loops).

## Testing Complexity of Factories

We noted that factory methods can aid testing by decoupling creation. However, the **factory logic itself might be complex** (especially if it involves conditional logic or configuration) and need its own testing. This means writing tests for your factory subclasses. If those factories are small and just call a constructor, testing might be trivial or even unnecessary. But if they do more (like manage object pools or convert parameters), that’s extra code to maintain and test. In other words, you’ve moved the complexity but not eliminated it.

**Workaround**

Keep factory methods simple. If a factory method starts to have a lot of logic, consider if some of that should belong elsewhere (Single Responsibility Principle). Also, you can sometimes use abstract tests (testing the contract of the factory using the abstract product interface) and then run those against different implementations.

In summary, the Factory Method pattern introduces an extra abstraction. The cost is more code (more classes, methods, indirection) and the need to manage those. The benefit is obtained when that extra abstraction pays off in flexibility or clarity. It’s a classic case of trade-offs: **more indirection for more flexibility**. The key is to apply the pattern in scenarios where that trade-off makes sense.

## When to Use the Factory Method Pattern

To decide if Factory Method is right for a situation, consider these guidelines (adapted from the GoF criteria and other sources):

-   **Use Factory Method when you don’t know beforehand what exact types of objects you’ll need.** If your code is working with an interface (or superclass) and you want to defer the decision of which concrete implementation to later (perhaps at runtime or in subclasses), a factory method provides that indirection. Example: In a drawing application, the tool class might have a `createShape()` factory. A RectangleTool returns a Rectangle, an EllipseTool returns an Ellipse, but the code managing tools treats them all as Shape.
-   **Use it when you want to avoid tight coupling to concrete classes.** If you find your code `new`ing specific classes all over the place, and those classes might change or new ones added, that’s a hint that a factory could help. The pattern will let you depend only on abstractions in most of your code.
-   **Use it to follow the Open/Closed Principle for object creation.** Whenever adding a new kind of object would otherwise require changing existing code (e.g. adding a new `else if` somewhere), think about refactoring to a Factory Method. This way, adding a new class is “closed” for modification in existing code and “open” for extension by adding new code (new subclass).
-   **When designing frameworks or libraries.** If you’re writing a framework that will be extended by others, factory methods are a common way to allow custom object creation. For example, if you have an abstract `Application` class in a GUI framework, you might put a `createWindow()` factory method in it. Developers subclass `Application` and override `createWindow()` to return their `MainWindow` subclass. The framework calls `app.createWindow()` internally to get windows without knowing the details. Use Factory Method to provide extension hooks for such cases.
-   **When you need slight variations in object creation.** Sometimes you want to do extra steps when creating an object — perhaps setting some default state, or deciding which subclass to instantiate based on some criteria. You can do this in a static factory method or a constructor, but if those variations need to be chosen polymorphically (different classes want different behavior), then a factory method on an abstract class is a good fit.

In contrast, you might **avoid** Factory Method if the object creation is simple and unlikely to change or if managing many small classes would be a bigger headache than an occasional `if/else`. Always weigh the cost of the added abstraction against the benefit it provides.

## Kotlin Example — Factory Method in Action

Let’s solidify our understanding with a full example in Kotlin. Suppose we are building a notification system. Depending on the communication channel, we want to send messages via different notifiers: email, SMS, or push notifications. We’ll use the Factory Method pattern to encapsulate this flexibility.

First, we define an interface for the product (Notifier), concrete product classes (EmailNotifier, SMSNotifier, PushNotifier), an abstract creator (NotificationService), and concrete creators (EmailService, SMSService, PushService). The NotificationService class will have a factory method `createNotifier()` that subclasses override, and it may also have a general method `notifyUser()` which uses whatever Notifier the factory provides.

```
<span id="185b" data-selectable-paragraph=""><br><span>interface</span> <span>Notifier</span> {<br>    <span><span>fun</span> <span>send</span><span>(message: <span>String</span>)</span></span><br>}<br><br><br><span>class</span> <span>EmailNotifier</span> : <span>Notifier</span> {<br>    <span>override</span> <span><span>fun</span> <span>send</span><span>(message: <span>String</span>)</span></span> {<br>        println(<span>"Sending Email with message: <span>$message</span>"</span>)<br>    }<br>}<br><br><span>class</span> <span>SMSNotifier</span> : <span>Notifier</span> {<br>    <span>override</span> <span><span>fun</span> <span>send</span><span>(message: <span>String</span>)</span></span> {<br>        println(<span>"Sending SMS with message: <span>$message</span>"</span>)<br>    }<br>}<br><br><span>class</span> <span>PushNotifier</span> : <span>Notifier</span> {<br>    <span>override</span> <span><span>fun</span> <span>send</span><span>(message: <span>String</span>)</span></span> {<br>        println(<span>"Sending Push Notification with message: <span>$message</span>"</span>)<br>    }<br>}<br><br><br><span>abstract</span> <span>class</span> <span>NotificationService</span> {<br>    <span>abstract</span> <span><span>fun</span> <span>createNotifier</span><span>()</span></span>: Notifier<br><br>    <span><span>fun</span> <span>notifyUser</span><span>(message: <span>String</span>)</span></span> {<br>        <span>val</span> notifier = createNotifier()<br>        notifier.send(message)<br>    }<br>}<br><br><br><span>class</span> <span>EmailService</span> : <span>NotificationService</span>() {<br>    <span>override</span> <span><span>fun</span> <span>createNotifier</span><span>()</span></span>: Notifier = EmailNotifier()<br>}<br><br><span>class</span> <span>SMSService</span> : <span>NotificationService</span>() {<br>    <span>override</span> <span><span>fun</span> <span>createNotifier</span><span>()</span></span>: Notifier = SMSNotifier()<br>}<br><br><span>class</span> <span>PushService</span> : <span>NotificationService</span>() {<br>    <span>override</span> <span><span>fun</span> <span>createNotifier</span><span>()</span></span>: Notifier = PushNotifier()<br>}<br><br><br><span><span>fun</span> <span>main</span><span>()</span></span> {<br>    <span>val</span> services: List&lt;NotificationService&gt; = listOf(<br>        EmailService(),<br>        SMSService(),<br>        PushService()<br>    )<br><br>    <span>val</span> message = <span>"Welcome to the system!"</span><br><br>    <span>for</span> (service <span>in</span> services) {<br>        service.notifyUser(message)<br>        println(<span>"---"</span>)<br>    }<br>}</span>
```

**Output:**

```
<span id="7abd" data-selectable-paragraph="">Sending Email with message: Welcome to the system!<br>---<br>Sending SMS with message: Welcome to the system!<br>---<br>Sending Push Notification with message: Welcome to the system!<br>---</span>
```

Let’s break down what’s happening in this Kotlin example:

-   We have a `Notifier` interface (the product interface) with a `send()` method. `EmailNotifier`, `SMSNotifier`, and `PushNotifier` are concrete products implementing `Notifier` with their own version of `send()`.
-   `NotificationService` is an abstract creator class. It declares the **factory method** `createNotifier()` as an abstract function returning a `Notifier`. It also provides a concrete method `notifyUser()` which sends a message using the `Notifier` produced by the factory method.
-   `EmailService`, `SMSService`, and `PushService` are concrete creators. Each overrides `createNotifier()` to return the appropriate concrete product. These classes encapsulate the decision of which notification channel to use.
-   In `main`, the client code constructs a list of `NotificationService` instances (email, SMS, push). Each service calls `notifyUser()`, which internally uses the correct notifier. The client only works with the abstract `NotificationService` interface and does not care about the specific notifier types.

This example shows how the Factory Method pattern makes it easy to extend the system with new notification types. Just create a new `Notifier` implementation and a corresponding `NotificationService` subclass – no changes required to the client code.

## Final Thoughts

The Factory Method pattern is a powerful way to make your code more flexible and aligned with design principles like **program to an interface** and **open for extension, closed for modification**. It trades a bit of upfront complexity (creating an inheritance structure) for long-term benefits in maintainability.

As with any pattern, use Factory Method judiciously. Not every object creation needs a factory — sometimes simple is best. But when you find yourself needing flexibility in creating objects, avoiding duplication in instantiation code, or providing hooks for subclasses, the Factory Method is an elegant solution to have in your toolkit. It’s a friendly pattern once you get to know it, and hopefully this explanation has made it clear and approachable, even if you’re newer to design patterns.

If you enjoyed this article, consider leaving a comment, clapping to show support, or sharing the link with your team. And if you’d like to follow along with future posts in the Design Patterns series, hit that follow button!

Happy coding! 🚀
