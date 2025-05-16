---
created: 2025-04-30T12:02:28 (UTC +02:00)
tags: []
source: https://www.progress.com/blogs/understanding-powershell-scriptblocks
author: Adam Bertram
---

# Understanding PowerShell Scriptblocks

---
If you're not already familiar with scriptblocks, after reading this article, you'll begin to see them all over the place in PowerShell in the form of an opening and a closing curly brace.

Scriptblocks are an important and unique construct in PowerShell. Scriptblocks are essentially a portable unit of code that can be passed around and executed at will. 

A PowerShell scriptblock is an expression. An expression is a piece of code PowerShell knows how to execute. For example, PowerShell has the **Invoke-Expression** cmdlet. This cmdlet essentially "converts" a "non-expression" like a string to an expression. The string **write-output 'foo'** won't do anything at all even though it looks like it will but if that's passed to **Invoke-Expression**, PowerShell would run the code as you'd expect.

```
PS&gt; Invoke-Expression -Command "write-output 'foo'"<br> foo
```

Now that I've got your mind around expressions, let's take it back to scriptblocks. Creating a scriptblock is as simple as enclosing some code in curly braces.

```
PS&gt; $myscriptblock = { 1 + 1 }<br> PS&gt; $myscriptblock.GetType().FullName<br> System.Management.Automation.ScriptBlock
```

Once you have that code in a scriptblock, it can be executed a few different ways. Two ways are by using the call operator and the **Invoke-Command** cmdlet as shown below.

```
PS&gt; &amp; $myscriptblock<br> 2<br> PS&gt; Invoke-Command -ScriptBlock $myscriptblock<br> 2<br> PS&gt;
```

Scriptblocks are also similar to functions. In fact, they sometimes referred to as anonymous functions. We can create a param block just like a function and pass the value for each parameter as positional parameters.

Also notice we can pass parameter arguments to the scriptblock by using the **ArgumentList** parameter too.

```
PS&gt; $myscriptblock = { param($Number) 1 + $Number }<br> PS&gt; &amp; $myscriptblock 3<br> 3<br> PS&gt; Invoke-Command -ScriptBlock $myscriptblock -ArgumentList 3<br> 3
```

Now that you know how to create and execute scriptblocks, let's now go into how variables work inside them. As you'll see, they aren't quite as intuitive as you might think.

Variables will naturally expand as you'd expect in scriptblocks.

```
PS&gt; $variable = 'foo'<br> PS&gt; $myscriptblock = { "$variable bar" }<br> PS&gt; &amp; $myscriptblock
```

However, there are circumstances where this will not work as you'd expect in certain scoping conditions around functions. You'll occasionally have the need to expand the variable in a string and then convert that expression to a scriptblock as shown below. Here I'm calling the **Create()** method on the scriptblock class to create a scriptblock from the string **$variable bar**.

```
$myscriptblock = [scriptblock]::Create("$variable bar")
```

Another trick to variables and scriptblocks is variable scoping. For example, if I set a variable's value outside of the scriptblock, create a scriptblock with that variable inside, you'll see that is it by reference. When the variable's value is changed outside of the scriptblock, it is changed inside of the scriptblock as well.

```
PS&gt; $i = 2<br> PS&gt; $scriptblock = { "Value of i is $i" }<br> PS&gt; $i = 3<br> PS&gt; &amp; $scriptblock<br> Value of i is 3
```

[![Enhance your IT career by learning how to automate with Python. Get started  with this free Python guide.](https://www.progress.com/images/default-source/ipsblogposts/bc69b3cd-b007-45a9-95e0-51ff279ea557.jpg?sfvrsn=f3c69635_4)](https://www.progress.com/resources/papers/how-to-automate-using-python)

If you need to ensure the variable's value is set static inside of the scriptblock, you'll need force PowerShell to create a copy of the scriptblock by running the **GetNewClosure()** method on the scriptblock. This forces a new copy which then sets the variable's value inside.

```
PS&gt; $i = 2<br> PS&gt; $scriptblock = { "Value of i is $i" }.GetNewClosure()<br> PS&gt; $i = 3<br> PS&gt; &amp; $scriptblock<br> Value of i is 2
```

That's it for scriptblocks! I hope you've picked up a few pointers on how scriptblocks work and can make your PowerShell scripts a little bit better.
