---
created: 2025-05-14T16:22:55 (UTC +02:00)
tags: []
source: https://maxim-gorin.medium.com/stop-writing-if-else-trees-use-the-state-pattern-instead-1fe9ff39a39c
author: Maxim Gorin
---

# Iterator Pattern: Access Collections Without Knowing Their Structure | by Maxim Gorin | Apr, 2025 | Medium

---
[

![Maxim Gorin](https://miro.medium.com/v2/resize:fill:32:32/1*UVQjiN0-zoWW0jO63B6jew.png)



](https://maxim-gorin.medium.com/?source=post_page---byline--e352ce06b4e1---------------------------------------)

In our previous article, [**Template Method Pattern: Define the Flow, Customize the Steps**](https://maxim-gorin.medium.com/template-method-pattern-define-the-flow-customize-the-steps-027d5c3cfcc6), we explored how to define the flow of an algorithm while allowing subclasses to customize specific steps. Now, continuing our design pattern series, we’ll turn to another classic solution: the **Iterator pattern**. This pattern tackles a different problem — how to traverse a collection of objects without exposing the collection’s internal structure.

Have you ever used a `for-in` loop to walk through an array or a dictionary in Swift? If so, you’ve already benefited from the Iterator pattern in action. The Iterator pattern provides a standard way to move through elements of a collection (or any aggregate object) one by one, without needing to know how those elements are stored under the hood. This keeps your code flexible and focused on _what_ you're iterating, not _how_ it's implemented internally. In this article, we'll take a closer look at the Iterator design pattern, see how it relates to Swift’s `Sequence` and `IteratorProtocol` protocols, and build a practical Swift example step by step. Along the way, we'll discuss the pattern’s alternative names, real-life analogies, pros and cons, and how it compares to similar patterns like Visitor and Composite.

![](https://miro.medium.com/v2/resize:fit:700/1*xVCbtC6XnCvHLr0o_eiQoA.png)

Iterator Design Pattern

## What is the Iterator Pattern?

The **Iterator pattern** is a behavioral design pattern that allows sequential access to the elements of a collection without exposing its underlying representation. In other words, an Iterator provides a way to traverse through a collection and access each element, while keeping the collection’s internals (like whether it’s an array, a tree, a hash table, etc.) hidden from the user of the iterator. This decoupling means your traversal logic doesn’t need to change if the collection’s implementation changes.

In practice, the pattern typically involves two key roles:

-   An **Iterator** (often an interface or protocol) that defines how to traverse (e.g. methods like `next()` and `hasNext()`).
-   An **Aggregate** that knows how to create an iterator. The collection provides a method (like `createIterator()`) that returns an Iterator for its elements.

The client (your code that needs to loop through something) asks the collection for an iterator and then uses the iterator to fetch elements one by one. The client doesn’t need to know anything about how the collection stores those elements — it could be an array, a linked list, a binary tree, or something else entirely. The iterator abstracts that away.

## A Real-Life Analogy

To ground this idea, consider a real-life analogy. Think about how you flip through TV channels using a remote control. You simply press the “Next Channel” button to see the next channel. You **don’t need to know** the channel numbers or how the TV stores the channel list — the remote (iterator) takes care of moving to the next available channel for you. In this analogy:

-   The TV channels are like a collection of items.
-   The remote control’s “next” button is the iterator, giving you one channel at a time.
-   You (the client) just use the iterator (remote) to get channels, without ever touching the TV’s internal channel memory (the collection’s structure remains hidden).

This is exactly what the Iterator pattern does in software: it provides a simple interface (`next`, `hasNext`) to go through elements one by one, abstracting away the complex structure that stores those elements.

## How the Iterator Pattern Works

At its core, the Iterator pattern works by **separating the traversal logic from the collection itself**. The collection is responsible for storing data, while the iterator is responsible for moving through that data. This separation brings a few important capabilities:

-   **Multiple traversal methods:** Since the logic is separate, you can create different iterators for the same collection to traverse in different ways (e.g., forward, backward, sorted order, etc.). The collection can even provide multiple iterator options without complicating its own interface.
-   **Multiple simultaneous iterations:** You can have more than one iterator on the same collection at the same time. For example, you could iterate through a list to find all even numbers with one iterator while another iterator is partway through the same list doing something else. Each iterator keeps its own position/state, so they won’t interfere with each other.
-   **Uniform interface:** If different collections all provide iterators, you can process them in a uniform way. Your code can be written to the iterator interface, and it will work with any collection that has an iterator. This is a form of **polymorphism** — the code doesn’t care if it’s an Array or a Tree, as long as it presents the iterator with the standard `next()`/`hasNext()` methods. For instance, an algorithm like searching for an element could be written to use an iterator, and then it can operate on _any_ iterable collection.
-   **Hiding complexity:** The client code doesn’t need to know if the collection is an array, a linked list, or something else. This encapsulation means you can change the collection’s internal implementation (say, switch from an array to a set) without changing the code that iterates over it. The iterator interface stays the same.

![](https://miro.medium.com/v2/resize:fit:700/0*FdvO30TUSh5Y-kKt.png)

[Iterator UML class diagram — Iterator pattern — Wikipedia](https://en.wikipedia.org/wiki/Iterator_pattern)

In many programming languages, this pattern is so ingrained that it feels invisible. Swift’s `for-in` loop, for example, works on any type that conforms to the `Sequence` protocol. Under the hood, that `Sequence` type provides an iterator (via `makeIterator()`), and the loop simply calls `next()` repeatedly to get each element. The result is clean, high-level code for the client, with the gritty details of traversal tucked away.

## Advantages of Using the Iterator Pattern

Why would we go through the trouble of creating an iterator instead of, say, just using a `for` loop directly on a collection? Here are some advantages of the Iterator pattern:

## Standardized Access

Iterators provide a **uniform way to access elements** of various collections. This means your code can be collection-agnostic — it can work with an array of `Int` or a tree of `Node` objects in the same manner, as long as there's an iterator interface to get the next element. This decouples the how from the what.

## No Exposure of Internals

The pattern ensures you **don’t expose the internal representation** of a collection. The client doesn’t need to know if data is in an array, a linked list, a database, or scattered across multiple structures. This preserves encapsulation and can protect against misuse (no sneaking in and modifying the collection in unintended ways).

## Multiple Ways to Traverse

You can easily add new ways to traverse a collection **without modifying the collection itself**. For example, you might have a default iterator that goes forward, and another that iterates in reverse or skips every other element. This follows the Open/Closed Principle — you extend functionality via new iterator types rather than changing the core collection code.

## Concurrent Iteration

As mentioned, you can have multiple iterators on the same data simultaneously. Each iterator has its own state (usually a current index or pointer), enabling scenarios like comparing two different passes over the data or maintaining a history of traversal positions.

## Simplified Collection Interface

The collection (aggregate) class can keep a lean interface. You don’t need to cram methods like `first()`, `next()`, `isDone()` directly into every collection class for every traversal method you might want. Instead, just one method like `makeIterator()` (or `createIterator()`) is sufficient, and all the traversal logic lives in the iterator. This prevents **bloating the collection's API with traversal details**.

## Disadvantages and Limitations

No design pattern is a silver bullet. While the Iterator pattern is powerful, it comes with some considerations and potential downsides:

## Increased Complexity

Using the Iterator pattern means **adding additional classes or structures** to your codebase (the iterator classes/protocols) and additional layers of indirection. For simple collections or trivial projects, this might feel like over-engineering. The code to set up an iterator can be more verbose than a simple loop. However, this overhead pays off as your project grows or if you need the flexibility — it’s a classic trade-off of design patterns.

## Slight Performance Overhead

Because you’re calling methods on an iterator (e.g., `next()`), there may be a **small performance cost** compared to an optimized low-level loop. There’s also the overhead of allocating an iterator object (or struct) to manage state. In most cases, this overhead is minimal, but it's a consideration in performance-critical situations. In essence, _you gain flexibility at the cost of a tiny bit of efficiency_.

## Single Direction (usually)

Most iterators are designed for one-way traversal (from start to end). If you need bidirectional iteration (both forward and backward) or random access, a single `Iterator` interface might not suffice. Some languages implement bidirectional iterators or provide different iterator types for different needs.

## Redundancy in Modern Languages

In high-level languages with built-in iteration constructs (like Swift, Python, etc.), you often get iterators for free. Writing your own iterator for a built-in collection might feel redundant. However, as we’ll see next, there are still good reasons to implement custom iterators in certain situations — especially when you have a custom data structure or want a non-standard traversal. The key is to use the pattern when it provides clear benefits (like improved clarity or flexibility), and not just for the sake of it.

## When to Use a Custom Iterator

Given that many languages already provide powerful built-in iteration support, when would you actually need to implement the Iterator pattern yourself? Here are some situations where a custom iterator is useful:

-   **Custom Data Structures:** If you create a custom collection type, like your own LinkedList, tree, graph, or any aggregate structure, you’ll want to make it iterable. By conforming your type to Sequence and providing an Iterator, you allow users of your type to loop through it with for … in just like they do with Array or Dictionary. This is a clear use of the Iterator pattern — you define how your structure is traversed (maybe depth-first, breadth-first, etc.) by implementing an iterator. Without a custom iterator, users would have to manually traverse your structure (exposing its internals or requiring knowledge of its links/nodes).
-   **Multiple Traversal Orders:** Even if a collection already has a natural iteration (like Array iterates in order, Dictionary in key-insertion order), you might need a different order. For example, you might want to iterate a Dictionary by sorted keys, or iterate a tree structure in post-order instead of pre-order. A custom iterator (or a custom `Sequence`) can provide this alternative traversal without changing the underlying data or breaking the default iteration. It's essentially writing a new "view" of the data. For instance, you could write a wrapper sequence that takes any `Sequence` and iterates over it in reverse order (we'll do an example soon).
-   **Filtering or Transforming on the Fly:** Suppose you have a collection but you only want to iterate over elements that meet certain criteria (filter) or you want to yield them transformed. While you could accomplish this with higher-order functions or lazy sequences, another approach is a custom iterator that internally skips or modifies elements. For example, an iterator that goes through a list of files and returns only those larger than 1MB. This can encapsulate the filtering logic inside the iterator.
-   **Combining Multiple Collections:** You might have data split across multiple collections, but you want to iterate over all of it in a single unified sequence. For example, imagine a `Library` object that internally has two arrays: `fictionBooks` and `nonFictionBooks`. You could write an iterator for `Library` that first yields all fiction books, then all nonfiction books, so that a caller can do `for book in library` and not worry about how books are divided internally. Without an iterator, the caller would have to individually iterate fiction and nonfiction and handle merging the results.
-   **Controlled Iteration:** Sometimes you want iteration that isn’t just a plain `for` loop. Maybe you want to pause/resume traversal or explicitly control the pace of iteration from outside. Using an iterator object with `next()` calls allows you to **pull elements on demand**. This is useful in scenarios like reading data from a stream or file – you get an iterator that reads the next chunk or line each time you call `next()`, and you can stop whenever you want.
-   **Unified Interfaces and APIs:** If you are designing an API that works with various types of collections, requiring those collections to provide an iterator can simplify the API design. For example, you might design a function that takes an `IteratorProtocol` (or a `Sequence`) as input. This way, the caller can pass in anything from an `Array` to a custom collection, as long as it can produce an iterator. This is leveraging the pattern to enforce a common interface.

In Swift specifically, you typically wouldn’t create a custom iterator for the built-in `Array` or `Dictionary` (because they already have ones), _unless_ you need a different behavior than the default. But for your own types or special iteration patterns, implementing `Sequence`/`IteratorProtocol` is the idiomatic way to go.

## Iterators in Swift (Sequence and IteratorProtocol)

How does Swift support the Iterator pattern? Swift provides it out of the box via two protocols in the standard library:

## IteratorProtocol

This protocol represents the iterator itself. It requires one method, `next()`, which returns the next element in the sequence (or `nil` if there are no more elements). Every time you call `next()`, it should give you the next item and advance the iterator’s state. When `next()` returns `nil`, it signals that the iteration is finished. Swift's `IteratorProtocol` essentially embodies the "Iterator" role in the pattern.

## Sequence

This protocol represents a sequence of values that can be iterated. It has one requirement: a method `makeIterator()` that returns an iterator (conforming to `IteratorProtocol`). The `Sequence` is like the "Aggregate" or collection in the pattern – it knows how to vend an iterator. In fact, Swift’s `Collection` types (Array, Dictionary, Set, etc.) all conform to `Sequence` (actually to the more specific `Collection` protocol which refines `Sequence`). The `Sequence` protocol declares an **associated type** for the Iterator (tying a specific iterator type to the sequence).

So when you write a `for element in mySequence { ... }`, under the hood Swift does something like:

```
<span id="6a9b" data-selectable-paragraph=""><span>var</span> iterator <span>=</span> mySequence.makeIterator()<br><span>while</span> <span>let</span> element <span>=</span> iterator.next() {<br>    <br>}</span>
```

It keeps calling `next()` until it returns `nil`. Notice that Swift’s pattern does not explicitly call a `hasNext()`. The condition is handled by the `while let` (if `next()` returns a non-nil element, it enters the loop; if `next()` returns nil, the loop ends). This is a slight idiomatic difference: instead of separate `hasNext()` and `next()`, Swift combines them by using an Optional return from `next()`. But conceptually, it's the same idea.

To illustrate, consider Swift’s own definitions (simplified):

```
<span id="8d56" data-selectable-paragraph=""><span>protocol</span> <span>IteratorProtocol</span> {<br>    <span>associatedtype</span> <span>Element</span><br>    <span>mutating</span> <span>func</span> <span>next</span>() -&gt; <span>Element</span>?<br>}<br><br><span>protocol</span> <span>Sequence</span> {<br>    <span>associatedtype</span> <span>Element</span><br>    <span>associatedtype</span> <span>Iterator</span>: <span>IteratorProtocol</span> <span>where</span> <span>Iterator</span>.<span>Element</span> <span>==</span> <span>Element</span><br>    <span>func</span> <span>makeIterator</span>() -&gt; <span>Iterator</span><br>}</span>
```

As Apple’s documentation notes, _“The_ `**_IteratorProtocol_**` _protocol is tightly linked with the_ `**_Sequence_**` _protocol. Sequences provide access to their elements by creating an iterator, which keeps track of its iteration process and returns one element at a time as it advances.”_. This is the Iterator pattern in a nutshell, baked into the language.

Swift’s standard collections each have their own iterator types (mostly behind the scenes). For example, `Array<Element>`uses an internal struct that tracks the current index and returns the next element; `Dictionary`'s iterator might go through key-value pairs. You typically don't interact with these iterators directly – you just use `for-in` or functions like `map`, and Swift handles it.

However, you can use the protocols yourself to create custom iterators (as we’ll do next). Also, Swift has some conveniences like `AnyIterator` (type-erased iterator) and sequence types like `UnfoldSequence` for creating sequences from a closure, but those are beyond the scope of our discussion here.

One important thing to note: Swift’s for-in and Sequence adherence is an implementation of the Iterator pattern, making it extremely common in Swift code. In fact, The pattern is very common in Swift code. Many frameworks and libraries use it to provide a standard way for traversing their collections. So when you learn to make something conform to `Sequence`/`IteratorProtocol`, you're effectively implementing the Iterator design pattern.

## Example: Implementing a Classic Iterator in Swift

Let’s build a concrete example to solidify our understanding. Suppose we have an array of numbers, and we want to iterate through it **in reverse order**. Yes, we could simply use Swift’s `.reversed()` collection view or a reverse loop, but pretend we don't have that convenience. We want to design a custom iterator that provides the reversed traversal. This will illustrate the classic Iterator pattern interface (with `hasNext()` and `next()` logic), and we'll also see how it connects to Swift’s `Sequence` and `IteratorProtocol`.

## Reverse Iterator for an Array

We’ll create a `ReverseArrayIterator` that takes an array and allows us to iterate from the last element to the first. Then we'll wrap that in a `ReverseArraySequence` so that we can use it with `for-in` loops as well.

```
<span id="5ead" data-selectable-paragraph=""><br><span>struct</span> <span>ReverseArrayIterator</span>&lt;<span>Element</span>&gt;: <span>IteratorProtocol</span> {<br>    <span>private</span> <span>let</span> items: [<span>Element</span>]<br>    <span>private</span> <span>var</span> currentIndex: <span>Int</span><br><br>    <span>init</span>(<span>array</span>: [<span>Element</span>]) {<br>        <span>self</span>.items <span>=</span> array<br>        <span>self</span>.currentIndex <span>=</span> array.count <span>-</span> <span>1</span>  <br>    }<br><br>    <br>    <span>mutating</span> <span>func</span> <span>next</span>() -&gt; <span>Element</span>? {<br>        <br>        <span>guard</span> currentIndex <span>&gt;=</span> <span>0</span> <span>else</span> {<br>            <span>return</span> <span>nil</span><br>        }<br>        <span>let</span> element <span>=</span> items[currentIndex]<br>        currentIndex <span>-=</span> <span>1</span>  <br>        <span>return</span> element<br>    }<br><br>    <br>    <span>func</span> <span>hasNext</span>() -&gt; <span>Bool</span> {<br>        <span>return</span> currentIndex <span>&gt;=</span> <span>0</span><br>    }<br>}</span>
```

A few things to note in this implementation:

-   We store the array in `items` and keep a `currentIndex` that starts at the last valid index (`array.count - 1`).
-   Each call to `next()` returns the element at `currentIndex` and then decrements the index. When `currentIndex` goes below 0, it means we've gone past the beginning, so we return `nil` to signal the end.
-   We’ve also added a helper `hasNext()` method that returns a Boolean indicating if there are more elements. This method is **not** part of Swift's `IteratorProtocol`; we included it just to illustrate the classic pattern explicitly. (You could use it in a `while` loop condition if you wanted.)

Now, let’s create a `Sequence` that uses this iterator:

```
<span id="4827" data-selectable-paragraph=""><br><span>struct</span> <span>ReverseArraySequence</span>&lt;<span>Element</span>&gt;: <span>Sequence</span> {<br>    <span>private</span> <span>let</span> items: [<span>Element</span>]<br><br>    <span>init</span>(<span>array</span>: [<span>Element</span>]) {<br>        <span>self</span>.items <span>=</span> array<br>    }<br><br>    <br>    <span>func</span> <span>makeIterator</span>() -&gt; <span>ReverseArrayIterator</span>&lt;<span>Element</span>&gt; {<br>        <span>return</span> <span>ReverseArrayIterator</span>(array: items)<br>    }<br>}</span>
```

The `ReverseArraySequence` is a simple wrapper around a regular array. Its `makeIterator()` returns a `ReverseArrayIterator` initialized with that array. Because `ReverseArrayIterator` conforms to `IteratorProtocol`, `ReverseArraySequence` now conforms to `Sequence`. That means we can use it in a `for-in` loop or any function that accepts a `Sequence`.

## Using the Custom Iterator

Let’s see our reverse iterator in action:

```
<span id="637d" data-selectable-paragraph=""><span>let</span> numbers <span>=</span> [<span>10</span>, <span>20</span>, <span>30</span>, <span>40</span>]<br><span>print</span>(<span>"Manual iteration using ReverseArrayIterator:"</span>)<br><span>var</span> manualIterator <span>=</span> <span>ReverseArrayIterator</span>(array: numbers)<br><span>while</span> manualIterator.hasNext() {              <br>    <span>if</span> <span>let</span> num <span>=</span> manualIterator.next() {      <br>        <span>print</span>(num)                            <br>    }<br>}<br><br><span>print</span>(<span>"Iteration using ReverseArraySequence (for-in loop):"</span>)<br><span>for</span> num <span>in</span> <span>ReverseArraySequence</span>(array: numbers) {  <br>    <span>print</span>(num)                                     <br>}</span>
```

When you run this code, you should see the numbers printed from 40 down to 10 in both cases. The first part demonstrates the classic manual use of an iterator: check `hasNext()` and then get `next()`. The second part shows how, by integrating with Swift's `Sequence`, we can use the high-level `for-in` syntax to accomplish the same thing. The `for-in`loop is essentially doing the `hasNext`/`next` calls internally (though in Swift's style, it just checks the optional from `next()`).

This example wrapped a standard Array to provide a different traversal order. It’s a realistic use case: perhaps elsewhere in our code, we frequently need to iterate arrays backwards, so this iterator could be a reusable component. In practice, you might not write a reverse iterator for Array since Swift offers `.reversed()`, but imagine a more complex scenario, like iterating a tree structure – there, you would definitely write custom iterators for different traversal orders (in-order, pre-order, post-order for a binary tree, for example).

## Extending Built-in Collections

While our `ReverseArraySequence` is an external wrapper, you could also integrate this via an extension. For instance, you might extend `Array` with a property or method that gives you a reverse sequence:

```
<span id="ee15" data-selectable-paragraph=""><span>extension</span> <span>Array</span> {<br>    <span>func</span> <span>reversedSequence</span>() -&gt; <span>ReverseArraySequence</span>&lt;<span>Element</span>&gt; {<br>        <span>return</span> <span>ReverseArraySequence</span>(array: <span>self</span>)<br>    }<br>}</span>
```

Then you could do `for x in myArray.reversedSequence() { ... }`. However, keep in mind Swift's standard library already provides `.reversed()` which returns a `ReversedCollection` (that itself is a Sequence) – effectively an iterator implementation internally. Our custom example is for learning purposes, but it mirrors what the standard library does under the hood using the Iterator pattern.

## Wrapping Up

The Iterator design pattern is one of the simpler — yet most ubiquitously useful — patterns in software design. Its power lies in **separation of concerns**: collections focus on storing data, and iterators focus on traversing data. By using the Iterator pattern, we write code that is more **flexible**, more **readable**, and more **maintainable**.

As you continue to design software, you’ll find that thinking in terms of iterators can help you write cleaner and more abstract code. Instead of tying your loops to concrete collections, you can program to the concept of “something that can be iterated,” making your functions and types more reusable. And when the built-in iteration isn’t quite what you need, you now know how to implement your own iterator to traverse collections **without knowing (or exposing) what’s inside**– just as the pattern promises.

If this article helped you look at iteration in a new way, give it a clap, drop a comment, or share it with friends. And don’t forget to follow — more design patterns are coming soon! 🔥
