---
created: 2025-05-14T16:26:11 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/prototype-pattern-explained-when-copying-is-smarter-than-creating-d05a85ae393a
author: Maxim Gorin
---

# Prototype Pattern Explained: When Copying is Smarter Than Creating | by Maxim Gorin | Mar, 2025 | Medium

---
[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--d05a85ae393a---------------------------------------)

In our previous article on the [**Singleton pattern**](https://maxim-gorin.medium.com/why-the-singleton-pattern-is-both-useful-and-dangerous-1c32bdf688f0), we tackled how to ensure a class has only one instance. Now, over a cup of coffee, let’s explore another creational design pattern — the **Prototype** pattern.

## What is the Prototype Pattern?

The **Prototype pattern** is a creational design pattern that creates new objects by cloning existing ones, instead of building them from scratch. In other words, you **copy an existing object** (the _prototype_) to make a new object, rather than constructing a fresh object using a constructor. This approach can save time and complexity, especially when object creation is expensive or complicated. The newly cloned object can then be modified as needed without affecting the original.

![](https://miro.medium.com/v2/resize:fit:700/1*bH4PJtSOwb5yt6gQcQ7Mpw.png)

Prototype Design Pattern

**Also known as:** Prototype is often referred to as the _Clone_ pattern. In some contexts (especially C++), it’s even called a “**Virtual Copy Constructor**” because it provides a way to copy objects without knowing their exact class, somewhat like a constructor that copies an existing instance.

## How It Works

At its core, the Prototype pattern requires a **prototype object** that knows how to clone itself. Typically, you define a common interface (or base class) with a method like `clone()` (or `copy()` etc.). Each class that supports cloning implements this method, so it can create a new instance of itself and copy over the data. The client code, instead of using `new` or initializers directly, simply calls `clone()` on a prototype instance.

![](https://miro.medium.com/v2/resize:fit:700/0*fudtrfzs6isgUMox.png)

[UML class diagram describing the prototype design pattern | Prototype pattern — Wikipedia](https://en.wikipedia.org/wiki/Prototype_pattern)

Under the hood, calling `clone()` **delegates the object creation to the object itself**. This means the object will handle the details of making a copy – including copying private fields – which isn't possible from outside. By letting the object clone itself, we **avoid external code being tied to the object's concrete class**. The client only needs to deal with the prototype interface, not the specifics of each class. This decoupling is powerful: you can clone an object even if you only know it through an interface or abstract type, without knowing the exact subclass.

## Real-Life Analogy

To make this more tangible, let’s use a real-life analogy. Think about how we sometimes _duplicate a key_ from an existing key. You don’t ask the lock company to forge a brand new key from design specs; you simply take your current key (prototype) to a machine that cuts a new one exactly like it. In the same way, with Prototype pattern, you take an existing object and copy it to make a new object.

Another analogy: **cloning a customized car blueprint**. Imagine you’re an automotive designer, and you’ve created a perfect prototype of a sports car with all the right features — engine, interior, and so on. Instead of designing a new car from scratch for every customer, you use your prototype as a template and make slight modifications for each new version. The Prototype pattern works the same way, allowing you to replicate an existing object and tweak it as needed, without rebuilding everything from zero.

## Shallow Copy vs Deep Copy

When cloning objects, one subtle but important topic arises: **shallow versus deep copying**. The Prototype pattern doesn’t inherently dictate how copy should be done — it’s up to the implementer. So you need to decide whether a clone is shallow or deep:

-   **Shallow Copy:** The new object copies the values of the original object’s fields _as they are_. For primitive/value types (numbers, booleans, etc.), the actual values are copied. But for reference types (objects, lists, etc.), a shallow copy will copy the _references_ to those objects, not the objects themselves. This means after a shallow clone, the original and the clone might still share some sub-objects. For example, if you clone a **Demon** object that has a reference to a **Pitchfork** object, a shallow copy would have both the original Demon and the cloned Demon pointing to the **same** Pitchfork in memory.
-   **Deep Copy:** The new object copies _everything_, including objects referenced by the original. This means it creates **independent duplicates** of any nested objects or collections. A deep-copied clone of our Demon would get its **own** new Pitchfork, identical to the original’s pitchfork but separate. Deep cloning ensures the prototype and clone do not share any mutable sub-components.

Why does this matter? Imagine our demons: if we shallow-copy a demon, and then the cloned demon tweaks the pitchfork (maybe sharpens it), the original demon’s pitchfork is also sharpened (since it’s the same object)! In contrast, with a deep copy, each demon can sharpen their own pitchfork independently.

Implementing deep copy can be more involved — you need to clone every object it references (and objects those objects reference, and so on). If there are circular references (objects referring to each other), it can get tricky to avoid infinite loops. Thus, it’s important to choose the appropriate copy strategy for your scenario and document it clearly. Many prototype implementations default to shallow copy unless a deep copy is explicitly needed, to avoid the extra overhead.

## When to Use Prototype (vs. Constructing from Scratch)

You might wonder, _why use cloning at all? Why not just use constructors or factories to create new objects?_ Here are some scenarios where the Prototype pattern shines:

-   **Complex or Expensive Object Creation:** If an object is expensive to create from scratch (for example, it involves costly computations, I/O operations, or lots of configuration), cloning an existing, pre-initialized object can be much faster. You do the expensive setup once, then duplicate the result as needed.
-   **Lots of Configuration Options:** When an object has a myriad of configurable properties (dozens of fields with various combinations), you might otherwise end up with tons of subclasses or constructor parameters to cover every permutation. Prototype offers an alternative: create a few baseline prototypes configured in certain common ways, then clone and tweak them as needed. This avoids subclass explosion and long parameter lists. Essentially, **pre-build a few prototypes and reuse them** by cloning.
-   **Unknown Concrete Types at Runtime:** If your code is working with interfaces or abstract base classes and you don’t know the exact concrete class to instantiate, constructors won’t help (you can’t directly do `new SomeSubclass()` if you don't know which subclass). But if you have an object in hand (perhaps provided to you) and you need another one like it, Prototype is ideal. You call the known interface method (clone) and let the object duplicate itself. This way, **you can create new objects without being tied to their concrete class** in your code.
-   **Avoiding Constructor Pollution:** In some cases, a class might have multiple constructors or builder steps to allow different initialization configurations. Using clone can simplify object creation for the client: create a basic object and then clone it instead of calling different constructors. The prototype already embodies a certain state, which can be copied quickly.
-   **Adding Types at Runtime:** In systems that allow plugins or runtime extension, you might allow new object prototypes to be registered at runtime. Code that uses the Prototype pattern can clone these new prototypes without needing to be recompiled. This capability to **add or remove prototype instances at runtime** makes your system more flexible.

Use Prototype when making a new object by copying an existing one makes more sense (or is more efficient) than constructing one from zero. It’s particularly handy when object creation is heavyweight or when you want to preserve the exact state of an object in a new copy.

**Tip:** A good sign you might use Prototype is if you find yourself thinking _“I have this object set up just right; I wish I could duplicate it easily.”_ If constructing one more through normal means feels cumbersome, Prototype might be the way to go.

## Advantages of the Prototype Pattern

Using the Prototype pattern offers several benefits:

-   **Avoids Expensive Initialization:** As noted, cloning can be much faster than building an object from scratch if the original took a lot of work to set up. You skip the construction steps and jump straight to a ready-to-use copy. This can lead to performance improvements in scenarios where many similar objects are needed rapidly.
-   **Reduces Subclassing and Complexity:** Prototype can reduce the need for large class hierarchies just to support different object configurations. Instead of making a subclass for every variant (or a factory for each), you can make a few prototypes and clone them. This keeps the class count down and can simplify your code structure.
-   **Hides Creation Complexity:** The client code doesn’t need to know the details of how objects are created. Complex construction logic (maybe involving many initialization steps) can be done once in the prototype, and the client simply clones it. This can make client code cleaner — you call `clone()` and get a new object, no fuss.
-   **Decouples Code from Concrete Classes:** Because cloning is delegated to the object, your code can work with abstract types or interfaces. You don’t have to have `if/else` or switch logic to determine which class to instantiate; polymorphism takes care of it. As a result, **you can add new concrete types that implement the clone interface without changing existing code** (Open/Closed Principle in action).
-   **Copy & Tweak:** You get a handy ability to produce complex objects that are almost like an existing one, then slightly tweak. For example, if you have a prototype of a configured user interface component, you clone it and then just change the label text on the copy. The bulk of the setup is reused. This is both convenient and less error-prone than assembling a fresh object that’s largely similar to another.
-   **Can work with Dynamic Loading:** In some plugin architectures, you might load an object of an unknown class at runtime and then want more of them. If that object adheres to a prototype interface, you can clone it without ever knowing its real class name.

In summary, Prototype offers **flexibility and efficiency** in object creation. It lets you create new objects **quickly (by copying) and abstractly (without needing class specifics)**.

## Disadvantages and How to Mitigate Them

No pattern is a silver bullet. Here are some downsides to consider with Prototype:

## Clone Method Implementation

Every class that you want to be cloneable needs to implement the cloning logic. This can mean adding a `clone()` or copy initializer in each class, which is extra code to write and maintain. In our monster game example, we avoided writing separate factory classes for each monster, but we did have to implement `clone()` in each monster subclass – about as much code in the end. If you have many classes, that’s a fair bit of boilerplate.

**Mitigation**  
You can factor some of this out by having a base class handle common field copying, or use language features (like a copy constructor or serialization) to reduce manual copying code. Still, some effort is required for each new class to ensure it clones properly.

## Shallow vs Deep Copy Complexity

As discussed, deciding between shallow and deep copy can be tricky. If your objects have only primitive fields, it’s easy. But if they have references to other objects, you must decide: clone them too or not? There’s a potential for **bugs if this isn’t handled carefully**. For instance, if two cloned objects accidentally share a mutable sub-object due to a shallow copy when they should not, modifying one will unexpectedly affect the other.

**Mitigation**  
Clearly document the cloning behavior (perhaps even provide both shallowClone and deepClone methods for clarity). If using shallow copy by default, make sure the shared components are meant to be shared (maybe they are read-only or flyweight objects). For deep copy, implement cloning for the sub-objects as well. Automated or copy-constructor approaches can help, but be cautious with object graphs that have cycles (you might need special handling to avoid infinite recursion).

## Object Composition Challenges

Objects with complex composition (lots of nested objects, or graphs of objects referencing each other) are **harder to clone**. If an object graph has circular references (A references B and B references A), a naive deep clone could loop forever or duplicate too much. You may need to keep track of already-copied objects during cloning to handle this.

**Mitigation  
**This goes beyond basic Prototype usage; you might need a registry of cloned instances to handle graphs, or limit deep cloning to tree-structured object graphs.

## Resource Handling

Some objects manage external resources (file handles, network connections, threads, etc.). Cloning such objects might not make sense or could be dangerous. For example, if an object has an open file, should the clone also open a new file? Or share the handle? Often you _cannot_ meaningfully clone these resources (e.g., you typically don’t duplicate an open socket).

**Mitigation**  
Either design such objects to not be cloneable, or have the clone operation create a placeholder or a closed state for those resources. Document that certain parts won’t be cloned. In practice, developers often exclude open resources from cloning and require new setup for them.

## Memory Overhead

Cloning, especially deep cloning, can incur significant memory overhead if objects are large. If you clone a big object graph repeatedly, you might use a lot of memory quickly.

**Mitigation**  
Only clone when necessary; consider prototypes as single instances to reuse (if many similar objects are needed, sometimes an object pool or flyweight might be more memory-efficient than distinct clones). Also, prefer shallow clone when shared sub-objects are acceptable, to avoid redundant duplication of heavy sub-objects.

## Maintenance

Whenever you add a new field to a cloneable class, you must remember to update the `clone()` method (or copy constructor) to handle that field. Forgetting to do so can lead to bugs where the new field isn't copied into clones.

**Mitigation**  
Good testing can catch this (e.g., test that clone’s new field equals original’s). Code reviews and comments (`// remember to update clone when adding fields`) can help. Some languages allow reflection or serialization to clone objects generically, which reduces manual errors, but those approaches have their own performance and safety trade-offs.

In short, Prototype adds some **complexity in implementation**. To mitigate issues, be deliberate in your clone strategy and thorough in testing your clone methods. Keep the pattern’s use cases in mind — if your objects aren’t that expensive to create or don’t need dynamic copying, a simple constructor might suffice and avoid this overhead.

## Implementing Prototype in Swift

Enough theory — let’s see how we can implement the Prototype pattern in Swift. Swift doesn’t have a built-in `clone()` method for objects, but we can achieve the same effect using protocols or the `NSCopying` interface.

We’ll create an example to illustrate a **shallow vs deep clone** in Swift, using a custom protocol. Suppose we have a `Person` class that contains simple properties like name and age, and also a reference to an `Address` object (which has a city). We want to make `Person` cloneable. We’ll do this by defining a `Copying` protocol that requires an initializer to copy from an existing instance, and an extension to provide a `clone()` method.

## Swift Prototype Example: Person and Address

First, define our classes and the `Copying` protocol:

```
<span id="138f" data-selectable-paragraph=""><span>protocol</span> <span>Copying</span> {<br>    <span>init</span>(<span>_</span> <span>prototype</span>: <span>Self</span>)   <br>}<br><br><span>extension</span> <span>Copying</span> {<br>    <span>func</span> <span>clone</span>() -&gt; <span>Self</span> {<br>        <br>        <span>return</span> <span>type</span>(of: <span>self</span>).<span>init</span>(<span>self</span>)<br>    }<br>}<br><br><br><span>class</span> <span>Address</span>: <span>Copying</span> {<br>    <span>var</span> city: <span>String</span><br><br>    <span>init</span>(<span>city</span>: <span>String</span>) {<br>        <span>self</span>.city <span>=</span> city<br>    }<br>    <br>    <span>required</span> <span>init</span>(<span>_</span> <span>prototype</span>: <span>Address</span>) {<br>        <span>self</span>.city <span>=</span> prototype.city<br>    }<br>}<br><br><span>class</span> <span>Person</span>: <span>Copying</span> {<br>    <span>var</span> name: <span>String</span><br>    <span>var</span> age: <span>Int</span><br>    <span>var</span> address: <span>Address</span><br><br>    <span>init</span>(<span>name</span>: <span>String</span>, <span>age</span>: <span>Int</span>, <span>address</span>: <span>Address</span>) {<br>        <span>self</span>.name <span>=</span> name<br>        <span>self</span>.age <span>=</span> age<br>        <span>self</span>.address <span>=</span> address<br>    }<br>    <br>    <span>required</span> <span>init</span>(<span>_</span> <span>prototype</span>: <span>Person</span>) {<br>        <span>self</span>.name <span>=</span> prototype.name<br>        <span>self</span>.age <span>=</span> prototype.age<br>        <br>        <span>self</span>.address <span>=</span> prototype.address<br>        <br>        <br>    }<br>}</span>
```

In the code above, `Copying` protocol and its extension allow any conforming class to easily implement cloning. Each class provides a `required init(_ prototype: Self)` that copies the properties from the given object. The `clone()` method (thanks to the extension) then uses that initializer to produce a new instance.

We marked the `Address` and `Person` classes as conforming to `Copying` and implemented the required initializer for each. Notice for `Person`, in the clone initializer we chose to do a shallow copy of the `address` (we just assign the same `Address` reference). There's a commented-out hint how we could do a deep copy instead (by calling `prototype.address.clone()`, which in turn would use `Address`'s cloning initializer to make a new Address).

Now, let’s use these classes to see Prototype in action:

```
<span id="b66a" data-selectable-paragraph=""><br><span>let</span> originalAddress <span>=</span> <span>Address</span>(city: <span>"New York"</span>)<br><span>let</span> originalPerson <span>=</span> <span>Person</span>(name: <span>"Alice"</span>, age: <span>30</span>, address: originalAddress)<br><br><br><span>let</span> clonedPerson <span>=</span> originalPerson.clone()<br><br><br><span>print</span>(clonedPerson.name)  <br><span>print</span>(clonedPerson.age)   <br><span>print</span>(clonedPerson.address.city)  <br><br><br>clonedPerson.name <span>=</span> <span>"Bob"</span><br>clonedPerson.address.city <span>=</span> <span>"San Francisco"</span><br><br><br><span>print</span>(originalPerson.name)         <br><span>print</span>(originalPerson.address.city) </span>
```

After cloning, `clonedPerson` starts off with the same name, age, and address as `originalPerson`. We then change the clone’s name to "Bob" and change the clone’s address city to "San Francisco".

We expect the original person’s name to remain “Alice” (it does, since name was a separate copy — a String value type in Swift). However, notice the original person’s city might have changed to “San Francisco” as well! Why? Because we performed a **shallow copy** of the `address`. Both `originalPerson.address` and `clonedPerson.address` refer to the **same Address object**. So when we updated the city via `clonedPerson.address`, it also affected `originalPerson.address` (since it's one object).

If this sharing is not desired, we should implement a **deep copy** for the address. We hinted at that in the code comment: if we use `self.address = prototype.address.clone()` in the `Person`’s clone initializer, then the clone will get its own copy of the Address. In that case, changing `clonedPerson.address.city` would not affect `originalPerson.address.city`.

This example demonstrates the Prototype pattern in Swift and the shallow/deep copy decision. In Swift, you could also use `NSCopying` (which would require implementing `copy(with zone: NSZone?) -> Any`), but using a Swift protocol as above is a clean, type-safe way to achieve cloning.

The pattern can be extended: you might create a **registry** of prototype objects (say, a dictionary of `String` to `Copying` object) for a factory-like lookup. For instance, a `"defaultUser"` prototype maps to a default `Person` object; your code can do `registry["defaultUser"]?.clone()` to get a fresh `Person` configured with default values. This is essentially a Prototype Factory.

## Conclusion

The Prototype design pattern provides an alternative way to create objects when constructing them directly is impractical or inefficient. By cloning existing instances, we can leverage their state and avoid repetitive initialization code. We’ve seen that it’s _also known as the Clone pattern_, and it works by letting objects copy themselves via a common interface. We discussed how shallow and deep copying affect the cloned object’s relationship to the original, and when you might choose one over the other.

We also looked at the trade-offs: Prototype can simplify object creation for the client and reduce the need for many subclasses or factories, but it introduces complexity in implementation (each class needs a clone method, careful handling of object graphs, etc.). There are limitations, such as objects that don’t clone well or the overhead of making deep copies. In practice, you’ll apply Prototype in scenarios where performance and flexibility gains outweigh those costs — like duplicating expensive objects or handling dynamically unknown types.

At the end of the day, the Prototype pattern is about **making new things by copying exemplars**. Just as an artist might start a new painting by tracing an existing sketch, a programmer can spawn new objects by copying a prototypical instance. Use it when it makes your life easier, and you’ll find it a neat pattern to have in your repertoire.

If you enjoyed this article, let me know! **Clap**, **comment**, and **share** it with others — it helps spread knowledge and keeps the content coming. Have thoughts or experiences with the Prototype pattern? Drop them in the comments, I’d love to hear them! And if you’re into software development, from architecture to leadership and beyond, **subscribe** to stay updated on future deep dives. See you in the next one!
