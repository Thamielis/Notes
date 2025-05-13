---
created: 2025-05-14T16:24:50 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c
author: Maxim Gorin
---

# Strategy Design Pattern: Write Flexible Code Without Conditionals | by Maxim Gorin | Mar, 2025 | Medium

---
[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--6d956ef42e20---------------------------------------)

Welcome back to our design patterns series! In previous installments, we explored patterns like [**Factory Method**](https://maxim-gorin.medium.com/factory-method-pattern-create-flexibly-code-cleanly-13f018209d79) and [**Prototype**](https://maxim-gorin.medium.com/prototype-pattern-explained-when-copying-is-smarter-than-creating-d05a85ae393a). Each pattern equips us with techniques to write cleaner, more flexible code. In this article, we delve into the **Strategy Pattern** — a solution to the messy tangle of `if-else` or `switch` statements that often plague code when choosing among multiple behaviors. We’ll discuss what the Strategy pattern is, why it’s useful, and how it can help mid-level developers (and even keen juniors) design cleaner and more extensible software. Along the way, we’ll use a friendly tone, a real-life analogy, and even a Dart example to cement the concepts. Let’s eliminate that if-else chaos and learn to **choose algorithms flexibly**!

![](https://miro.medium.com/v2/resize:fit:700/1*ypsXDpMO_nbepb6cPGzDNg.png)

Strategy Design Pattern

## What Is the Strategy Pattern?

The **Strategy Pattern** is a behavioral design pattern that allows an algorithm’s behavior to be selected at runtime, without hardcoding all the possibilities in the code. In simpler terms: you define a family of algorithms, encapsulate each one in a separate class (a “strategy”), and make them interchangeable in your program. Instead of writing one monolithic method that does X, Y, or Z based on conditionals, you delegate the actual work to one of these interchangeable strategy objects.

In practice, the pattern involves a few key pieces:

-   A **Strategy interface** — this defines the common method (or methods) that each algorithm must implement.
-   **Concrete Strategy classes** — each class implements the Strategy interface, providing a different algorithm or behavior.
-   A **Context class** — this is the class that uses a Strategy. It has a reference to a Strategy, and when it needs to perform the algorithm, it calls the strategy’s method instead of doing it itself.

By doing this, the context is **decoupled** from the actual algorithm implementations. The context doesn’t need to know _which_ strategy is being used — it just knows it conforms to the interface. You (or the client code) can swap out different strategies for the context to use, without modifying the context’s code.

## Why Use Strategy? (Goodbye, If-Else Chaos)

Many of us have seen (or written!) code that chooses different behaviors using long `if...else if...else` chains or `switch` statements. For example, imagine a payment processing function that does one thing if the payment method is "CreditCard", another if it's "PayPal", another if it's "Bitcoin", and so on. With each new payment type, that function grows another arm on its `if-else` octopus. This approach works for a few cases, but as the number of options grows, the code becomes harder to read and maintain. We call this **if-else chaos** or the “**switch statement smell**.” New requirements force us to dive back into that function and modify it, risking regression bugs in the process. The class holding that logic becomes bulky and violates the [_Single Responsibility Principle_](https://maxim-gorin.medium.com/single-responsibility-principle-building-better-mobile-apps-with-solid-foundations-d2a916c33b2d) and [_Open/Closed Principle_](https://maxim-gorin.medium.com/the-open-closed-principle-a-gateway-to-flexible-mobile-development-700aa26a9267) (it’s not closed for modification if we keep editing it for every new case).

The Strategy pattern offers a cleaner alternative. Instead of hardcoding all algorithm variants in one place, we **encapsulate each algorithm in its own class** and have the context class refer to a strategy abstractly. This brings several benefits:

-   **Eliminates lengthy conditional logic:** The complex conditional logic is replaced by a simple delegation to a strategy object. This makes the code easier to understand at a glance — no more scanning a dozen `if/else` blocks to figure out what’s going on.
-   **Open for extension, closed for modification:** Adding a new algorithm no longer means modifying the existing context code. You can add a new _Concrete Strategy_ class and instruct the context to use it, without touching the context’s code. This adheres to the [_Open/Closed Principle_](https://maxim-gorin.medium.com/the-open-closed-principle-a-gateway-to-flexible-mobile-development-700aa26a9267) and reduces the chance of breaking existing behavior when new features are introduced.
-   **Improved maintainability:** Each strategy is in its own class, so the code for each algorithm is isolated. This makes it easier to maintain or update one algorithm without risking side-effects on others. The context class is simpler and focuses only on coordinating the strategy, not on the intricate logic of each variant.
-   **Better testability:** Because each algorithm is separate, you can unit test each Concrete Strategy independently. The context can be tested with a dummy or mock strategy to ensure it delegates properly. This means fewer complex combinations to test in one monolithic function.
-   **Run-time flexibility:** With strategy, selecting the algorithm can be deferred to runtime. For example, the application might choose a strategy based on user input, configuration, or environment. You could even allow swapping strategies on the fly (e.g., changing a sorting strategy at runtime for performance tuning) without stopping the program. This can be more _dynamic_ compared to a static `switch` which is decided at compile time.

In short, Strategy pattern turns the messy _“if-else tree”_ into a clean structure of interchangeable parts. The context is blissfully ignorant of which concrete algorithm it’s using — it just calls an interface. This separation of concerns yields code that’s easier to extend and less prone to error.

## Flexibility and Extensibility with Strategy

One of the biggest draws of the Strategy pattern is how it **enhances flexibility and extensibility** of your codebase:

## Easily add new behaviors

Suppose your app needs a new way to do something — e.g., a new encryption algorithm, a new file compression method, or a new route-finding heuristic. If you’ve implemented those algorithms as strategies, adding a new one is as simple as creating a new class that implements the strategy interface. The context code doesn’t need any changes to accommodate the new behavior. In contrast, if you had one big if-else, you’d have to modify that function (with all the associated risks).

## Swap algorithms without pain

Because the algorithm is encapsulated in a strategy object, switching to a different algorithm is trivial. For instance, your context could have a method `setStrategy(...)` or you might provide the strategy via a constructor. Changing behavior is just setting a different object. No massive refactoring or conditional logic changes needed. Think of a sorting library where you can set the sorting strategy to QuickSort or MergeSort or HeapSort depending on data size – you can change the strategy in one line of code.

## Different contexts can use the same strategy

Strategies are reusable. You might have two different parts of the program that need a “ranking algorithm” or a “formatting algorithm.” By implementing that as a strategy, both contexts can share the same implementation. This avoids duplicate code in multiple if-else sequences scattered around. If the algorithm needs improvement, you update the one class in one place, and all contexts benefit.

## Configurations and tuning

In complex systems, you might allow configuration to decide which strategy to use. For example, an image processing tool could let users choose between a “fast but low quality” filter vs. a “slow but high quality” filter. Internally, these could be two strategy classes implementing a `FilterStrategy` interface. Because they share an interface, the system can treat them uniformly. This not only makes the system flexible, but also easily extensible for future filters.

It’s worth noting that under the hood, **you still need a bit of logic to choose which strategy to use** — but that logic is cleanly separated. Often a simple factory or dependency injection framework handles that selection. The goal is to avoid littering the _business logic_ with those choices. Instead, push the choice to the boundaries (initialization or configuration), and keep the core logic focused and generic.

## Real-Life Analogy

To ground this concept, let’s use a relatable analogy from **video streaming platforms**. Imagine you’re watching a movie on a service like Netflix. To ensure smooth playback under different network conditions, the platform doesn’t hardcode one video quality. Instead, it selects from several strategies: **high-definition (HD)** for fast connections, **standard-definition (SD)** for moderate ones, and **low-definition (LD)** or **adaptive bitrate** streaming for slow or fluctuating networks.

Each video quality option represents a _strategy_ for the task of delivering a smooth viewing experience. The streaming client (context) doesn’t care about how the video is encoded or delivered — it just knows it has to play the content. It uses a `StreamingStrategy` interface, and depending on network conditions or user settings, it swaps in `HDStreamingStrategy`, `SDStreamingStrategy`, or `AdaptiveStreamingStrategy`.

If tomorrow the service introduces a new AI-based strategy that pre-downloads likely-to-be-watched episodes in advance, it can simply implement a new strategy class and plug it in without changing the playback logic.

Just as video platforms adapt strategies to keep the user experience smooth regardless of connection speed, your software can adapt different algorithms using the Strategy pattern to keep behavior consistent across varying conditions. This analogy highlights the Strategy pattern’s power to **dynamically adapt to runtime conditions while keeping the core logic unchanged**.

## When Is the Strategy Pattern Overkill?

Like any tool, the Strategy pattern is not a silver bullet for every situation with an `if` or `switch`. It introduces abstraction and additional classes, which is a form of complexity. So when might it be **overkill**?

-   **Few variants or unlikely to change**: If you only have two small variations and they are unlikely to grow, a simple `if` might be sufficient (and more straightforward). For example, a function that formats output slightly differently for two hardcoded cases might not need the full strategy treatment. Using strategy in such a trivial scenario could complicate more than help.
-   **Low complexity logic**: If each “algorithm” is only a line or two of code, splitting them into separate classes could be over-engineering. Sometimes a functional approach (like passing a lambda) might be simpler if your language supports it. For instance, in Kotlin or Python, one might just pass a function as a parameter instead of making an entire class — achieving a similar result with less boilerplate.
-   **Performance critical inner loops**: Choosing strategies at runtime does add a level of indirection (a method call via an interface). In nearly all high-level applications this overhead is negligible, but in extremely performance-sensitive code, a straightforward approach might be slightly faster. However, this is rarely a real concern with modern JVM and hardware optimizations.
-   **Team understanding**: If your team (or future maintainers) are not comfortable with design patterns, introducing strategy for a simple problem might confuse them. It’s important to weigh whether the clarity gained by removing if-else is greater than the potential confusion of an abstraction. In well-structured code, usually the benefits outweigh the initial learning curve, especially for mid-level developers who have likely seen similar patterns.

In summary, Strategy is overkill when the problem is so small or stable that the indirection doesn’t buy you much. In those cases, **KISS (Keep It Simple, Stupid)** might guide you to just use a direct approach. But as soon as complexity or likelihood of change grows, strategy starts to pay off. A good heuristic: if you find a method with a growing **nest of conditionals** that choose different behaviors, it’s a prime candidate for refactoring into a Strategy pattern.

## Pros of the Strategy Pattern

Let’s enumerate the **advantages** of using the Strategy pattern in a project:

-   **Cleaner Code Organization**: No more giant functions with interwoven logic for every case. Each strategy resides in its own class, making the code easier to navigate (one class per algorithm) and understand.
-   **Adheres to SOLID Principles**: Strategy promotes the [_Single Responsibility Principle_](https://maxim-gorin.medium.com/single-responsibility-principle-building-better-mobile-apps-with-solid-foundations-d2a916c33b2d) (each strategy class has one job — one algorithm) and the [_Open/Closed Principle_](https://maxim-gorin.medium.com/the-open-closed-principle-a-gateway-to-flexible-mobile-development-700aa26a9267) (add new strategies without modifying existing code). The context is closed for modification but open for extension via new strategy implementations.
-   **Easy to Extend**: Need a new behavior? Just add a new class that implements the strategy interface. The rest of the code base can remain untouched and safe from unintended side-effects. This makes adding features faster and less error-prone.
-   **Interchangeable Algorithms**: Strategies can be swapped at runtime or at configuration time. This can enable powerful flexibility — for example, toggling different AI behaviors in a game, or switching compression algorithms based on data type. All without mucking about in conditional logic.
-   **Improved Testability**: Each concrete strategy can be unit tested in isolation, ensuring its algorithm works correctly. The context can be tested with a **mock strategy** to verify it calls the strategy as expected. This separation simplifies test cases — you don’t need one massive test that triggers every branch of a big if-else, you test each strategy on its own terms.
-   **Reusability**: A well-designed strategy can be reused by different contexts. For example, a validation algorithm (strategy) could be used in an input form context and also in an import routine context. You write the logic once, use it in multiple places by plugging it in.
-   **Eliminates Duplicate Code**: Without strategy, it’s common to see similar if-else ladders in multiple classes (if they have similar choices to make). By extracting the behavior into strategy classes, you avoid duplicating that conditional logic everywhere — you centralize it in the strategy classes.

Overall, the Strategy pattern can lead to a **more robust and flexible architecture**, especially in apps that need to evolve or be configurable. It turns complex conditional logic into an easier-to-manage set of classes with well-defined responsibilities.

## Cons of the Strategy Pattern

No pattern is perfect. Here are some **downsides or trade-offs** when using Strategy, and tips to mitigate them:

-   **More Classes and Indirection**: Strategy introduces additional classes (one for each algorithm). If you have a lot of strategies, you’ll end up with a lot of classes, which can be a bit overwhelming. This “class proliferation” is the flip side of dividing things into small pieces. Mitigation: group strategy classes in a package or module for clarity, use clear naming, and if using a language that supports it, you could use functional strategies (like function objects or lambdas) to reduce boilerplate in trivial cases.
-   **Slight Overhead**: Calling a method via an interface (or through a delegate) is slightly less direct than an inline `if`. However, in practice this overhead is tiny and typically not an issue. It’s usually a good trade for cleaner code. If performance is a concern, measure it – but usually the bottleneck lies in the algorithm itself, not the indirection.
-   **Strategy Selection Logic Still Exists**: Using the Strategy pattern doesn’t mean the `if-else` logic disappears entirely; it’s often moved to a central place (like a factory or configuration). If poorly handled, you might just shift the messy logic elsewhere. Mitigation: keep the strategy selection simple, or use dependency injection frameworks to inject the desired strategy based on config. That way, the selection is done declaratively rather than with hardcoded conditionals.
-   **Uniform Interface Constraint**: All strategies must adhere to the same interface, which means you need to design a one-size-fits-all method signature. In some cases, algorithms might need extra data. You have to pass such data through the context to the strategy, or ensure the strategy can fetch what it needs. This can make the interface somewhat generic (e.g., passing a context object or using strategy-specific parameters). If the algorithms are too varied to fit one interface, strategy might not be the right pattern — or you might need to rethink the abstraction (maybe split into multiple strategy hierarchies).
-   **Possible Code Duplication**: If strategies have a lot in common, you might end up duplicating some code in each class. For example, if two algorithms share 80% of the code and differ in 20%, having two separate classes might duplicate the 80%. There are ways to mitigate this (e.g., using Template Method pattern in conjunction, or composition of shared helper classes). The point is, strategy isn’t great when algorithms are mostly the same with a small tweak — that scenario might call for Template Method instead.
-   **Over-engineering Risk**: If used inappropriately, you might introduce strategy where a simple solution would do. The pattern adds indirection and complexity that must be justified by a real need for flexibility. Always assess the scale of the problem: a pattern should solve a problem, not just be used for its own sake.

To mitigate these cons: apply Strategy pattern when it provides a clear benefit in readability, flexibility, or maintainability. Keep the design _simple_ by not exposing too much of the pattern’s machinery to the rest of the code (the context should shield others from the complexity). And document the intent — let others know, “Hey, we used Strategy here to allow future growth or easy switching of algorithms,” so they understand the rationale.

## Dart Example: Selecting Payment Strategies

Let’s cement our understanding with a practical example in Dart. Imagine we are implementing an online shopping system that needs to process payments in different ways (credit card, PayPal, etc.). Without Strategy, we might write something like:

```
<span id="613b" data-selectable-paragraph=""><br><span>void</span> processPayment(<span>double</span> amount, <span>String</span> method) {<br>  <span>if</span> (method == <span>'CARD'</span>) {<br>    <br>  } <span>else</span> <span>if</span> (method == <span>'PAYPAL'</span>) {<br>    <br>  } <span>else</span> {<br>    <br>  }<br>}</span>
```

This approach would get messy as we add more payment methods. Instead, we’ll use the Strategy pattern to make it clean and extensible.

Below is a Dart implementation with a **PaymentStrategy interface** and two concrete strategies: one for Credit Card and one for PayPal. The **Order** class acts as the context — it will use whatever PaymentStrategy you give it to perform the payment. In the `main` function, we’ll see how to use it and even switch strategies at runtime:

```
<span id="870f" data-selectable-paragraph=""><br><span>abstract</span> <span><span>class</span> <span>PaymentStrategy</span> </span>{<br>  <span>void</span> pay(<span>double</span> amount);<br>}<br><br><br><span><span>class</span> <span>CreditCardStrategy</span> <span>implements</span> <span>PaymentStrategy</span> </span>{<br>  <span>final</span> <span>String</span> cardHolderName;<br>  <span>final</span> <span>String</span> cardNumber;<br><br>  CreditCardStrategy(<span>this</span>.cardHolderName, <span>this</span>.cardNumber);<br><br>  <span>@override</span><br>  <span>void</span> pay(<span>double</span> amount) {<br>    <span>print</span>(<span>'Paying <span>$amount</span> using Credit Card [<span>$cardNumber</span>] for <span>$cardHolderName</span>'</span>);<br>    <br>  }<br>}<br><br><br><span><span>class</span> <span>PayPalStrategy</span> <span>implements</span> <span>PaymentStrategy</span> </span>{<br>  <span>final</span> <span>String</span> email;<br><br>  PayPalStrategy(<span>this</span>.email);<br><br>  <span>@override</span><br>  <span>void</span> pay(<span>double</span> amount) {<br>    <span>print</span>(<span>'Paying <span>$amount</span> using PayPal account [<span>$email</span>]'</span>);<br>    <br>  }<br>}<br><br><br><span><span>class</span> <span>Order</span> </span>{<br>  PaymentStrategy paymentStrategy;<br><br>  Order(<span>this</span>.paymentStrategy);<br><br>  <span>void</span> checkout(<span>double</span> amount) {<br>    <span>print</span>(<span>'Processing order of <span>$amount</span>'</span>);<br>    paymentStrategy.pay(amount);<br>    <span>print</span>(<span>'Payment complete.\n'</span>);<br>  }<br>}<br><br><span>void</span> main() {<br>  <br>  <span>final</span> creditCardStrategy = CreditCardStrategy(<span>'John Doe'</span>, <span>'4111-1111-1111-1111'</span>);<br>  <span>final</span> order = Order(creditCardStrategy);<br>  order.checkout(<span>249.99</span>);<br><br>  <br>  <span>final</span> payPalStrategy = PayPalStrategy(<span>'john.doe@example.com'</span>);<br>  order.paymentStrategy = payPalStrategy;<br>  order.checkout(<span>89.50</span>);<br>}</span>
```

## What happens in the code above?

We start with a credit card payment strategy. The `Order.checkout` function doesn’t know any details about how payment is done – it just calls `paymentStrategy.pay()`. When `main` calls `order.checkout(249.99)`, it will produce output like:

```
<span id="c8a3" data-selectable-paragraph="">Processing order of $249.99<br>Paying $249.99 using Credit Card [4111-1111-1111-1111] for John Doe<br>Payment complete.</span>
```

Next, we change the `order.paymentStrategy` to a `PayPalStrategy` (simulating perhaps the user choosing a different payment method for a new order) and call `checkout` again. Now the output will be:

```
<span id="c601" data-selectable-paragraph="">Processing order of $89.50<br>Paying $89.50 using PayPal account [john.doe@example.com]<br>Payment complete.</span>
```

As you can see, the **Order** class didn’t have to implement the details of each payment method. It simply delegates to whatever strategy it’s given. To support a new payment method (say, Bitcoin or ApplePay), we can create a new class `BitcoinStrategy` or `ApplePayStrategy` that implements `PaymentStrategy` and plug it into Order – no changes needed in the Order class or any if-else chains.

This Dart example is fully runnable and demonstrates how Strategy pattern achieves flexibility. The code is easy to extend (add new PaymentStrategy classes) and modify (change what strategy is used by changing one line where the strategy is constructed or assigned). It avoids the pitfalls of the long conditional approach while clearly separating concerns: Order handles the order workflow, and PaymentStrategy implementations handle the payment details.

## Conclusion

The Strategy pattern is a powerful way to **choose algorithms without resorting to if-else chaos**. By encapsulating each algorithm separately and programming to an interface, we get code that is cleaner, more flexible, and easier to maintain. We saw how strategy can replace long `switch` statements with a design that follows SOLID principles and is open for extension. We also discussed when _not_ to use it – recognizing that for small problems, simpler code might suffice, and understanding the trade-offs in complexity.

For mid-level developers, Strategy pattern is often a natural next step in writing cleaner code once you’ve felt the pain of too many conditionals. For junior developers, it might seem like “extra work” at first, but once you grasp it, you’ll see how it actually simplifies your life in larger projects. It’s like organizing tools in a toolbox versus having them all jumbled in a drawer — a bit of upfront sorting leads to easier use later.

In practice, many frameworks and libraries use the Strategy pattern under the hood (for example, sorting functions that take a comparator function — that comparator is a strategy!). Knowing this pattern will help you recognize and leverage those possibilities.

Feel free to apply the Strategy pattern in your next project where you see varying behaviors. As with all patterns, use it judiciously — when it fits the problem. If you do, you’ll find your code scales better as new requirements come in, and you can add features with less hassle.

🚀 If you found this article helpful, don’t forget to **clap**, **leave a comment**, and **share** it with your fellow developers! Your support helps this series grow and reach more curious minds.

📬 Want more content like this? **Follow** the blog to stay updated on upcoming design pattern breakdowns and other hands-on programming deep dives. See you in the next one!
