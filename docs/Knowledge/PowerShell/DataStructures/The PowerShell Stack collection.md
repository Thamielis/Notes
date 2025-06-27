https://www.powershelldistrict.com/powershell-stack-collection/

> In a C# video, I heard about the System.collections.stack collection (PowerShell Stack Collection). I didn't knew what it was, so I looked it up, read about it, and applied it to powershell immediatley.

In this article I will go through what the

# The PowerShell Stack collection

In a C# video, I heard about the System.collections.stack collection (PowerShell Stack Collection). I didn’t knew what it was, so I looked it up, read about it, and applied it to powershell immediatley.

In this article I will go through what the System.collections.stack actually is, and in what cases it should be used. I’ll explain of course how to use in Powershell, and showcase some examples where one might want to use them.  In a nutshell, when used in powershell, the system.collections.stack allows **to handle elements in an array** by **adding**  and **retrieving** them **in a specific order** using specific methods (push / pop & peek).

Luckly enough, anything that works in .Net (should) also work(s) in Powershell. So, let’s try it out 🙂

> The System.Collection.Stack follows the principle of **last in, first out.**

A simple example of the powershell stack collection would be the following one: (Don’t worry to much about the syntax here, I cover the ‘**push**‘ method in detail a bit further down in this article).

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>$mystack</span> <span>=</span> <span>new-object</span> <span>system</span><span>.</span><span>collections</span><span>.</span><span>stack</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“Stephane”</span> <span>)</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“van”</span> <span>)</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“gulick”</span> <span>)</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“district”</span><span>)</span></p></div></td></tr></tbody></table>

  
If we check what the “$mystack” variable contains it will show us the following:  

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>PS</span> <span>C</span><span>:</span><span>Windows</span><span>system32</span><span>&gt;</span> <span>$mystack</span></p><p><span>district</span></p><p><span>gulick</span></p><p><span>van</span></p><p><span>Stephane</span></p></div></td></tr></tbody></table>

You’ll notice that the last object I added (the “district” one) is displayed at first. This is the whole purpose of the powershell stack collection. **The powershell stack collection** allows you **to “stack” items (objects, etc..) one on top of each other**.

>  As opposed with the [queue collection,](https://www.powershelldistrict.com/powershell-queue-collection/) wich returns the most old item in the collection (The one added first), the powershell Stack collection will return the last item you added to the collection (The most recent one). So, in other words **The last item you added, will be the first one to be returned.**

## Use cases for the powershell system.collections.stack collection:

~I haven’t really found a use case for this (yet) in my daily work, but, it worth to know it exists, and it could be usefull if we meet a use case once.~

**Daniel Meier** comment this article on Facebook, explained how he has been using the Stack Collection:

*“I’ve used stacks when changing directories. I’ll put the current directory on the stack then cd to a new directory, put it on the stack, etc. Then I can go back out of each directory to the previous one. I do this when walking a directory tree.”*

Indeed, that is a perfect use case! **Needing to go through** **(****and back)** a specific path (Directory, Registry, List, WebSite). It allows to use the exact same opposite path when moving back.

> If **you** have **used the powershell Stack collection before**, please **share with us** for what use case you have used it (via the comment section below).

In the mean time, below I explain how the powershell stack collection works.

## Methods and properties you don’t want to miss:

Lets have a look at the members of our collection object:

[![](https://www.powershelldistrict.com/wp-content/uploads/2018/01/powershell-collection-stack_get-member.png)](https://www.powershelldistrict.com/wp-content/uploads/2018/01/powershell-collection-stack_get-member.png)

We will focus on the three most interesting ones of the stack array:

-   push
-   pop
-   peek

## the .push() method

As you could have noticed before, in our stack example above, we already used the **push()** method, and **not add()** (which doesn’t exists on the stack object type).

As demonstrated earlier, the push() method allows us to add a new element onto our stack. yes **onto** our stack, not **into** the stack.

## The Pop() method

The pop method will give us the possibility to retrieve the item on the top of our stack. This means, that the pop() method returns the **last** item that has been added.

[![](https://www.powershelldistrict.com/wp-content/uploads/2018/01/powershell-collection-stack-pop.png)](https://www.powershelldistrict.com/wp-content/uploads/2018/01/powershell-collection-stack-pop.png)

As you can see, “**district**” was the last item that we added, but the **first** one to be returned when we called the **pop()** method.

## The Peek() method:

The peek method will work exactly as the pop() method, **except,**  that the item that was returned will **not** be removed from the **stack**. As it’s name suggest, it allows you to **peek** onto the stack, and to **see** what would **eventually**  be returned if you would call the **pop()** method.

[![](https://www.powershelldistrict.com/wp-content/uploads/2018/01/powershell-collection-stack-peek.png)](https://www.powershelldistrict.com/wp-content/uploads/2018/01/powershell-collection-stack-peek.png)

AS you can see in the example above, the peek method (**in red**) returns the item, but **doesn’t** removes it from the powershell stack collection.

Using the **pop** method, returns the “gulick” item just as the **peek** method informed us it would do, and in this case, removed it from the **stack** item.

## A word about the ‘count’ property:

The stack collection instance comes with a ‘**count**‘ property (yes, a property, not a method!). It allows (as you might have guessed) to get the count of the number of items in your current powershell **stack** collection. This is a convenient property to check, to go through your stack collection as showcased in the following example:

<table><tbody><tr><td data-settings="show"><div><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p></div></td><td><div><p><span>$mystack</span> <span>=</span> <span>new-object</span> <span>system</span><span>.</span><span>collections</span><span>.</span><span>stack</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“Stephane”</span> <span>)</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“van”</span> <span>)</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“gulick”</span> <span>)</span></p><p><span>$myStack</span><span>.</span><span>Push</span><span>(</span> <span>“district”</span><span>)</span></p><p><span>while</span><span>(</span><span>$mystack</span><span>.</span><span>count</span> <span>-gt</span> 0<span>)</span><span>{</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span>“Returning Element -&gt; $($mystack.Peek())”</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span>start-sleep</span> <span>-Seconds</span> 3</p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span>$mystack</span><span>.</span><span>Pop</span><span>(</span><span>)</span></p><p><span>}</span></p><p><span>Write-Output</span> <span>“End of example”</span></p></div></td></tr></tbody></table>

The powershell **Stack collection allows us to go through a collection**, and return each item **without** **using** a **loop** such as a **foreach** or a **for** statement.

## Conclusion:

This can be really handy since it allow you to go through collections of objects/ items without the need to iterate through them, or even to know how many items you currently have.  
The second positive thing is that you can now ‘really’ have way of controlling the order in which each element will be treated. Since we know that the **pop()** method of the powershell stack collection returns the most **young** item from the collection (the **last** one added).

> Have you used a **stack** collection already in one of your scripts? I’ll be curious to know how you used. Let us know!

That’s it for today

#Stéphane

## Links

MSDN link to the Collections.Stack –> [msdn](https://msdn.microsoft.com/en-us/library/system.collections.stack(v=vs.110).aspx)

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>write</span><span>-</span><span>host</span><span> </span><span>"See you in the next article :)"</span></p></div></td></tr></tbody></table>
