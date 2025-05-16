---
created: 2025-04-11T13:12:25 (UTC +02:00)
tags: []
source: https://www.powershelldistrict.com/powershell-queue-collection/
author: Stéphane
---

# The powershell queue collection - powershelldistrict

---
-   ![powershell system.collections.queue](https://www.powershelldistrict.com/wp-content/uploads/2018/01/system.collections.queue_.png)

## The powershell queue collection

Today I want to quickly talk about the systems.collections.queue collection when working with powershell queues.

## Why should we care about the system.collections.queue collection when working with powershell queues?

Working with powershell, generally a simple array declared and used like this will generally be enough.

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>$array</span> <span>=</span> <span>@</span><span>(</span><span>)</span></p><p><span>$array</span> <span>+=</span> <span>“Stéphane”</span></p><p><span>$array</span> <span>+=</span> <span>“van Gulick”</span></p></div></td></tr></tbody></table>

We then need to access our array via the index

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>PS</span> <span>C</span><span>:</span><span>WINDOWS</span><span>system32</span><span>&gt;</span> <span>$array</span><span>[</span>1<span>]</span></p><p><span>van </span><span>Gulick</span></p></div></td></tr></tbody></table>

Although this is trivial, and very often enough for our daily business (or in other words, we will always find a way to make it work). there are sometime some other (better?) ways to do things.

The System.Collection.Queue is _just like a regular array_, **but** is has some **additional** convenient methods that allow us to always return the **first element added** to our queue.

> The System.Collection.queue follows the principle of **first in, first out.**

## Methods and properties you don’t want to miss when using the powershell queue (system.collections.queue):

Lets have a look at the members of our collection object:

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>$q</span> <span>=</span> <span>New-Object</span> <span>System</span><span>.</span><span>Collections</span><span>.</span><span>Queue</span></p><p><span>$q</span> <span>|</span> <span>gm</span> <span># throws an error</span></p></div></td></tr></tbody></table>

Pretty surprisingly, when you try to look at the members that are available you will find your self in front of the following error:

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>gm</span> <span>:</span> <span>You </span><span>must </span><span>specify </span><span>an </span><span>object</span> <span>for</span> <span>the </span><span>Get-Member</span> <span>cmdlet</span><span>.</span></p><p><span>At </span><span>line</span><span>:</span>1 <span>char</span><span>:</span>6</p><p><span>+</span> <span>$q</span> <span>|</span> <span>gm</span> <span># throws an error</span></p><p><span>+</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>~</span><span>~</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span>+</span> <span>CategoryInfo</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>:</span> <span>CloseError</span><span>:</span> <span>(</span><span>:</span><span>)</span> <span>[</span><span>Get-Member</span><span>]</span><span>,</span> <span>InvalidOperationException</span></p><p><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span>+</span> <span>FullyQualifiedErrorId</span> <span>:</span> <span>NoObjectInGetMember</span><span>,</span><span>Microsoft</span><span>.</span><span>PowerShell</span><span>.</span><span>Commands</span><span>.</span><span>GetMemberCommand</span></p></div></td></tr></tbody></table>

I’ll explain a bit later what really happened here, but for now, know that although we have had this error message, and when we look into our **$q** variable it seems empty, the instance has been created.  We can see all the members if we use the **\-inputObject** parameter, as in the example below.

<table><tbody><tr><td data-settings="show"><div><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p></div></td><td><div><p><span>PS</span> <span>C</span><span>:</span><span>WINDOWS</span><span>system32</span><span>&gt;</span> <span>get-member</span> <span>-InputObject</span> <span>$q</span></p><p><span>TypeName</span><span>:</span> <span>System</span><span>.</span><span>Collections</span><span>.</span><span>Queue</span></p><p><span>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>MemberType </span><span>Definition</span></p><p><span>—</span><span>—</span><span>—</span><span>—</span><span>—</span><span>—</span><span>—</span> <span>—</span><span>—</span><span>—</span><span>—</span><span>—</span></p><p><span>Clear</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>void </span><span>Clear</span><span>(</span><span>)</span></p><p><span>Clone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>System</span><span>.</span><span>Object</span> <span>Clone</span><span>(</span><span>)</span><span>,</span> <span>System</span><span>.</span><span>Object</span> <span>ICloneable</span><span>.</span><span>Clone</span><span>(</span><span>)</span></p><p><span>Contains&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>bool</span> <span>Contains</span><span>(</span><span>System</span><span>.</span><span>Object</span> <span>obj</span><span>)</span></p><p><span>CopyTo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>void </span><span>CopyTo</span><span>(</span><span>array</span> <span>array</span><span>,</span> <span>int</span> <span>index</span><span>)</span><span>,</span> <span>void </span><span>ICollection</span><span>.</span><span>CopyTo</span><span>(</span><span>array</span> <span>array</span><span>,</span> <span>int</span> <span>index</span><span>)</span></p><p><span>Dequeue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>System</span><span>.</span><span>Object</span> <span>Dequeue</span><span>(</span><span>)</span></p><p><span>Enqueue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>void </span><span>Enqueue</span><span>(</span><span>System</span><span>.</span><span>Object</span> <span>obj</span><span>)</span></p><p><span>Equals&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>bool</span> <span>Equals</span><span>(</span><span>System</span><span>.</span><span>Object</span> <span>obj</span><span>)</span></p><p><span>GetEnumerator&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>System</span><span>.</span><span>Collections</span><span>.</span><span>IEnumerator </span><span>GetEnumerator</span><span>(</span><span>)</span><span>,</span> <span>System</span><span>.</span><span>Collections</span><span>.</span><span>IEnumerator </span><span>IEnumerable</span><span>.</span><span>GetEnumerator</span><span>(</span><span>)</span></p><p><span>GetHashCode&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>int</span> <span>GetHashCode</span><span>(</span><span>)</span></p><p><span>GetType&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>type</span> <span>GetType</span><span>(</span><span>)</span></p><p><span>Peek&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>System</span><span>.</span><span>Object</span> <span>Peek</span><span>(</span><span>)</span></p><p><span>ToArray&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>System</span><span>.</span><span>Object</span><span>[</span><span>]</span> <span>ToArray</span><span>(</span><span>)</span></p><p><span>ToString&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>string</span> <span>ToString</span><span>(</span><span>)</span></p><p><span>TrimToSize&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Method&nbsp;&nbsp;&nbsp;&nbsp; </span><span>void </span><span>TrimToSize</span><span>(</span><span>)</span></p><p><span>Count</span><span>Property</span><span>int</span> <span>Count</span> <span>{</span><span>get</span><span>;</span><span>}</span></p><p><span>IsSynchronized</span> <span>Property</span><span>bool</span> <span>IsSynchronized</span> <span>{</span><span>get</span><span>;</span><span>}</span></p><p><span>SyncRoot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>Property&nbsp;&nbsp; </span><span>System</span><span>.</span><span>Object</span> <span>SyncRoot</span> <span>{</span><span>get</span><span>;</span><span>}</span></p></div></td></tr></tbody></table>

We will focus on the three most interesting ones of the Queue collection:

-   Enqueue
-   Dequeue
-   peek

## The .Enqueue() method of the system.collections.Queue

The enqueue method is the method that will allow us to add new information to our  powershell queue collection.

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>$q</span><span>.</span><span>Enqueue</span><span>(</span><span>“hi”</span><span>)</span></p><p><span>$q</span><span>.</span><span>Enqueue</span><span>(</span><span>“How are”</span><span>)</span></p><p><span>$q</span><span>.</span><span>Enqueue</span><span>(</span><span>“you ?”</span><span>)</span></p><p><span>$q</span></p><p><span>hi</span></p><p><span>How </span><span>are</span></p><p><span>you</span> <span>?</span></p></div></td></tr></tbody></table>

Notice the order in which the strings are appearing.

Pretty straight forward I would say.

## The DeQueue() method from powershell queue collection

The dequeue method is the method that will return the next element of our queue.

> Remember, the **systems.collections.Queue** is a type of collection that respects the **first in, First out** principle

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>PS</span> <span>C</span><span>:</span><span>WINDOWS</span><span>system32</span><span>&gt;</span> <span>$q</span><span>.</span><span>Dequeue</span><span>(</span><span>)</span></p><p><span>hi</span></p></div></td></tr></tbody></table>

In the example above,  “**hi**” is the **first** element to be returned when we called the **DeQueue()** method.

When we look again in our variable, we can see that the value **hi** is not more present anymore, but **“how are”** and “**you**” are still there.

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>PS</span> <span>C</span><span>:</span><span>WINDOWS</span><span>system32</span><span>&gt;</span> <span>$q</span></p><p><span>How </span><span>are</span></p><p><span>you</span> <span>?</span></p></div></td></tr></tbody></table>

## The Peek() method:

The peek method will work exactly as the Dequeue() method, **except,**  that the item that was returned will **not** be removed from the **Queue**. As it’s name suggest, it allows you to **peek** into the queue, and to **see** what would be the next returned element if you would call the **DeQueue()** method.

<table><tbody><tr><td data-settings="show"></td><td><div><p><span>PS</span> <span>C</span><span>:</span><span>WINDOWS</span><span>system32</span><span>&gt;</span> <span>$q</span><span>.</span><span>Peek</span><span>(</span><span>)</span></p><p><span>How </span><span>are</span></p></div></td></tr></tbody></table>

You can see in the example above, the peek method (**in red**) returns the item, but **doesn’t** removes it from the stack collection.

Using the **pop** method, returns the “gulick” item just as the **peek** method informed us it would do, and in this case, removed it from the **stack** item.

## A note about using queues in a multithreaded environment

As pointed out by Johan Akerstrom, queues are very interesting when using runspaces, as it helps to keep track of what has to come next. with Queues in a multithreaded environment (which runspaces are) you need to first create the Queue and then get a Synchronized Thread Safe wrapped Queue by calling the **Synchronized() static method** on the System.Collections.Queue class.

## Links

Official MSDN Documentation –>  [here](https://msdn.microsoft.com/en-us/library/system.collections.queue(v=vs.110).aspx)

 Github issue explaining why $q | Get-Member doesn’t work –> [here](https://github.com/PowerShell/PowerShell/issues/5598)

#### Share This Story, Choose Your Platform!

### About the Author: [Stéphane](https://www.powershelldistrict.com/author/fiver_fo3169e19c985/ "Posts by Stéphane")

![](https://secure.gravatar.com/avatar/54b92730218db0beb10a16b217cf2639?s=72&d=mm&r=g)
