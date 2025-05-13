---
created: 2025-05-14T16:21:12 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c
author: Maxim Gorin
---

# How to Use the Command Design Pattern in Kotlin with Real-World Scenarios | Medium

---
## Why the Command Pattern Is More Useful Than You Think

[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--774eb7ddb685---------------------------------------)

In the previous installment, [**Iterator Pattern: Access Collections Without Knowing Their Structure**](https://maxim-gorin.medium.com/iterator-pattern-access-collections-without-knowing-their-structure-e352ce06b4e1), we saw how design patterns can provide clean solutions by decoupling certain aspects of a program. Today, we explore the **Command Design Pattern**, another behavioral pattern that decouples the sender of a request from the object that executes it by encapsulating requests as independent objects. This pattern is known for enabling operations like undo/redo, queuing tasks, and simplifying complex interactions in a maintainable way.

![](https://miro.medium.com/v2/resize:fit:700/1*ZTOamF9xWZXc5cUjWm93BA.png)

Command Design Pattern

## What is the Command Pattern?

The **Command Pattern** is a behavioral design pattern that turns a request into a stand-alone object containing all information about that request. In simpler terms, it means wrapping an operation (a method call and its parameters) inside an object, so it can be passed around, stored, logged, or executed later. This pattern is _also known as_ the **Action** or **Transaction** pattern.

A formal definition often cited is: the Command pattern _“encapsulates a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations”_. By encapsulating an action and its parameters, the Command pattern allows you to treat requests in a uniform way — for example, any command object can provide an `execute()` method to run the action.

**Key idea:** Instead of invoking a method directly, the invoker (or sender) calls `execute()` on a command object. The command then handles running the actual operation on the appropriate receiver object. This extra level of indirection decouples _what_ action is performed from _who_ actually performs it.

## How Does the Command Pattern Work?

There are four primary roles in the Command pattern:

-   **Command Interface:** Declares an operation (e.g., `execute()`) that all concrete commands will implement.
-   **Concrete Command:** Implements the Command interface. It carries out a specific action by invoking one or more methods on a receiver. It often stores the receiver and any necessary action details (e.g., parameters).
-   **Receiver:** The object that actually performs the work when the command’s `execute()` is called. The concrete command calls the receiver’s methods to carry out the request.
-   **Invoker (Sender):** The object that triggers the command. It knows how to invoke the command (by calling `execute()`), but **does not know** the details of the command’s action or the receiver’s logic. For example, a GUI button class may act as an invoker – it just knows to call `command.execute()` when clicked.
-   **Client:** The code that creates the concrete command objects and sets up which receiver they affect. The client also might attach a command to an invoker. In many scenarios, the client is the part of the code where the pairing between invokers and commands (and their receivers) is configured.

![](https://miro.medium.com/v2/resize:fit:700/0*Qgrtbkvqb9hBOZu4.png)

[Command UML class diagram — Command pattern — Wikipedia](https://en.wikipedia.org/wiki/Command_pattern#)

**In summary:** The Command pattern lets you encapsulate a request (method call) as an object. The client creates command objects and sets their receiver. The invoker triggers commands without needing to know the specifics. The receiver handles the actual logic. This decoupling makes it easy to add new commands or change existing ones without impacting other parts of the code, since invokers and clients only interact with the abstract Command interface.

## A Real-Life Analogy

Imagine you open a delivery app like Uber Eats or DoorDash (you’re the **Client**) and place an order for a pizza. That order becomes a **Command** object — let’s call it `OrderPizzaCommand` — which includes all the necessary details: the restaurant, your address, and the items you selected.

The **Invoker** in this case is the backend order processing system. It doesn’t care about the contents of the order — it just takes the command and triggers its `execute()` method.

The **Receiver** is the restaurant kitchen (and possibly the delivery service). It’s the one that actually fulfills the order by preparing the pizza and arranging delivery.

Why use a command here?

-   You can **queue orders** and process them one by one.
-   You can **cancel orders** before execution.
-   You can **retry failed deliveries** by re-executing the command.
-   You can **log** or even **replay** old orders for analytics or debugging.

This setup cleanly separates who requests the action (the user/client) from who does the actual work (kitchen/driver), with a system in between that just knows how to invoke standardized commands. And if tomorrow you want to add a new feature like “Scheduled Orders” — all you need to do is delay execution. No need to touch how pizza is made.

## Benefits of the Command Pattern

Using the Command pattern provides several benefits:

## Decoupling of Sender and Receiver

The invoker (sender of the request) does not need to know anything about what happens when the command is executed — it doesn’t know the receiver or the operation’s details. This makes code more modular. For example, a menu system can trigger commands without being tied to specific business logic. New commands can be added without changing the menu code, following the Open/Closed principle.

## Flexibility in Switching or Adding Actions

Because each command is a separate class (or function), you can easily add new commands or change existing ones. You can also swap out one command for another at runtime. For instance, you can configure a button to perform a different action based on program state simply by assigning it a different command object. All invokers use the same interface (`execute()`), so they don’t care what the command actually does.

## Undo/Redo and History

Commands can store state for undo or have an `undo()` method to reverse their effect. By keeping a stack of executed commands, implementing multi-step undo/redo becomes straightforward. (Without Command, undo logic tends to get messy, often requiring reverse if/else logic for each action or full state snapshots.) The Command pattern cleanly encapsulates undo logic with the action itself.

## Queuing, Scheduling, and Logging

You can queue up command objects to be executed later or in a specific order (perhaps even on a different thread or machine). This is great for task scheduling systems or handling asynchronous workflows. You can also log commands as they’re executed (for auditing or replication) because each command object is a self-contained unit of work.

## Single Responsibility & Open/Closed

Each concrete command has one specific job (e.g., “Withdraw $100 from Account X”). This separation means each command can be tested in isolation and modified without affecting others. If a new kind of action is needed, you add a new Command class — no need to tangle this logic into existing classes, which keeps things cleaner.

## Higher-Level Operations

Commands can be composed into macro commands, enabling complex operations to be built from simpler ones. This helps in scenarios like transactions or multi-step processes. The invoker can treat a composite command the same as any single command.

Overall, the Command pattern can make your system **extensible and maintainable** by promoting loose coupling and clear separation of concerns.

## Potential Drawbacks and How to Address Them

Despite its benefits, the Command pattern is not free of cost. Here are some potential drawbacks and considerations:

## Increased Complexity and Class Count

Using the Command pattern can introduce a lot of small classes or objects for each action. In a simple system, adding all these classes (one per command) might feel like overkill. This can make the codebase harder to navigate for newcomers (junior developers might find it abstract at first).

**Mitigation**

If you only have a few actions, or if using a full Command class is too much, consider simpler alternatives. In languages like Kotlin (or JavaScript, etc.), you can often use function references or lambdas to represent an action instead of a full-blown class. For example, instead of a concrete Command class, you might pass a `() -> Unit` lambda to a button. This achieves a similar decoupling (invoker calls the lambda) without extra class boilerplate. However, for complex scenarios (especially with undo/redo or logging), the structure of the Command pattern can pay off. Use your judgment on whether the abstraction is worth it – don’t apply Command if a simple direct call or lambda callback would suffice for a given case.

## Memory and Performance Overhead

Each command is an object that may include state (receiver reference, parameters). Creating and storing many command objects can add memory overhead. If your system queues thousands of commands or runs on a memory-constrained environment (like an embedded system), this overhead might matter. There’s also a slight runtime cost to indirection — calling `execute()` on a command that then calls a receiver, versus just calling the receiver directly.

**Mitigation**

In most high-level applications the overhead is negligible, but in performance-critical inner loops, you might avoid the pattern. If memory is a concern, you might reuse command objects or use object pooling. Also, modern JVM languages like Kotlin are quite efficient with small objects, and JIT can inline a lot, so the overhead is usually acceptable for the clarity gained. Still, be mindful if commands are extremely frequent or short-lived.

## Dependency Management

Each concrete Command might need to know about the context to do its job (e.g., a file path to delete, or a receiver object). Improper handling of these can lead to complexity or even issues like memory leaks if a command outlives something it references.

**Mitigation**

Carefully manage what a command holds. If a command holds large objects or ones tied to UI lifecycle, ensure they are cleared or the command isn’t kept around too long. Sometimes using value snapshots (like copying needed data into the command at creation) can avoid unintentional retention of heavy resources.

## No Direct Result Return

A command’s `execute()` typically has a `Unit`/`void` return (since it’s often designed to just perform an action). If the invoker or client needs to get a result from the action, the pattern doesn’t provide a direct mechanism. You’d have to provide a way for the command to supply results, perhaps by storing the result in the command object or callback, which complicates the design.

**Mitigation**

Design commands to have a method or property to fetch results after execution if needed (or use the Observer pattern to notify results). In many cases, commands represent actions that don’t need immediate results (like UI commands), so this isn’t an issue.

## Debugging Complexity

Indirection can make debugging a bit harder. The call stack will show `Invoker.execute()` and then maybe an interface call, etc., which is fine, but if commands are created dynamically or queued, it may not be obvious which command is being executed from a quick glance. Also, if using parallel command execution, trace logs might be needed to follow the sequence.

**Mitigation**

Good logging of command execution can help. Giving commands meaningful names (toString) is also useful for debugging (e.g., having `toString()` return "DepositCommand(amount=100)" so logs or debugger show what's what).

## Undo Implementation Complexity

While the pattern makes undo possible, implementing undo can still be non-trivial, especially if commands have complex side effects or interact with external systems. For example, undoing a “SendEmailCommand” after the email is sent is not really possible via software.

**Mitigation**

Only implement undo for operations where it makes sense, and document clearly which commands are undoable. Use Memento or state snapshots for undo if needed. In some cases, a command’s inverse is another command — e.g., an `AddItemCommand` could have an `Undo` that is a `RemoveItemCommand`. Structuring your system to separate pure state changes from external effects can help in supporting undo.

In short, the Command pattern introduces some complexity (more moving parts). The key is to use it **judiciously**: apply it when its benefits (flexibility, decoupling, undo, etc.) clearly outweigh the overhead. For simple scenarios, a simpler design might be preferable. Always remember that design patterns are tools, not rules — it’s fine not to use Command if it doesn’t add clear value to your situation.

## When Should You Use the Command Pattern?

To determine if the Command pattern is a good fit, consider these criteria:

-   **You need to decouple an object making a request from the object that will execute it.** If direct method calls would cause a tight coupling (for example, UI code directly calling business logic methods), introducing Command objects can loosen that coupling.
-   **You plan to support undo/redo or want a history of actions.** If the feature requires reversing operations or recording what happened, commands are a natural way to model each action.
-   **You want to queue, schedule, or execute operations at different times (including in parallel or in a different context).** Commands can be created now and executed later, or even executed by different worker threads. This is useful for job scheduling, task queues, or even sending commands over a network.
-   **You have a high-level operation that can be composed of simpler operations.** Using macro commands (composites) allows building complex logic by reusing simpler command pieces.
-   **Multiple callbacks or actions need to be easily swapped or configured.** For instance, in a plugin system or an interface with dynamic buttons, you can assign different commands without altering the invoker’s code.
-   **You want to log or audit operations.** If it’s important to keep track of every operation (for audit trails, replication, etc.), capturing them as command objects that can be serialized or recorded is very handy.

On the other hand, if your scenario is straightforward — e.g., a simple function call without need for the above flexibility — then using a Command pattern might add unnecessary indirection. Use it when you foresee the need for flexibility, decoupling, or action management that Command provides.

## Kotlin Example: Simple Task Manager with Undo

Let’s solidify our understanding with a practical Kotlin example. Suppose we are implementing a simple console-based task manager for a bank account, where we can perform operations like deposit and withdraw, and we want the ability to undo the last operation. This is a common scenario in everyday development (e.g., transaction scripts) and illustrates undo/redo logic with Command. The example will be runnable in a Kotlin playground (console output, no GUI).

We’ll define a `Command` interface with `execute()` and `undo()` methods, concrete commands for deposit and withdraw, a Receiver class `BankAccount`, and an Invoker that keeps a history stack for undo. Here’s how it could look:

```
<span id="3219" data-selectable-paragraph=""><br><span>interface</span> <span>Command</span> {<br>    <span><span>fun</span> <span>execute</span><span>()</span></span><br>    <span><span>fun</span> <span>undo</span><span>()</span></span><br>}<br><br><br><span>class</span> <span>BankAccount</span>(<span>var</span> balance: <span>Int</span>) {<br>    <span><span>fun</span> <span>deposit</span><span>(amount: <span>Int</span>)</span></span> {<br>        balance += amount<br>        println(<span>"Deposited \$<span>$amount</span>, new balance is \$<span>$balance</span>"</span>)<br>    }<br>    <span><span>fun</span> <span>withdraw</span><span>(amount: <span>Int</span>)</span></span>: <span>Boolean</span> {<br>        <span>return</span> <span>if</span> (amount &lt;= balance) {<br>            balance -= amount<br>            println(<span>"Withdrew \$<span>$amount</span>, new balance is \$<span>$balance</span>"</span>)<br>            <span>true</span><br>        } <span>else</span> {<br>            println(<span>"Withdraw \$<span>$amount</span> failed, balance is only \$<span>$balance</span>"</span>)<br>            <span>false</span><br>        }<br>    }<br>}<br><br><br><span>class</span> <span>DepositCommand</span>(<span>private</span> <span>val</span> account: BankAccount, <span>private</span> <span>val</span> amount: <span>Int</span>) : Command {<br>    <span>override</span> <span><span>fun</span> <span>execute</span><span>()</span></span> {<br>        account.deposit(amount)<br>    }<br>    <span>override</span> <span><span>fun</span> <span>undo</span><span>()</span></span> {<br>        <br>        account.withdraw(amount)<br>        println(<span>"Undo Deposit: withdrew \$<span>$amount</span>, balance back to \$<span>${account.balance}</span>"</span>)<br>    }<br>}<br><br><br><span>class</span> <span>WithdrawCommand</span>(<span>private</span> <span>val</span> account: BankAccount, <span>private</span> <span>val</span> amount: <span>Int</span>) : Command {<br>    <br>    <span>private</span> <span>var</span> success = <span>false</span><br><br>    <span>override</span> <span><span>fun</span> <span>execute</span><span>()</span></span> {<br>        success = account.withdraw(amount)<br>    }<br>    <span>override</span> <span><span>fun</span> <span>undo</span><span>()</span></span> {<br>        <span>if</span> (success) {<br>            <br>            account.deposit(amount)<br>            println(<span>"Undo Withdraw: deposited \$<span>$amount</span>, balance back to \$<span>${account.balance}</span>"</span>)<br>        } <span>else</span> {<br>            println(<span>"Undo Withdraw: nothing to undo"</span>)<br>        }<br>    }<br>}<br><br><br><span>class</span> <span>CommandInvoker</span> {<br>    <span>private</span> <span>val</span> history = mutableListOf&lt;Command&gt;()<br><br>    <span><span>fun</span> <span>executeCommand</span><span>(cmd: <span>Command</span>)</span></span> {<br>        cmd.execute()<br>        history.add(cmd)<br>    }<br><br>    <span><span>fun</span> <span>undoLast</span><span>()</span></span> {<br>        <span>if</span> (history.isNotEmpty()) {<br>            <span>val</span> lastCommand = history.removeAt(history.lastIndex)<br>            lastCommand.undo()<br>        } <span>else</span> {<br>            println(<span>"No commands to undo"</span>)<br>        }<br>    }<br>}<br><br><br><span><span>fun</span> <span>main</span><span>()</span></span> {<br>    <span>val</span> account = BankAccount(<span>100</span>)<br>    <span>val</span> invoker = CommandInvoker()<br><br>    <br>    invoker.executeCommand(DepositCommand(account, <span>50</span>))    <br>    invoker.executeCommand(WithdrawCommand(account, <span>30</span>))   <br>    invoker.executeCommand(WithdrawCommand(account, <span>150</span>))  <br><br>    <br>    println(<span>"--- Undoing last operation ---"</span>)<br>    invoker.undoLast()  <br>    println(<span>"--- Undoing previous operation ---"</span>)<br>    invoker.undoLast()  <br>}</span>
```

**Explanation:** We have a `BankAccount` class that the commands act upon (this is the Receiver). The `DepositCommand` and `WithdrawCommand` each hold a reference to the `BankAccount` and an amount. The `execute()` method of `DepositCommand`calls `bankAccount.deposit(amount)`. The `execute()` of `WithdrawCommand` calls `bankAccount.withdraw(amount)` and records whether it succeeded (so we know if there’s something to undo). Each command’s `undo()` method reverses its operation: `DepositCommand.undo()` simply withdraws the same amount (essentially removing the deposit), and `WithdrawCommand.undo()` deposits back the amount, but only if the original withdraw succeeded. The `CommandInvoker`acts as the invoker/sender that keeps a history stack of commands executed. Its `executeCommand` method executes a command and then saves it to history. The `undoLast()` method pops the last command and calls `undo()` on it.

Running the `main` function, you might get output like:

```
<span id="a320" data-selectable-paragraph=""><span>Deposited</span> <span>$50</span>, new balance <span>is</span> <span>$150</span><br><span>Withdrew</span> <span>$30</span>, new balance <span>is</span> <span>$120</span><br><span>Withdraw</span> <span>$150</span> failed, balance <span>is</span> only <span>$120</span><br><span>---</span> <span>Undoing</span> last operation <span>---</span><br><span>Undo</span> <span>Withdraw</span>: nothing to undo<br><span>---</span> <span>Undoing</span> previous operation <span>---</span><br><span>Deposited</span> <span>$30</span>, new balance <span>is</span> <span>$150</span><br><span>Undo</span> <span>Withdraw</span>: deposited <span>$30</span>, balance back to <span>$150</span></span>
```

This shows two successful operations (deposit $50, withdraw $30), then a failed operation (withdraw $150 fails due to insufficient funds). When we undo the last operation, since the last was a failed withdrawal, our `WithdrawCommand.undo()` prints "nothing to undo" (no state changed). Then undoing the previous operation (the successful $30 withdraw) deposits $30 back, returning balance to the previous state. The Command pattern made it straightforward to implement this undo logic by encapsulating each action and its reverse.

This example is intentionally kept simple (no error handling for undo beyond the basic success flag, and a single-level undo stack). In a more elaborate application, you might maintain separate stacks for undo and redo, implement a generic macro command to group operations, or use serialization to store commands to disk for persistence. Still, the core idea is the same: each operation is an object that knows how to do _and_ undo something to a receiver.

## Conclusion

The Command design pattern is a powerful tool in a developer’s toolkit for writing flexible and maintainable code. By encapsulating actions as objects, it achieves a clean separation between the part of the code that requests something to be done and the part that actually does it. This decoupling yields a host of benefits — from easily swapping out actions and supporting undo/redo, to queuing tasks or logging actions for audit. We’ve discussed how the pattern works, looked at a real-world analogy, and walked through a practical Kotlin example demonstrating its use in an everyday scenario.

Like any pattern, Command should be used judiciously. It adds a bit of structure and indirection, which is incredibly useful for complex, extensible systems, though it might be over-engineering for trivial cases. When you find yourself needing flexibility in executing operations — think undoable commands, task scheduling, or polymorphic actions — the Command pattern is an elegant solution to consider. It’s one of those patterns that, once understood, you start noticing everywhere: in UI frameworks, in text editors, in game engines, and more. By mastering it, you’ll be better equipped to design systems that are both **powerful** and **easy to change** as requirements evolve.

If you enjoyed the article, consider clapping, commenting, and following — it really helps support the work and keeps this series going. Have ideas, feedback, or stories about using Command pattern in the wild? I’d love to hear them!
