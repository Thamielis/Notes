---
created: 2025-05-14T16:19:05 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c
author: Maxim Gorin
---

# State Design Pattern in Dart: Behavioral Pattern for Managing Dynamic Object Behavior | Medium

---
## Stop Writing If-Else Trees: Use the State Pattern Instead

[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--1fe9ff39a39c---------------------------------------)

The **State design pattern** is a behavioral software pattern that allows an object to alter its behavior when its internal state changes. In simpler terms, the State pattern lets an object behave differently based on its current state, without cluttering the code with endless `if/else` or `switch` statements.

In our previous article [**Why the Command Pattern Is More Useful Than You Think**](https://maxim-gorin.medium.com/why-the-command-pattern-is-more-useful-than-you-think-774eb7ddb685), we explored how encapsulating actions as objects can make code more flexible. The State pattern takes a similar approach but focuses on encapsulating **states** and their behaviors as objects. Just like the Command pattern, the State pattern helps us eliminate long conditional logic and follow solid design principles — but it addresses a different kind of problem.

![](https://miro.medium.com/v2/resize:fit:700/1*vF0QEUbReZDxGevlHfGimg.png)

State Design Pattern

## A Real-World Analogy: Phone Notification Modes

Imagine you have a smartphone with multiple notification **modes**: **Normal**, **Vibrate**, and **Silent**. In Normal mode, incoming calls ring out loud. In Vibrate mode, the phone doesn’t ring but buzzes. In Silent mode, it neither rings nor vibrates — perhaps it just logs a missed call. You (the phone’s owner) might manually switch between these modes depending on context (at work, in a meeting, at the movies, etc.), and the phone’s behavior changes accordingly without you fiddling with the internals of how ringing works each time.

This scenario is a relatable analogy for the State pattern:

-   The **Phone** is the object whose behavior changes.
-   The current **mode** (Normal/Vibrate/Silent) is the internal **state** of the phone.
-   Each state defines how the phone should behave for certain actions (like receiving a call).
-   Switching modes is like changing the internal state object, which in turn changes the phone’s behavior.

**Why not just use an if-else or enum?** You could code the phone’s behavior with a simple `if` or `switch`:

```
<span id="423c" data-selectable-paragraph="">if (mode == NORMAL) {<br>  ring loud<br>} else if (mode == VIBRATE) {<br>  buzz<br>} else if (mode == SILENT) {<br>  stay quiet<br>}</span>
```

This works fine for a few modes. But imagine if the phone had a dozen modes, each affecting multiple behaviors (calls, messages, alarms, notifications). The number of conditional branches would grow, and the logic for each mode would spread across many `if` statements throughout the code. It would become error-prone to maintain.

The State pattern provides a cleaner approach: treat each mode as a separate **State class** with its own logic. The phone will hold a reference to a state object (e.g., an instance of a `SilentState` or `VibrateState` class) and delegate behavior to it. When you change the mode, you actually swap out the state object for a different one. This way, you **avoid big conditional statements** and instead rely on polymorphism – each state class knows how to handle actions appropriately for that state.

## How the State Pattern Works

The State pattern has a few key pieces working together:

-   **Context**: The main object that has a dynamic internal state. In our analogy, the `Phone` is the context.
-   **State Interface (or Abstract Class)**: Defines the common interface for different state behaviors. It declares methods that correspond to actions the context wants to delegate. For example, a `PhoneState` interface might declare a method like `handleIncomingCall()`.
-   **Concrete State Classes**: These are the objects for states. Each concrete state class represents a specific state and implements the state interface, providing the behavior for the context in that state. E.g., `NormalState`, `VibrateState`, `SilentState` classes each implement how to handle an incoming call differently.
-   **State Transitions**: The context typically has a method to change its current state. This can happen via external triggers (e.g., user changes mode) or internal logic (the state object might decide to transition to a different state).

![](https://miro.medium.com/v2/resize:fit:700/0*8ZMHnWcsxpEcMO8D.png)

[State Design Pattern UML Class Diagram — State pattern — Wikipedia](https://en.wikipedia.org/wiki/State_pattern)

When the context receives a request (like `phone.receiveCall()`), it doesn't handle it directly. Instead, it delegates the work to its current state object (e.g., `currentState.handleIncomingCall()`). Because each state object implements that action differently, the outcome varies depending on the state. In code, this is polymorphism at work: one method call results in different behavior based on the actual state object in use.

## Avoiding Conditional Complexity

A primary motivation for using the State pattern is to eliminate repetitive conditional logic scattered across the code. If an object’s behavior varies by state, you might be tempted to use an enum or flags to track state and then use `switch`/`if`statements inside every method that needs to behave differently. This leads to **bulky, hard-to-maintain code**. The State pattern solves this by localizing state-specific logic into separate classes:

-   Each state’s logic lives in its own class (e.g., all the logic for “Silent mode” is inside `SilentState`).
-   The context code becomes simpler; it no longer needs large conditional blocks for state-specific behavior.
-   Adding a new state or modifying an existing one doesn’t require editing a giant `switch` statement in multiple places – you just create a new state class or update one.

According to the classic definition, _“operations have large, multipart conditional statements that depend on the object’s state… The State pattern puts each branch of the conditional in a separate class, treating the state as an object in its own right”_. This encapsulation makes our code adhere to the Open/Closed Principle: we can introduce new states without changing the context or other states’ code. It also aligns with Single Responsibility Principle, since each state class handles one variant of behavior.

## When (and When Not) to Use State Pattern

**Use the State pattern when:**

-   An object’s behavior depends on its **current state** and it needs to change behavior at runtime depending on that state. If you find yourself writing code like “if state is X do this, if state is Y do that” in multiple places, it’s a sign that state pattern might help.
-   You have **multiple behaviors** associated with an object that could be cleanly separated. For example, the phone’s ringing behavior, vibration behavior, silent logging, etc., are distinct.
-   You want to **avoid duplication** of state-checking logic. Instead of copy-pasting the same switch on state in many methods, state pattern centralizes the behavior in the state classes.
-   You anticipate that new states might be added in the future or the logic per state will get more complex. The pattern makes it easier to extend (just add a new state class) and modify (just change one class’ code).

**When not to use (or caution):**

-   If an object has only a couple of states and very simple differences in behavior, using the State pattern can be overkill. A straightforward conditional might be more readable in such trivial cases.
-   If state changes are rare or the logic is unlikely to grow, the overhead of extra classes might not pay off.
-   If you have a fixed number of states that never change and the logic per state is straightforward, a simple enum and switch might be perfectly fine. The pattern truly shines in **complex scenarios** where states and behaviors multiply or change over time.

Think of it this way: a small state machine with two states isn’t hard to maintain with an `if`. But a state machine with ten states and complex transitions is much easier to manage with the State pattern structure.

## Why State Pattern Over Enums and Flags?

It’s common to start with an `enum` or a set of boolean flags to represent state. For instance, you might have:

```
<span id="75ec" data-selectable-paragraph=""><span>enum</span> Mode { normal, vibrate, silent }</span>
```

And then write logic like:

```
<span id="4774" data-selectable-paragraph=""><span>if</span> (mode == Mode.normal) {<br>  <br>} <span>else</span> <span>if</span> (mode == Mode.vibrate) {<br>  <br>} <span>else</span> <span>if</span> (mode == Mode.silent) {<br>  <br>}</span>
```

This approach works, but as the software grows, it can lead to problems:

-   **Scattered Logic:** If multiple behaviors depend on the mode, you’ll have similar `if/else` or `switch` blocks in many methods (`handleCall()`, `notifyMessage()`, `alarmRing()`, etc.). Any change in a mode’s behavior means finding and updating every conditional.
-   **Violation of Open/Closed Principle:** To add a new mode (say “Do Not Disturb”), you must modify all those `switch` statements. Each modification risks introducing bugs and affects existing code.
-   **Difficult Maintenance:** The more states and conditions, the harder it is to read and maintain that code. It becomes a giant **state machine** interwoven with business logic.

The State pattern addresses these issues by **encapsulating state-specific behaviors**. Instead of one big function with many branches, you have many small classes each handling one branch. This leads to cleaner separation:

-   The **Phone** class (context) no longer needs to know details of each mode’s behavior. It simply delegates to the current state object.
-   Adding **Do Not Disturb** mode, for example, means making a new `DoNotDisturbState` class implementing the desired behaviors. The Phone class might only need a minor change (or even none, if the state can be set via a setter or some factory).
-   Removing or changing a state’s behavior affects only that state class, reducing risk to other parts of the code.

**In short:** In complex scenarios, the State pattern provides a more robust, flexible approach than enums/flags with conditionals. It keeps code modular and adheres to design principles, making it easier for multiple developers (frontend, backend, mobile, etc.) to follow the logic without sifting through tangled conditions.

## Pros and Cons of the State Pattern

Like any design pattern, State has its benefits and trade-offs. Let’s break them down:

**Pros:**

-   **Cleaner Code Organization:** State-specific code is isolated in separate classes. This satisfies Single Responsibility Principle, since each state class focuses on one set of behaviors (one “mode” of the object).
-   **Eliminates Complex Conditionals:** The context code is freed from lengthy `if/else` chains or switch statements for different states. This often means the context class (like our `Phone`) becomes simpler and easier to maintain.
-   **Open/Closed Principle Friendly:** You can add new states without modifying existing ones or the context, which aligns with the Open/Closed Principle. For instance, adding a new phone mode doesn’t require touching the logic for other modes.
-   **State Transition Encapsulation:** The logic for transitioning from one state to another can be controlled in one place. Depending on your design, either the context or the state objects handle transitions, making the flow of states easier to manage and understand.
-   **Polymorphic Behavior:** The pattern leverages polymorphism. You can introduce new behavior by just swapping out the state object at runtime. The rest of the system can remain oblivious to the change, which can reduce bugs — the context just calls a method that happens to do something different now.

**Cons:**

-   **More Classes and Complexity:** Introducing the State pattern means creating multiple classes (one for each state). For simple situations, this can feel like over-engineering. The overhead of understanding the extra indirection might not be worth it if a simple conditional would do.
-   **State Explosion:** If an object can have **many** states, you’ll have lots of classes. Managing transitions between a large number of states can become complex in its own right. (Mitigation: group related states or use hierarchical state patterns, or consider if all those states are truly needed.)
-   **Tight Coupling of States and Context:** State objects often need to know about their context (to change state or query context data) and sometimes about other states (if one state decides to switch to another). This can introduce coupling between state classes. However, this is usually controlled and localized coupling. It’s often an acceptable trade-off for eliminating global complexity, but it’s something to be aware of.
-   **Learning Curve:** For some developers (especially those not familiar with design patterns), the indirection of “an object having an object to do its work” can be confusing at first. It might be less straightforward than a quick `if`check when reading code until you get used to the pattern.
-   **Memory/Performance Overhead:** In some languages, creating objects for states might have a slight performance cost (though in most cases this is negligible). If state objects hold a lot of data duplicated from the context, that could be inefficient. In practice, state objects are often lightweight or even singletons, so this is rarely a big issue.

**Mitigating the Downsides:** If you have concerns about too many classes, you can sometimes implement state objects as inner classes or even anonymous classes (in languages that support it) to keep them grouped with the context. If you worry about object creation overhead, you can reuse state instances (the state pattern doesn’t mandate new object every time; you can keep singletons or stateless instances). Also, good naming and documentation can help the learning curve by making the role of each state class clear.

## Implementing the State Pattern in Dart (Phone Mode Example)

To solidify the concepts, let’s implement our smartphone **notification mode** example in Dart. We will create a simple simulation of a phone receiving calls in different modes. The code will be self-contained and print output to the console (so you can run it in an online Dart playground or similar).

**Design of the example:**

-   We have an abstract `PhoneState` class that defines what happens when the phone receives a call (`onReceiveCall`method).
-   We have concrete state classes: `NormalState`, `VibrateState`, and `SilentState` that extend `PhoneState` and implement `onReceiveCall` differently.
-   The `Phone` class is our context. It has a `state` property of type `PhoneState`. It delegates the `receiveCall()` action to the current state. It also provides a method to change the mode/state (`setState()`).
-   We’ll simulate the phone in different modes receiving calls to see how it behaves.

Here’s the Dart code:

```
<span id="d896" data-selectable-paragraph=""><mark></mark><mark><br></mark><mark><span>abstract</span></mark><mark> </mark><mark><span><span>class</span></span></mark><mark><span> </span></mark><mark><span><span>PhoneState</span></span></mark><mark><span> </span></mark><mark>{<br>  </mark><mark><span>void</span></mark><mark> onReceiveCall(Phone context);<br>}<br><br></mark><mark></mark><mark><br></mark><mark><span><span>class</span></span></mark><mark><span> </span></mark><mark><span><span>NormalState</span></span></mark><mark><span> </span></mark><mark><span><span>implements</span></span></mark><mark><span> </span></mark><mark><span><span>PhoneState</span></span></mark><mark><span> </span></mark><mark>{<br>  </mark><mark><span>@override</span></mark><mark><br>  </mark><mark><span>void</span></mark><mark> onReceiveCall(Phone context) {<br>    </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"Incoming call: Ring ring! 📢 (Normal mode)"</span></mark><mark>);<br>    </mark><mark></mark><mark><br>    </mark><mark></mark><mark><br>  }<br>}<br><br></mark><mark></mark><mark><br></mark><mark><span><span>class</span></span></mark><mark><span> </span></mark><mark><span><span>VibrateState</span></span></mark><mark><span> </span></mark><mark><span><span>implements</span></span></mark><mark><span> </span></mark><mark><span><span>PhoneState</span></span></mark><mark><span> </span></mark><mark>{<br>  </mark><mark><span>int</span></mark><mark> _vibrateCount = </mark><mark><span>0</span></mark><mark>;  </mark><mark></mark><mark><br><br>  </mark><mark><span>@override</span></mark><mark><br>  </mark><mark><span>void</span></mark><mark> onReceiveCall(Phone context) {<br>    _vibrateCount++;<br>    </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"Incoming call: Bzzzt bzzzt... 🤫 (Vibrate mode)"</span></mark><mark>);<br>    </mark><mark></mark><mark><br>    </mark><mark><span>if</span></mark><mark> (_vibrateCount &gt;= </mark><mark><span>3</span></mark><mark>) {<br>      </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"No answer after </span></mark><mark><span><span>$_vibrateCount</span></span></mark><mark><span> vibrations, switching to Silent mode."</span></mark><mark>);<br>      context.setState(SilentState());<br>      </mark><mark></mark><mark><br>      </mark><mark></mark><mark><br>    }<br>  }<br>}<br><br></mark><mark></mark><mark><br></mark><mark><span><span>class</span></span></mark><mark><span> </span></mark><mark><span><span>SilentState</span></span></mark><mark><span> </span></mark><mark><span><span>implements</span></span></mark><mark><span> </span></mark><mark><span><span>PhoneState</span></span></mark><mark><span> </span></mark><mark>{<br>  </mark><mark><span>@override</span></mark><mark><br>  </mark><mark><span>void</span></mark><mark> onReceiveCall(Phone context) {<br>    </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"Incoming call: (Silent mode, no sound) 🤐"</span></mark><mark>);<br>    </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"The phone stays silent. You might see a missed call later."</span></mark><mark>);<br>    </mark><mark></mark><mark><br>  }<br>}<br><br></mark><mark></mark><mark><br></mark><mark><span><span>class</span></span></mark><mark><span> </span></mark><mark><span><span>Phone</span></span></mark><mark><span> </span></mark><mark>{<br>  </mark><mark></mark><mark><br>  PhoneState _state = NormalState();<br><br>  </mark><mark><span>void</span></mark><mark> setState(PhoneState newState) {<br>    _state = newState;<br>    </mark><mark></mark><mark><br>  }<br><br>  </mark><mark><span>void</span></mark><mark> receiveCall() {<br>    </mark><mark></mark><mark><br>    _state.onReceiveCall(</mark><mark><span>this</span></mark><mark>);<br>  }<br><br>  </mark><mark></mark><mark><br>  </mark><mark><span>String</span></mark><mark> </mark><mark><span>get</span></mark><mark> modeName =&gt; _state.runtimeType.toString();<br>}<br><br></mark><mark><span>void</span></mark><mark> main() {<br>  Phone phone = Phone();<br>  </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"Phone is now in </span></mark><mark><span><span>${phone.modeName}</span></span></mark><mark><span>."</span></mark><mark>);<br><br>  </mark><mark></mark><mark><br>  phone.receiveCall();  </mark><mark></mark><mark><br><br>  </mark><mark></mark><mark><br>  phone.setState(VibrateState());<br>  </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"\nPhone is now in </span></mark><mark><span><span>${phone.modeName}</span></span></mark><mark><span>."</span></mark><mark>);<br>  phone.receiveCall();  </mark><mark></mark><mark><br>  phone.receiveCall();  </mark><mark></mark><mark><br>  phone.receiveCall();  </mark><mark></mark><mark><br><br>  </mark><mark></mark><mark><br>  </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"\nPhone is now in </span></mark><mark><span><span>${phone.modeName}</span></span></mark><mark><span>."</span></mark><mark>);<br>  phone.receiveCall();  </mark><mark></mark><mark><br><br>  </mark><mark></mark><mark><br>  phone.setState(NormalState());<br>  </mark><mark><span>print</span></mark><mark>(</mark><mark><span>"\nPhone is now in </span></mark><mark><span><span>${phone.modeName}</span></span></mark><mark><span>."</span></mark><mark>);<br>  phone.receiveCall();  </mark><mark></mark><mark><br>}</mark></span>
```

In the code above, note a few important things:

-   The `Phone` context doesn’t know what happens when a call is received; it just calls `_state.onReceiveCall(this)`. The **current state object handles it**. This is the essence of the State pattern.
-   Each state class focuses on one mode’s behavior. For example, `SilentState` prints a message that the phone is silent and maybe logs a missed call (we just simulated with a print).
-   We included a bit of playful logic in `VibrateState`: if you get 3 calls while in vibrate and don’t answer, it automatically switches the phone to Silent mode (to demonstrate a state **changing the context’s state** from within). This shows how state objects can trigger transitions.
-   Switching states is as simple as calling `phone.setState(SomeState())`. You could imagine this being triggered by a user action or some condition in the program.

**Running this code** would produce output like:

```
<span id="921f" data-selectable-paragraph="">Phone is now in NormalState.<br>Incoming call: Ring ring! 📢 (Normal mode)<br><br>Phone is now in VibrateState.<br>Incoming call: Bzzzt bzzzt... 🤫 (Vibrate mode)<br>Incoming call: Bzzzt bzzzt... 🤫 (Vibrate mode)<br>Incoming call: Bzzzt bzzzt... 🤫 (Vibrate mode)<br>No answer after 3 vibrations, switching to Silent mode.<br><br>Phone is now in SilentState.<br>Incoming call: (Silent mode, no sound) 🤐<br>The phone stays silent. You might see a missed call later.<br><br>Phone is now in NormalState.<br>Incoming call: Ring ring! 📢 (Normal mode)</span>
```

You can see how the behavior changes as the state (mode) changes, and how the Vibrate state even caused a transition to Silent state internally. All of this happens without the `Phone` class itself having to handle the logic for ringing vs vibrating vs silence. The Phone just delegates to whatever state it's in.

## Limitations and Trade-Offs

While the State pattern is powerful, it’s not a silver bullet for all problems:

## Complexity vs. Simplicity

Always gauge the complexity of your problem. Use the State pattern when it **reduces**overall complexity. If it feels like it’s adding unnecessary layers, step back and consider simpler alternatives. As a rule of thumb, if you have more than two or three behaviors that are likely to grow or change, State pattern is worth considering.

## State Transition Management

One tricky aspect can be deciding where the transition logic lives. In our example, we showed a state class triggering a transition (Vibrate to Silent). In other designs, the `Phone` context might decide transitions (e.g., if user toggles a mode, or if some condition met). There’s flexibility here, but it means you should design carefully to avoid confusion. The pattern doesn’t dictate this; you choose based on what makes the code cleaner. If transitions become hard to follow, document them or simplify the rules.

## Number of States

If you foresee a **state explosion**, consider if all states are truly needed or if they can be composed. Sometimes what looks like many states can be broken into sub-states or handled via data rather than full classes. For example, if a phone had 10 different volume levels, you wouldn’t make 10 state classes for that — volume can be a data parameter within, say, a single “Normal” ringing state. Save distinct state classes for qualitatively different behaviors, not just numeric differences.

Despite these considerations, the State pattern is a **tried-and-true tool**. It keeps code flexible and extendable. Many frameworks and libraries internally use the State pattern or similar concepts (for instance, UI components often have states like enabled/disabled/hovered, implemented via state objects or state patterns behind the scenes).

## Conclusion

The State design pattern helps your objects be more flexible and easier to maintain by delegating state-specific behavior to dedicated classes. Our phone example illustrated how a device can change its behavior (ringing, vibrating, silent) by simply switching out an internal state object, rather than juggling lots of conditionals.

If you work on any system with modes, phases, or conditions that alter how it behaves, the State pattern is worth keeping in your toolkit. It might initially feel like extra work to set up, but as your application grows, you’ll appreciate the separation of concerns and scalability it provides.

Did this explanation of the State pattern resonate with you? If you found the analogy and example helpful, give this article a clap (👏) and share it with a friend/colleague who might enjoy it. Feel free to drop a comment with your thoughts, or share how you’ve used (or plan to use) the State pattern in your projects. Let’s continue the conversation and keep learning from each other!
