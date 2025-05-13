---
created: 2025-05-14T16:23:51 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c
author: Maxim Gorin
---

# Template Method Pattern: Define the Flow, Customize the Steps | by Maxim Gorin | Apr, 2025 | Medium

---
[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--027d5c3cfcc6---------------------------------------)

Welcome back to our design pattern series! In the previous article, [**Strategy Design Pattern: Write Flexible Code Without Conditionals**](https://maxim-gorin.medium.com/strategy-design-pattern-write-flexible-code-without-conditionals-6d956ef42e20), we explored how the Strategy pattern uses composition to swap out algorithms easily. Today, we continue the series by examining another behavioral pattern — the **Template Method**. This pattern takes a different approach: it uses inheritance to define the **skeleton of an algorithm** and lets subclasses customize certain steps. We’ll break down what Template Method is, how it works (and sometimes doesn’t), compare it to Strategy, and walk through a Dart code example. By the end, you’ll understand when to use Template Method to write clean, extensible code, and when it might be better to consider alternatives.

![](https://miro.medium.com/v2/resize:fit:700/1*KCI7HhoQHjTo4xTG3BzY5g.png)

Template Method Design Pattern

## What is the Template Method Pattern?

The Template Method is a **behavioral design pattern** that **defines the outline of an algorithm in a base class**, allowing subclasses to provide specific implementations for some of the steps. In the classic definition from the Gang of Four, the Template Method pattern _“define\[s\] the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm’s structure.”_. In simpler terms, the base class contains a **template method** (often `final` or non-overridable) which **executes a series of steps in a fixed order**, and those steps are implemented in either the base class or its subclasses.

## How Does the Template Method Pattern Work?

The Template Method pattern relies on **class inheritance** to achieve its structure. Here’s how it typically works:

-   **Abstract Base Class:** You start with an abstract (or base) class that declares the template method and the abstract or hook operations. For example, in Dart we might have a base class `AbstractProcess` that defines a method `execute()` as the template.
-   **Template Method:** This method (let’s call it `execute()` or `templateMethod()` in pseudocode) orchestrates the algorithm. It calls a sequence of other methods (steps) in a specific order. The template method itself is usually marked as `final` (non-overridable) to prevent subclasses from altering the overall sequence. As an illustration, the base class might implement:

This guarantees that `step1`, then `step2`, then `step3` will run in that order every time.

```
<span id="6713" data-selectable-paragraph=""><span>void</span> execute() {<br>    step1();<br>    step2();<br>    step3();<br>}</span>
```

-   **Primitive Operations (Steps):** The steps like `step1()`, `step2()`, `step3()` are typically either **abstract methods** (no implementation in the base class) or **hook methods** (base class provides a default or empty implementation). Subclasses **must override** abstract methods to provide concrete behavior, while hook methods are optional to override. The base class might also implement some steps itself if there’s common logic.
-   **Subclasses:** Concrete subclasses inherit from the base class and **override the required steps**. Each subclass supplies the variant parts of the algorithm, but leaves the overall `execute()` process intact. Importantly, subclasses do **not** override the template method itself – only the steps. (In fact, one of the pattern’s rules is that the template method should not be overridden, so it’s often marked final.) This ensures the algorithm’s structure is preserved.

In practice, when you run the algorithm, you instantiate a subclass and call the template method. The base class’s template method runs, and as it reaches each step, it will call the subclass’s implementation for that step (thanks to polymorphism). The subclass code “hooks into” the predefined sequence. This design ensures that **the overall sequence of actions is fixed** by the base class, but **individual steps can vary** in the subclasses.

For example, imagine an algorithm with steps A, B, C, and D. The base class’s template method calls them in order: A → B → C → D. Suppose steps A and D are the same for all cases (implemented in the base class), but steps B and C should differ for different scenarios. You’d make B and C abstract in the base class. Subclass X provides its own B and C, and subclass Y provides different B and C. No matter which subclass is used, the template method ensures the call order A-B-C-D remains the same. The subclasses only affect what happens during B and C. As a result, you get variation where you need it, but consistency in the overarching process.

A key aspect of Template Method is that it **promotes code reuse**. Common code for the algorithm’s invariant parts lives in the base class (so it’s written once), while unique behavior is in subclasses. This avoids duplicating the same sequence logic in multiple classes. It also means if a general step changes (say we add a new step E at the end of the algorithm), we can update the base class’s template method to include it, and all subclasses automatically follow the new sequence. (Of course, this assumes the new step makes sense for all subclasses — more on the risks of rigidity soon.)

To summarize the mechanics: **the base class defines _what_ to do (the algorithm structure), and subclasses define _how_ to do some parts of it.** This pattern is about **inheritance and polymorphism** — the base class calls methods that are overridden by subclasses. It’s a classic example of “framework calls your code” (inversion of control), which contrasts with simply writing a monolithic algorithm or using composition strategies. As long as the subclasses honor the expected behavior of each step, you can add new variants without changing the base algorithm.

## Template Method vs. Strategy Pattern

It’s easy to confuse Template Method with the Strategy pattern since both deal with varying an algorithm’s behavior. However, they use **opposite approaches** to achieve flexibility. Let’s contrast them:

-   **Inheritance vs Composition:** Template Method is **inheritance-based** — you subclass a base class to create variations. Strategy is **composition-based** — you inject or assign different strategy objects to change behavior. In Template Method, the set of variations is tied to the class hierarchy (compile-time polymorphism). In Strategy, the variations are separate strategy classes, and a context object can **delegate** to different strategies at runtime.
-   **Fixed Algorithm Structure vs Swappable Algorithm:** Template Method works at the **class level** — the algorithm’s structure is fixed in the base class and cannot be changed at runtime (it’s determined by which subclass you instantiate). Strategy works at the **object level** — the algorithm can be changed on the fly by swapping the strategy object, because the host object delegates behavior to a strategy interface. In short, Template Method is static (decided by subclass), while Strategy is dynamic (decided by object composition).
-   **Delegation of Whole Algorithm vs Partial Override of Steps:** In Strategy pattern, the entire algorithm (or part of business logic) is delegated to the strategy object. The context doesn’t know the details; it just calls (for example) `currentStrategy.execute()`. With Template Method, the base class runs the whole algorithm and controls the sequence, and subclasses _provide implementations for certain steps_. The context (if any) just calls the template method; the variation happens internally via polymorphism.
-   **Granularity of Variation:** Template Method is great when you have one algorithm that needs slight variations in some steps. Strategy is often used when you have completely different algorithms that fulfill the same goal and can be chosen interchangeably. For example, consider sorting: with Strategy, you might have a `Sorter` context that can use a `QuickSortStrategy` or `MergeSortStrategy` – totally different algorithms for the same task. With Template Method, you might have a sorting algorithm where the outline is the same but one comparison step is different (this is a contrived example, but imagine a scenario where only a small part differs).
-   **Code Duplication:** One motivation for Template Method is to **avoid code duplication across multiple algorithm implementations**. If you used Strategy in a case where algorithms share a lot of common steps, you might end up duplicating that common code in each strategy class. (Or you’d have to factor it out into helpers or an inheritance hierarchy for the strategies, which gets complex.) Template Method solves this by putting the shared steps in the base class. As a result, you write the common code once, and subclasses only handle the unique parts. This was highlighted in our Strategy article and is worth repeating: if you find that multiple strategies have a lot of overlapping code, a Template Method might be a better fit to consolidate the shared logic.
-   **Flexibility:** Strategy shines when you need maximum flexibility — you can mix and match algorithms at runtime, change behaviors based on configuration or user input, etc. Template Method is less flexible in that regard; once an object is of a certain subclass, it follows that algorithm variation. On the other hand, Template Method can enforce a sequence of steps more strictly, which can be useful if that consistency is important.

**In summary:** Template Method and Strategy both let you follow the Open/Closed Principle (extend behavior without modifying existing code), but Template Method does it through inheritance (with an algorithm framework in a base class), whereas Strategy uses composition (by delegating to interchangeable objects). There’s no absolute “better” pattern — the choice depends on your needs. If you need to vary _parts_ of an algorithm and want to avoid duplication, Template Method is great. If you need to vary _whole_ algorithms or swap them during runtime, Strategy is more appropriate.

_Tip:_ Sometimes you can even use them together — for example, a Template Method might include a step that is fulfilled by a Strategy. This hybrid approach can give you a fixed overall process with one particularly flexible step. Design patterns aren’t mutually exclusive silos, but tools you can combine when it makes sense.

## Real-World Analogy

Design patterns can often be understood through analogies. A classic real-life analogy for Template Method is **making a hot beverage (tea or coffee)**. Think of the process of preparing a cup of tea vs a cup of coffee. The overall procedure is the same: _boil water, brew the beverage, pour into cup, and add condiments_. This is the “algorithm skeleton” that never changes. However, one step — brewing — is different for tea and coffee. For tea, you steep tea leaves in hot water; for coffee, you brew ground coffee beans in the water. The condiments might differ too (tea might get lemon, coffee might get milk).

This analogy maps directly to Template Method’s key idea: define the invariant steps once, and let the differing parts be supplied by others (subclasses). The Template Method pattern provides a fixed algorithm structure with slots (abstract methods) for subclasses to implement custom behavior.

## Pros of the Template Method Pattern

Using the Template Method pattern can offer several benefits:

-   **Code Reuse and Reduction of Duplication:** Common code that would otherwise be repeated in multiple implementations is collected in the base class. Subclasses reuse this code by inheriting it. This makes your code DRY (Don’t Repeat Yourself). For instance, if two report generation routines share 80% of their logic, Template Method lets you implement that 80% once in the base class, instead of twice in each routine class.
-   **Consistent Algorithm Structure:** The base class guarantees the steps occur in the correct order. This consistency can be valuable for ensuring a process is followed rigorously. All subclasses follow the same sequence of actions, so there’s no risk that one variant forgets to do a critical step. It’s effectively enforcing a **workflow**. Clients of the algorithm can rely on that high-level workflow being executed, no matter which subclass they’re using.
-   **Easy to Extend Variations:** Adding a new variant of the algorithm is straightforward — create a new subclass and override the necessary methods. As long as the sequence defined by the template method is suitable, you don’t have to touch existing code. This conforms to the Open/Closed Principle: the base algorithm is closed for modification (we’re not changing its code for a new case), but we extend it via a new subclass.
-   **Low Coupling to Specific Steps:** The template method calls the abstract steps, but it doesn’t need to know how those steps are implemented. The base class and the subclasses are tightly related, but the code that uses the template method (client code) can remain oblivious to which subclass is running. From the outside, you just call `baseClassReference.execute()` and polymorphism takes care of executing the right steps. In other words, the client code is decoupled from the concrete implementations of the steps.
-   **Controlled Override Points:** By having well-defined abstract or hook methods, you give subclass developers clear “override points” to customize behavior. This can make it easier to manage complexity than letting subclasses override anything. Some steps can even be optional (hooks with default no-op implementations), so a subclass only overrides it if needed. This provides flexibility without forcing every subclass to implement everything.

## Cons of the Template Method Pattern (and Mitigations)

Despite its strengths, Template Method comes with some potential drawbacks:

## Rigid Structure — Limited Flexibility

The algorithm’s structure is baked into the base class, which can be rigid. Subclasses **cannot change the sequence of steps**; they can only influence what happens within each step. If one subclass needs a slightly different ordering or to skip a step, you’re out of luck without modifying the base class. In other words, the template is **fixed** — you _“cannot change the order of steps, and you cannot override the template method itself”_. This rigidity can be a problem if your use case evolves.

**Mitigation**

To accommodate variations, you can design multiple template methods or add hook methods that subclasses can choose to override to effectively “skip” or alter a part of the process. However, too many hooks can make the algorithm messy. If you foresee needing entirely different sequences, Template Method might not be the right pattern (consider Strategy or a different design).

## Subclass Explosion

Because each variation requires a subclass, you might end up with lots of subclasses for every minor difference. If many parts of the algorithm can vary independently, combining those variations could lead to an exponential number of subclasses. For example, if you have 3 variable steps each with 3 possibilities, a naive Template Method approach might suggest 3³ = 27 subclasses for every combination.

**Mitigation**

Analyze if all combinations are truly needed; if not, stick to the ones that make sense. If many combinations are needed, consider using Strategy for one or more steps instead of subclassing for all variations, or use parameters to alter behavior for smaller differences. Template Method is best when the variations are more coarse-grained or when the number of variants is manageable.

## Inheritance Pitfalls

Template Method ties you to an inheritance hierarchy. Inheritance can sometimes make code less flexible and more tightly coupled than composition. Subclasses are bound to the base class’s assumptions and implementation. If the base class changes, it might impact all subclasses (for good or ill). Also, a subclass can inadvertently break the algorithm if it doesn’t obey the base class’s expectations. For instance, if the base class template assumes a step _always_ does something, but a subclass override does nothing, the algorithm’s outcome might be compromised. This could be seen as violating the Liskov Substitution Principle (a subclass shouldn’t alter the expected properties of the base class’s behavior).

**Mitigation**

Clearly document what each abstract/hook method is supposed to do (contracts). Perhaps assert certain conditions in the base class or provide default implementations that maintain base invariants. Using unit tests for the abstract class with dummy subclasses can catch if overriding a step breaks something.

## Reduced Clarity in Subclasses

Sometimes, a subclass might only override one or two methods, and it’s not immediately obvious from that subclass’s file what the full algorithm is — you have to know to look at the base class to see the sequence. This can make understanding the flow a bit harder for someone reading the subclass in isolation, because the “action” is split between base and subclass.

**Mitigation**

Use clear naming and documentation. For example, name the template method clearly (e.g., `processOrder`) and the step methods descriptively (`validateOrder`, `deliverOrder`, etc.), so it’s easier to infer the sequence. Good documentation in the base class about the algorithm steps will help subclass implementers.

## One Skeleton at a Time

A class can only inherit from one base class in languages like Swift (or Java, C# etc.), because multiple inheritance isn’t supported (excluding interfaces/protocols). This means an object can follow only one template algorithm as defined by its base class. You cannot mix two different template methods easily in one class (without some workaround), whereas with composition you might combine multiple behaviors.

**Mitigation**

If you need to combine algorithms, you might split responsibilities or use composition for one of them. This is more of a language limitation than the pattern itself, but it’s something to consider when designing your class hierarchy.

In summary, the Template Method pattern trades some flexibility for structure and reuse. The **rigid structure** is both a blessing (ensuring a correct sequence and reuse) and a curse (making changes harder if the structure isn’t right for a new case). To use it effectively, design the abstract steps carefully and keep the algorithm general enough to accommodate foreseeable variations. If you find yourself contorting the design to handle new cases (lots of flags, conditional logic in the base class, or empty methods in some subclasses), that’s a sign the pattern might be stretched beyond its sweet spot.

## Example: Template Method in Dart (Order Processing)

Let’s solidify the concepts with a **business-logic–focused Dart example**. Imagine we’re building an order processing system for an e-commerce platform. There are different types of orders (say, physical product orders vs digital product orders), and while the overall fulfillment process is the same, some steps differ. We want to define the **skeleton of the order fulfillment algorithm** once, but allow customization for each order type.

The general algorithm to **process an order** might be:

1.  **Validate the order** (e.g., check that the items are in stock or available).
2.  **Calculate the total price** (taking into account item prices, maybe tax or shipping).
3.  **Process the payment** (charge the customer).
4.  **Deliver the items** (ship the physical goods or deliver the digital product).
5.  **Send a confirmation** (email or notification to the customer).

We’ll use the Template Method pattern to implement this. The base class `OrderProcessor` will define the template method `processOrder()` that does these steps in order. Some steps can have a default implementation (like a generic validation or sending a confirmation), while others will be abstract (certainly the delivery method will differ between physical and digital orders). We'll then create two subclasses: `PhysicalOrderProcessor` and `DigitalOrderProcessor` to handle the differences.

```
<span id="89e3" data-selectable-paragraph=""><span>abstract</span> <span><span>class</span> <span>OrderProcessor</span> </span>{<br>  <span>void</span> processOrder() {<br>    validateOrder();<br>    calculateTotal();<br>    processPayment();<br>    deliverOrder();<br>    sendConfirmation();<br>  }<br><br>  <br>  <span>void</span> validateOrder() {<br>    <span>print</span>(<span>'Validating order... ✅'</span>);<br>  }<br><br>  <br>  <span>void</span> calculateTotal() {<br>    <span>print</span>(<span>'Calculating total price... 💰'</span>);<br>  }<br><br>  <br>  <span>void</span> processPayment() {<br>    <span>print</span>(<span>'Processing payment... 💳'</span>);<br>  }<br>  <br>  <br>  <span>void</span> deliverOrder();<br><br>  <br>  <span>void</span> sendConfirmation() {<br>    <span>print</span>(<span>'Sending confirmation email... 📧'</span>);<br>  }<br>}<br><br><span><span>class</span> <span>PhysicalOrderProcessor</span> <span>extends</span> <span>OrderProcessor</span> </span>{<br>  <span>@override</span><br>  <span>void</span> deliverOrder() {<br>    <span>print</span>(<span>'Shipping physical items via courier... 📦'</span>);<br>  }<br>}<br><br><span><span>class</span> <span>DigitalOrderProcessor</span> <span>extends</span> <span>OrderProcessor</span> </span>{<br>  <span>@override</span><br>  <span>void</span> deliverOrder() {<br>    <span>print</span>(<span>'Delivering digital content via download link... 🌐'</span>);<br>  }<br><br>  <span>@override</span><br>  <span>void</span> calculateTotal() {<br>    <span>print</span>(<span>'Calculating total price (no shipping needed for digital goods)... 💰'</span>);<br>  }<br>}<br><br><span>void</span> main() {<br>  <span>print</span>(<span>"**Processing a Physical Order**"</span>);<br>  <span>final</span> physicalOrder = PhysicalOrderProcessor();<br>  physicalOrder.processOrder();<br><br>  <span>print</span>(<span>"\n**Processing a Digital Order**"</span>);<br>  <span>final</span> digitalOrder = DigitalOrderProcessor();<br>  digitalOrder.processOrder();<br>}</span>
```

**Explanation:**

-   `OrderProcessor` defines the fixed workflow via `processOrder()`.
-   Most steps have default implementations that can be reused or overridden.
-   The `deliverOrder()` method is declared abstract to enforce customization.
-   `PhysicalOrderProcessor` and `DigitalOrderProcessor` override only the steps they need to change, reusing the rest.

**Output:**

```
<span id="6217" data-selectable-paragraph="">**Processing a Physical Order**<br>Validating order... ✅<br>Calculating total price... 💰<br>Processing payment... 💳<br>Shipping physical items via courier... 📦<br>Sending confirmation email... 📧<br><br>**Processing a Digital Order**<br>Validating order... ✅<br>Calculating total price (no shipping needed for digital goods)... 💰<br>Processing payment... 💳<br>Delivering digital content via download link... 🌐<br>Sending confirmation email... 📧</span>
```

This is the essence of Template Method in action — fixed structure, flexible steps.

## Conclusion

By using this pattern, we can reduce duplication, enforce consistent processes, and extend behavior cleanly without touching the core algorithm. It’s especially useful when the general workflow is stable, but specific actions within that flow need to vary. Like all design patterns, it’s not a silver bullet, but in the right scenarios, it offers a solid balance between structure and flexibility.

Thanks for reading! 🚀 If you found this helpful, give the article a clap, leave a comment, or share it with a colleague. And don’t forget to follow the series — more design patterns are on the way!
