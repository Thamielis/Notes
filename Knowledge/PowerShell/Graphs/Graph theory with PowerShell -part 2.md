---
created: 2025-03-26T14:15:49 (UTC +01:00)
tags: []
source: https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/
author: Dirk
---

# Graph theory with PowerShell -part 2 – Tech thoughts

---
[![](https://powershellone.wordpress.com/wp-content/uploads/2021/03/vecteezy_solo-green-tree-under-white-sky-in-a-field-during-daytime_1259904.jpeg?w=1024)](https://powershellone.wordpress.com/wp-content/uploads/2021/03/vecteezy_solo-green-tree-under-white-sky-in-a-field-during-daytime_1259904.jpeg)

> This is part two ([part one](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/)) of graph theory, focusing on “Small World Graphs”, with PowerShell based on (Chapter 3) of the excellent book [Think Complexity 2e](https://greenteapress.com/wp/think-complexity-2e/) by Allen B. Downey (in fact I’d highly recommend any of the books in the “Think…” series some of which I might cover in future posts). The book and the book’s source (in Python) are available for free through the book’s webpage (the physical book can be purchased too).

## Table of contents[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Table-of-contents)

-   [Some necessary theory](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#theory)
-   [Ring-Lattice graph](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#ring)
-   [Small-World graph Watts/Strogatz](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#smallworld)
    -   [Clustering Coefficient](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#clustering)
    -   [Shortest Path Length](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#shortest)
    -   [Small-World experiment (Watts, Strogatz)](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#wse)

## Some necessary theory[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Some-necessary-theory-)

Small World Graphs are graphs in which most nodes are not neighbours of one another, but the neighbors of any given node are likely to be neighbors of each other and most nodes can be reached from every other node by a small number of hops or steps.

Most people have heard of Small World Graphs in conjunction with the [small-world experiment](https://en.wikipedia.org/wiki/Small-world_experiment) conducted by [Stanley Milgram](https://en.wikipedia.org/wiki/Stanley_Milgram) leading to the infamous phrase “six degrees of separation”.

We will try to replicate the experiment based on [the work of Watts and Strogatz](https://en.wikipedia.org/wiki/Watts%E2%80%93Strogatz_model). The Watts-Strogatz model is a random graph generation model (we talked about random graphs in [part one](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/) of this series) that produces graphs with small-world properties, i.e. short average path lengths and high clustering, which neither regular graphs (see below) nor random graphs exhibit at the same time.

-   **Clustering** is a measure of the degree to which nodes in a graph tend to group together. Evidence suggests that in most real-world networks, and in particular social networks, nodes tend to create tightly knit clusters characterized by a relatively high density of ties; this likelihood tends to be greater than the average probability of a tie randomly established between two nodes.
    
-   **Average path-length** – The average number of edges between two nodes.
    
-   **Regular Graph** – A graph where each node has the same number of neighbours the number of neighbours is also called the degree of the node.
    

The Watts and Strogatz model suggest the following steps to generate a Small World Graph:

-   Start with a regular graph (a ring lattice graph can be used for this purpose) with n nodes and each node connected to k neighbours.
-   Choose a subset of the edges and rewire them by replacing them with random edges.

In a ring lattice graph the nodes are arranged in a circle with each node connected to the specified nearest neighbours.

## Ring-Lattice graph[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Ring-Lattice-graph-)

Enough theory let’s use some code. First, we’ll need some of the helper functions created in the [first part](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/).

```
<span></span><span>Import-Module</span> <span>PSGraph</span>

<span>function</span> <span>Show-PSGraph</span> <span>([</span><span>ValidateSet</span><span>(</span><span>'dot'</span><span>,</span> <span>'circular'</span><span>,</span> <span>'Hierarchical'</span><span>,</span> <span>'Radial'</span><span>,</span> <span>'fdp'</span><span>,</span> <span>'neato'</span><span>,</span> <span>'sfdp'</span><span>,</span> <span>'SpringModelLarge'</span><span>,</span> <span>'SpringModelSmall'</span><span>,</span> <span>'SpringModelMedium'</span><span>,</span> <span>'twopi'</span><span>)]$</span><span>LayoutEngine</span> <span>=</span> <span>'circular'</span><span>)</span> <span>{</span>
    <span>$</span><span>all</span> <span>=</span> <span>@($</span><span>Input</span><span>)</span>
    <span>$</span><span>tempPath</span> <span>=</span> <span>[System.IO.Path]</span><span>::</span><span>GetTempFileName</span><span>()</span>
    <span>$</span><span>all</span> <span>|</span> <span>Out-File</span> <span>$</span><span>tempPath</span>
    <span>$</span><span>new</span> <span>=</span> <span>Get-Content</span> <span>$</span><span>tempPath</span> <span>-raw</span> <span>|</span> <span>ForEach</span><span>-Object</span> <span>{</span> <span>$</span><span>_</span> <span>-replace</span> <span>"</span><span>`r</span><span>"</span><span>,</span> <span>""</span> <span>}</span>
    <span>$</span><span>new</span> <span>|</span> <span>Set-Content</span> <span>-NoNewline</span> <span>$</span><span>tempPath</span>
    <span>Export-PSGraph</span> <span>-Source</span> <span>$</span><span>tempPath</span> <span>-ShowGraph</span> <span>-LayoutEngine</span> <span>$</span><span>LayoutEngine</span>
    <span>Invoke-Item</span> <span>($</span><span>tempPath</span> <span>+</span> <span>'.png'</span><span>)</span>
    <span>Remove-Item</span> <span>$</span><span>tempPath</span>
<span>}</span>

<span>function</span> <span>New-Edge</span> <span>($</span><span>From</span><span>,</span> <span>$</span><span>To</span><span>,</span> <span>$</span><span>Attributes</span><span>,</span> <span>[switch]</span><span>$</span><span>AsObject</span><span>,</span> <span>[switch]</span><span>$</span><span>Undirected</span><span>)</span> <span>{</span>
    <span>$</span><span>null</span> <span>=</span> <span>$</span><span>PSBoundParameters</span><span>.</span><span>Remove</span><span>(</span><span>'AsObject'</span><span>)</span>
    <span>$</span><span>ht</span> <span>=</span> <span>[Hashtable]</span><span>$</span><span>PSBoundParameters</span>
    <span>if</span> <span>($</span><span>AsObject</span><span>)</span> <span>{</span>
        <span>return</span> <span>[PSCustomObject]</span><span>$</span><span>ht</span>
    <span>}</span>
    <span>return</span> <span>$</span><span>ht</span>
<span>}</span>

<span>function</span> <span>Get-Neighbours</span> <span>($</span><span>Edges</span><span>,</span> <span>$</span><span>Name</span><span>,</span> <span>[switch]</span><span>$</span><span>Undirected</span><span>)</span> <span>{</span>
    <span>$</span><span>edgeObjects</span> <span>=</span> <span>@($</span><span>Edges</span><span>)</span>
    <span>if</span> <span>(@($</span><span>Edges</span><span>)[</span><span>0</span><span>].</span><span>GetType</span><span>().</span><span>FullName</span> <span>-ne</span> <span>'System.Management.Automation.PSCustomObject'</span><span>)</span> <span>{</span>
        <span>$</span><span>edgeObjects</span> <span>=</span> <span>foreach</span> <span>($</span><span>edge</span> <span>in</span> <span>$</span><span>Edges</span><span>)</span> <span>{</span>
            <span>[PSCustomObject]</span><span>$</span><span>edge</span>
        <span>}</span>
    <span>}</span>
    <span>(&amp;</span> <span>{</span>
            <span>($</span><span>edgeObjects</span><span>.</span><span>where</span><span>{</span> <span>$</span><span>_</span><span>.</span><span>From</span> <span>-eq</span> <span>$</span><span>Name</span> <span>}).</span><span>To</span>
            <span>if</span> <span>($</span><span>Undirected</span><span>)</span> <span>{</span>
                <span>($</span><span>edgeObjects</span><span>.</span><span>where</span><span>{</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>-eq</span> <span>$</span><span>Name</span> <span>}).</span><span>From</span>
            <span>}</span>
        <span>}).</span><span>where</span><span>{</span> <span>!</span><span>[String]</span><span>::</span><span>IsNullOrEmpty</span><span>($</span><span>_</span><span>)</span> <span>}</span>
<span>}</span>

<span>function</span> <span>Get-LogSpace</span><span>(</span><span>[Double]</span><span>$</span><span>Minimum</span><span>,</span> <span>[Double]</span><span>$</span><span>Maximum</span><span>,</span> <span>$</span><span>Count</span><span>)</span> <span>{</span>
    <span>$</span><span>increment</span> <span>=</span> <span>($</span><span>Maximum</span> <span>-</span> <span>$</span><span>Minimum</span><span>)</span> <span>/</span> <span>($</span><span>Count</span> <span>-</span> <span>1</span><span>)</span>
    <span>for</span> <span>(</span> <span>$</span><span>i</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>i</span> <span>-lt</span> <span>$</span><span>Count</span><span>;</span> <span>$</span><span>i</span><span>++</span> <span>)</span> <span>{</span>
        <span>[Math]</span><span>::</span><span>Pow</span><span>(</span> <span>10</span><span>,</span> <span>($</span><span>Minimum</span> <span>+</span> <span>$</span><span>increment</span> <span>*</span> <span>$</span><span>i</span><span>))</span>
    <span>}</span>
<span>}</span>
```

We create a helper function to generate a Ring-Lattice graph.

```
<span></span><span>function</span> <span>Get-RingLattice</span><span>($</span><span>Nodes</span><span>,</span> <span>$</span><span>NumConnections</span><span>){</span>
    <span>$</span><span>ht</span> <span>=</span> <span>[ordered]</span><span>@{}</span>
    <span>$</span><span>ht</span><span>.</span><span>Nodes</span> <span>=</span> <span>$</span><span>Nodes</span>
    <span>$</span><span>cons</span> <span>=</span> <span>[int]</span><span>($</span><span>NumConnections</span><span>/</span><span>2</span><span>)</span>
    <span>$</span><span>len</span> <span>=</span> <span>$</span><span>Nodes</span><span>.</span><span>Count</span>
    <span>$</span><span>ht</span><span>.</span><span>Edges</span> <span>=</span> <span>foreach</span> <span>($</span><span>node</span> <span>in</span> <span>$</span><span>Nodes</span><span>){</span>
        <span>for</span> <span>($</span><span>i</span><span>=$</span><span>node</span><span>+</span><span>1</span><span>;$</span><span>i</span> <span>-le</span> <span>($</span><span>node</span><span>+$</span><span>cons</span><span>);$</span><span>i</span><span>++){</span>
            <span>New-Edge</span> <span>$</span><span>node</span> <span>$</span><span>Nodes</span><span>[($</span><span>i</span> <span>%</span> <span>$</span><span>len</span><span>)]</span> <span>-AsObject</span>
        <span>}</span>
    <span>}</span>
    <span>$</span><span>ht</span><span>.</span><span>Visual</span> <span>=</span> <span>graph</span> <span>{</span>
        <span>inline</span> <span>'edge [arrowsize=0]'</span>
        <span>edge</span> <span>$</span><span>ht</span><span>.</span><span>Edges</span> <span>-FromScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>}</span> <span>-ToScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>From</span> <span>}</span>
    <span>}</span>
    <span>[PSCustomObject]</span><span>$</span><span>ht</span>
<span>}</span>
```

Let’s create a Ring-Lattice graph with 10 nodes and 4 connections per node.

```
<span></span><span>$</span><span>ringLattice</span> <span>=</span> <span>Get-RingLattice</span> <span>(</span><span>0</span><span>..</span><span>9</span><span>)</span> <span>4</span>
<span>$</span><span>ringLattice</span><span>.</span><span>Visual</span> <span>|</span> <span>Show-PSGraph</span>
```

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/03/img0-2.png)

## Small-World Graphs (Watts-Strogatz)[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Small-World-Graphs-(Watts-Strogatz)-)

To turn our Ring-Lattice graph into a small-world graph we need to “re-wire” the nodes. The algorithm for the re-wiring should follow this logic:

-   Iterate over all edges and rewire them based on a specified probability.
-   If an edge is chosen to be rewired
    -   Leave the .From part of the edge as is.
    -   Rewire the .To part of the edge to any random node, but…
        -   The current .From and To. nodes
        -   Any neighbours of the .From node
    -   Replace the current edge with the old .From and the new .To pair

We can re-use the `Get-Neighbours` function from my previous post.

```
<span></span><span>function</span> <span>Get-SmallWorldGraph</span><span>($</span><span>Nodes</span><span>,</span> <span>$</span><span>NumConnections</span><span>,</span> <span>$</span><span>Probability</span><span>){</span>
    <span>$</span><span>graph</span> <span>=</span> <span>Get-RingLattice</span> <span>$</span><span>Nodes</span> <span>$</span><span>NumConnections</span>
    <span>$</span><span>edges</span> <span>=</span> <span>$</span><span>graph</span><span>.</span><span>Edges</span><span>.</span><span>Clone</span><span>()</span>
    <span>foreach</span> <span>($</span><span>edge</span> <span>in</span> <span>$</span><span>graph</span><span>.</span><span>Edges</span><span>){</span>
        <span>$</span><span>rand</span> <span>=</span> <span>(</span><span>Get-Random</span> <span>-Minimum</span> <span>0</span> <span>-Maximum</span> <span>10000</span><span>)</span> <span>/</span> <span>10000</span>
        <span>if</span> <span>($</span><span>rand</span> <span>-le</span> <span>$</span><span>Probability</span><span>)</span> <span>{</span>
            <span>$</span><span>fromNeighbours</span> <span>=</span> <span>Get-Neighbours</span> <span>$</span><span>graph</span><span>.</span><span>Edges</span> <span>$</span><span>edge</span><span>.</span><span>From</span> <span>-Undirected</span>
            <span>#need to use foreach construct to expand nexted array of fromNeighbours</span>
            <span>$</span><span>exclude</span> <span>=</span> <span>$</span><span>edge</span><span>.</span><span>From</span><span>,$</span><span>edge</span><span>.</span><span>To</span><span>,($</span><span>fromNeighbours</span><span>.</span><span>foreach</span><span>{$</span><span>_</span><span>})</span>
            <span>$</span><span>toConnect</span> <span>=</span> <span>$</span><span>graph</span><span>.</span><span>Nodes</span><span>.</span><span>where</span><span>{$</span><span>_</span> <span>-notin</span> <span>($</span><span>exclude</span><span>.</span><span>foreach</span><span>{$</span><span>_</span><span>})}</span>
            <span>#remove the current edge</span>
            <span>#see https://en.wikipedia.org/wiki/De_Morgan%27s_laws</span>
            <span>$</span><span>graph</span><span>.</span><span>Edges</span> <span>=</span> <span>$</span><span>graph</span><span>.</span><span>Edges</span><span>.</span><span>where</span><span>{$</span><span>_</span><span>.</span><span>From</span> <span>-ne</span> <span>$</span><span>edge</span><span>.</span><span>From</span> <span>-or</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>-ne</span> <span>$</span><span>edge</span><span>.</span><span>To</span><span>}</span>
            <span>#add the new edge += for "adding to an array is bad but good enough in this case</span>
            <span>$</span><span>graph</span><span>.</span><span>Edges</span> <span>+=</span> <span>New-Edge</span> <span>$</span><span>edge</span><span>.</span><span>From</span> <span>(</span><span>Get-Random</span> <span>-InputObject</span> <span>$</span><span>toConnect</span><span>)</span> <span>-AsObject</span>
        <span>}</span>
    <span>}</span>
    <span>#redo the visual part based on the new edges</span>
    <span>$</span><span>graph</span><span>.</span><span>Visual</span> <span>=</span> <span>graph</span> <span>{</span>
        <span>inline</span> <span>'edge [arrowsize=0]'</span>
        <span>edge</span> <span>$</span><span>graph</span><span>.</span><span>Edges</span> <span>-FromScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>}</span> <span>-ToScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>From</span> <span>}</span>
    <span>}</span>
    <span>$</span><span>graph</span>
<span>}</span>
```

Below are three Small World graphs with the following properties:

-   20 nodes
-   4 connections per node
-   Probabilities of 10%, 30%, and 80%

```
<span></span><span>foreach</span> <span>($</span><span>prob</span> <span>in</span> <span>(.</span><span>1</span><span>,.</span><span>2</span><span>,.</span><span>8</span><span>)){</span>
    <span>$</span><span>swGraph</span> <span>=</span> <span>Get-SmallWorldGraph</span> <span>(</span><span>0</span><span>..</span><span>19</span><span>)</span> <span>4</span> <span>$</span><span>prob</span>
    <span>$</span><span>swGraph</span><span>.</span><span>Visual</span> <span>|</span> <span>Show-PSGraph</span>
<span>}</span>
```

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/03/img1.png)

As a next step, we need to develop methods that help us to evaluate the clustering and path-length properties of the produced graphs.

### Clustering Coefficient[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Clustering-Coefficient-)

A cluster can be defined as a set of nodes with edges between all pairs of nodes in the set. The clustering coefficient for a node is given by the proportion of actual links between the nodes within its neighbourhood divided by the number of links that could possibly exist between them. If we iterate over every node of a graph and calculate this proportion and take the average of those, we are getting the `Clustering coefficient` for the graph. The number of unique connections between a set of n nodes can be calculated with the formula ![\frac{n(n-1)}{2} ](https://s0.wp.com/latex.php?latex=%5Cfrac%7Bn%28n-1%29%7D%7B2%7D+&bg=ffffff&fg=000000&s=0&c=20201002) If you imagine a room with n people, where you want to determine the number of unique pairs:

-   The first person can pair up with everyone except themselves n-1..
-   …so can everyone else n\*(n-1).
-   Since n represents the number of people rather than pairs the result needs to be divided by 2 n(n-1)/2.

Below is the implementation of the clustering coefficient algorithm.

```
<span></span><span>function</span> <span>Get-ClusteringCoefficient</span> <span>($</span><span>Graph</span><span>){</span>
    <span>$</span><span>individualCEs</span> <span>=</span> <span>foreach</span> <span>($</span><span>node</span> <span>in</span> <span>$</span><span>Graph</span><span>.</span><span>Nodes</span><span>){</span>
        <span>$</span><span>neighbours</span> <span>=</span> <span>Get-Neighbours</span> <span>$</span><span>Graph</span><span>.</span><span>Edges</span> <span>$</span><span>node</span> <span>-Undirected</span>
        <span>$</span><span>numNeighbours</span> <span>=</span> <span>$</span><span>neighbours</span><span>.</span><span>Count</span>
        <span>#CE undefined skip to next node</span>
        <span>if</span> <span>($</span><span>numNeighbours</span> <span>-lt</span> <span>2</span><span>)</span> <span>{</span> 
            <span>[Single]</span><span>::</span><span>NaN</span> 
            <span>continue</span>
        <span>}</span>
        <span>$</span><span>possibleConnections</span> <span>=</span> <span>$</span><span>numNeighbours</span> <span>*</span> <span>($</span><span>numNeighbours</span> <span>-</span><span>1</span><span>)</span> <span>/</span> <span>2</span>
        <span>$</span><span>nodes</span> <span>=</span> <span>$</span><span>Graph</span><span>.</span><span>Nodes</span>
        <span>$</span><span>actualConnections</span> <span>=</span> <span>for</span> <span>($</span><span>i</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>i</span> <span>-lt</span> <span>$</span><span>numNeighBours</span><span>;</span> <span>$</span><span>i</span><span>++)</span> <span>{</span>
            <span>for</span> <span>($</span><span>j</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>j</span> <span>-lt</span> <span>$</span><span>neighbours</span><span>.</span><span>Count</span><span>;</span> <span>$</span><span>j</span><span>++)</span> <span>{</span>
                <span>if</span> <span>($</span><span>i</span> <span>-lt</span> <span>$</span><span>j</span><span>)</span> <span>{</span>
                    <span>$</span><span>l</span> <span>=</span> <span>$</span><span>neighbours</span><span>[$</span><span>i</span><span>]</span>
                    <span>$</span><span>r </span><span>=</span> <span>$</span><span>neighbours</span><span>[$</span><span>j</span><span>]</span>
                    <span>#the way the edge objects are setup currently we will need to check for both sides</span>
                    <span>#would be better to setup sundirected edges differently</span>
                    <span>$</span><span>Graph</span><span>.</span><span>Edges</span><span>.</span><span>where</span><span>{($</span><span>_</span><span>.</span><span>From</span> <span>-eq</span> <span>$</span><span>l</span> <span>-and</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>-eq</span> <span>$</span><span>r</span><span>)</span> <span>-or</span> <span>($</span><span>_</span><span>.</span><span>From</span> <span>-eq</span> <span>$</span><span>r </span><span>-and</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>-eq</span> <span>$</span><span>l</span><span>)</span> <span>}</span>   
                <span>}</span>
            <span>}</span>
        <span>}</span>
        <span>($</span><span>actualConnections</span><span>.</span><span>Count</span><span>/$</span><span>possibleConnections</span><span>)</span>
    <span>}</span>
    <span>#return the average of the clustering coefficients per node exlcuding NaNs</span>
    <span>($</span><span>individualCEs</span><span>.</span><span>where</span><span>{</span><span>-not</span> <span>(</span><span>[Single]</span><span>::</span><span>IsNaN</span><span>($</span><span>_</span><span>))</span> <span>}</span> <span>|</span> <span>Measure-Object</span> <span>-Average</span><span>).</span><span>Average</span>
<span>}</span>
```

If we test with our Ring-Lattice graph from our, we can get the expected .5 (each nodes has 4 neighbours with 3 connections out of possible 6 connections)

```
<span></span><span>Get-ClusteringCoefficient</span> <span>$</span><span>ringLattice</span>
```

### Shortest Path Length[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Shortest-Path-Length-)

The next step is to calculate the shortest path length, which is the average length of the shortest path between each pair of nodes.

There are several well-known algorithms to do this one of them is the [Dijkstra algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm#Pseudocode). The algorithm is based on breadth-first search which means that the search starts with the immediate neighbours of a node before traversing deeper into the graph by looking at the neighbour’s neighbours and so on. We can use a simplified version of the Dijkstra algorithm since we are dealing with undirected graphs where each edge has an equal weight.

At a high level, the algorithm works like this:

-   We make use of .Net’s built-in [LinkedList collection](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.linkedlist-1?view=net-5.0) to simulate a stack (add at the end) and queue behaviour (remove from the beginning) to traverse through the nodes of the graph in breadth-first manner.
-   A HashTable is used to keep track of each node’s distance to the provided start node.
-   `Get-Neighbours` is used to retrieve the immediate neighbours of the current node (starting with the start node).
-   For those neighbours, that we are not already keeping track of.
    -   Update the neighbour’s distance to 1 + the distance of the current node (since the distance to the neighbour is, by defintion, one more than the current node’s distance)
    -   We add the neighbour to the linked list in order to traverse one level further.
-   At then end an object with source (the start node), destination, and distance properties is returned containing the distance’s for each node in the graph to the specified start node.

```
<span></span><span>function</span> <span>Get-ShortestPath</span> <span>($</span><span>Graph</span><span>,</span> <span>$</span><span>StartNode</span><span>)</span> <span>{</span>
    <span>#distances keeps track of distances from the start node for each node</span>
    <span>$</span><span>distances</span> <span>=</span> <span>@{$</span><span>StartNode</span> <span>=</span> <span>0</span><span>}</span>
    <span>#usage of linked list to be able to add at the end (like in a stack) and remove from the beginning (like in a queue)</span>
    <span>$</span><span>list</span> <span>=</span> <span>New-Object</span> <span>System</span><span>.</span><span>Collections</span><span>.</span><span>Generic</span><span>.</span><span>LinkedList</span><span>[int]</span>
    <span>$</span><span>null</span> <span>=</span> <span>$</span><span>list</span><span>.</span><span>AddFirst</span><span>($</span><span>StartNode</span><span>)</span>
    <span>while</span> <span>($</span><span>list</span><span>.</span><span>Count</span> <span>-gt</span> <span>0</span><span>)</span> <span>{</span>
        <span>#get the first element from the linked list</span>
        <span>$</span><span>node</span> <span>=</span> <span>$</span><span>list</span><span>.</span><span>First</span><span>.</span><span>Value</span>
        <span>$</span><span>null</span> <span>=</span> <span>$</span><span>list</span><span>.</span><span>RemoveFirst</span><span>()</span>
        <span>$</span><span>neighbours</span> <span>=</span> <span>Get-Neighbours</span> <span>$</span><span>Graph</span><span>.</span><span>Edges</span> <span>$</span><span>node</span> <span>-Undirected</span> 
        <span>#find the neighbours that are not already contained in the hashtable</span>
        <span>$</span><span>neighbours</span> <span>=</span> <span>$</span><span>neighbours</span><span>.</span><span>where</span><span>{</span> <span>$</span><span>_</span> <span>-notin</span> <span>$</span><span>distances</span><span>.</span><span>Keys</span> <span>}</span>
        <span>foreach</span> <span>($</span><span>neighbour</span> <span>in</span> <span>$</span><span>neighbours</span><span>){</span>
            <span>#the distance to the neighbour is, by defintion, the current node's distance + 1</span>
            <span>$</span><span>distances</span><span>.$</span><span>neighbour</span> <span>=</span> <span>$</span><span>distances</span><span>.$</span><span>node</span> <span>+</span> <span>1</span>
            <span>#add the neighbour to the list to discover further connections</span>
            <span>$</span><span>null</span> <span>=</span> <span>$</span><span>list</span><span>.</span><span>AddLast</span><span>($</span><span>neighbour</span><span>)</span>
        <span>}</span>
    <span>}</span>
    <span>$</span><span>distances</span><span>.</span><span>GetEnumerator</span><span>().</span><span>foreach</span><span>{</span>
        <span>[PSCustomObject][ordered]</span><span>@{</span>
            <span>Source</span>      <span>=</span> <span>$</span><span>startNode</span>
            <span>Destination</span> <span>=</span> <span>$</span><span>_</span><span>.</span><span>Name</span>
            <span>Distance</span>    <span>=</span> <span>$</span><span>_</span><span>.</span><span>Value</span>
        <span>}</span>
    <span>}</span>
<span>}</span>
```

The function returns an object array with Source, Distance, and Destination properties. If we use it on the first node of a our previously created Ring-Lattice graph (added here again for convenience), we get the following result:

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/03/img2.png)

```
<span></span><span>Get-ShortestPath</span> <span>$</span><span>ringLattice</span> <span>0</span>
```

```
Source Destination Distance
------ ----------- --------
0      9           1
0      8           1
0      7           2
0      6           2
0      5           3
0      4           2
0      3           2
0      2           1
0      1           1
0      0           0

```

To get the average shortest path length for a whole graph we need to … :

-   … do this for every unique starting point (From) in the graph.
-   Remove the 0 distance entries (from node to self).
-   Get the average of the remaining distances.

```
<span></span><span>$</span><span>groupedEdges</span> <span>=</span> <span>$</span><span>ringLattice</span><span>.</span><span>Edges</span> <span>|</span> <span>group </span><span>From</span>
<span>$</span><span>distances</span> <span>=</span> <span>foreach</span> <span>($</span><span>group </span><span>in</span> <span>$</span><span>groupedEdges</span><span>){</span>
    <span>Get-ShortestPath</span> <span>$</span><span>ringLattice</span> <span>$</span><span>group</span><span>.</span><span>Name</span>
<span>}</span>
<span>($</span><span>distances</span><span>.</span><span>where</span><span>{$</span><span>_</span><span>.</span><span>Distance</span> <span>-ne</span> <span>0</span> <span>-and</span> <span>$</span><span>_</span><span>.</span><span>Distance</span><span>}</span> <span>|</span>
    <span>Measure-Object</span> <span>-Property</span> <span>Distance</span> <span>-Average</span><span>).</span><span>Average</span>
```

### Small-World experiment (Watts, Strogatz)[](https://powershellone.wordpress.com/2021/03/23/graph-theory-with-powershell-part-2/#Small-World-experiment-(Watts,-Strogatz)-)

Great, now we have everything in place to do duplicate the Small-world experiment. Showing that there are Small-Word graphs with a certain range of probability (for re-wiring) with high clustering-coefficients (like regular graphs) and a short average path lengths (like in random graphs).

In practice it turned out that, at least with the sloppy version of my code, the PowerShell functions are not executing nearly fast enough to carry out the experiment with 1000 nodes for each graph and 10 connections each. Even though I have added multi-threading to the Shortest-Path parts using [PSThreadJobs’s](https://www.powershellgallery.com/packages/ThreadJob/2.0.3) `Start-ThreadJob` function since this is definitely the bottleneck.

```
<span></span><span>function</span> <span>Do</span><span>-Experiment</span> <span>($</span><span>Nodes</span> <span>=</span> <span>(</span><span>0</span><span>..</span><span>99</span><span>),</span> <span>$</span><span>NumConnections</span><span>=</span><span>3</span><span>,</span> <span>$</span><span>Probabilities</span><span>){</span>
    <span>foreach</span> <span>($</span><span>probability</span> <span>in</span> <span>$</span><span>Probabilities</span><span>){</span>
        <span>$</span><span>apl</span> <span>=</span> <span>[System.Collections.ArrayList]</span><span>@()</span>
        <span>$</span><span>ccoe</span> <span>=</span> <span>[System.Collections.ArrayList]</span><span>@()</span>
        <span>$</span><span>jobs</span> <span>=</span> <span>@()</span>
        <span>$</span><span>graph</span> <span>=</span> <span>Get-SmallWorldGraph</span> <span>$</span><span>Nodes</span> <span>$</span><span>NumConnections</span> <span>$</span><span>probability</span>
        <span>$</span><span>groupedEdges</span> <span>=</span> <span>$</span><span>graph</span><span>.</span><span>Edges</span> <span>|</span> <span>group </span><span>From</span>
        <span>foreach</span> <span>($</span><span>group </span><span>in</span> <span>$</span><span>groupedEdges</span><span>){</span>
            <span>$</span><span>initBlock</span> <span>=</span> <span>[ScriptBlock]</span><span>::</span><span>Create</span><span>(</span>
            <span>'function Get-ShortestPath{'</span> <span>+</span> <span>(</span><span>Get-Command</span> <span>Get-ShortestPath</span><span>).</span><span>Definition</span> <span>+</span> <span>'}'</span> <span>+</span>
            <span>'function Get-Neighbours{'</span> <span>+</span> <span>(</span><span>Get-Command</span> <span>Get-Neighbours</span><span>).</span><span>Definition</span> <span>+</span> <span>'}'</span>
            <span>)</span>
            <span>$</span><span>jobs</span> <span>+=</span> <span>Start-ThreadJob</span> <span>-InitializationScript</span> <span>$</span><span>initBlock</span> <span>{</span>
                <span>$</span><span>group </span><span>=</span> <span>$</span><span>using</span><span>:</span><span>group</span>
                <span>Get-ShortestPath</span> <span>$</span><span>using</span><span>:</span><span>graph</span> <span>$</span><span>group</span><span>.</span><span>Name</span>
            <span>}</span>
        <span>}</span>
        <span>$</span><span>null</span> <span>=</span> <span>$</span><span>jobs</span> <span>|</span> <span>Wait-Job</span>
        <span>$</span><span>distances</span> <span>=</span> <span>$</span><span>jobs</span> <span>|</span> <span>Receive-Job</span>
        <span>$</span><span>null</span> <span>=</span> <span>$</span><span>jobs</span> <span>|</span> <span>Remove-Job</span>
        <span>$</span><span>null</span> <span>=</span> <span>$</span><span>apl</span><span>.</span><span>Add</span><span>(($</span><span>distances</span><span>.</span><span>where</span><span>{$</span><span>_</span><span>.</span><span>Distance</span> <span>-ne</span> <span>0</span><span>}</span> <span>|</span>
            <span>Measure-Object</span> <span>-Property</span> <span>Distance</span> <span>-Average</span><span>).</span><span>Average</span><span>)</span>
        <span>$</span><span>null</span> <span>=</span> <span>$</span><span>ccoe</span><span>.</span><span>Add</span><span>((</span><span>Get-ClusteringCoefficient</span> <span>$</span><span>graph</span><span>))</span>
        
        <span>[PSCustomObject][ordered]</span><span>@{</span>
            <span>Probability</span> <span>=</span> <span>$</span><span>probability</span>
            <span>AveragePathLength</span> <span>=</span> <span>($</span><span>apl</span> <span>|</span> <span>Measure-Object</span> <span>-Average</span><span>).</span><span>Average</span>
            <span>ClusteringCoeeficient</span> <span>=</span> <span>($</span><span>ccoe</span> <span>|</span> <span>Measure-Object</span> <span>-Average</span><span>).</span><span>Average</span>
        <span>}</span>
    <span>}</span>
<span>}</span>

<span>#get log-spaced probabilites to simulate the experiment with the same parameters</span>
<span>$</span><span>probabilities</span> <span>=</span> <span>Get-LogSpace</span> <span>-</span><span>4</span> <span>0</span> <span>9</span>
<span>$</span><span>result</span> <span>=</span> <span>Do</span><span>-Experiment</span> <span>-Probabilities</span> <span>$</span><span>probabilities</span>
<span>#scale the avg. path length and clustering coeff. </span>
<span>#to be able to plot them on the same axis (same as in the experiment)</span>
<span>$</span><span>firstApl</span> <span>=</span> <span>$</span><span>result</span><span>[</span><span>0</span><span>].</span><span>AveragePathLength</span>
<span>$</span><span>firstCoeff</span> <span>=</span> <span>$</span><span>result</span><span>[</span><span>0</span><span>].</span><span>ClusteringCoeeficient</span>
<span>for</span> <span>($</span><span>i</span><span>=</span><span>0</span><span>;$</span><span>i</span> <span>-lt</span> <span>$</span><span>result</span><span>.</span><span>Count</span><span>;$</span><span>i</span><span>++){</span>
    <span>$</span><span>result</span><span>[$</span><span>i</span><span>].</span><span>AveragePathLength</span> <span>=</span> <span>$</span><span>result</span><span>[$</span><span>i</span><span>].</span><span>AveragePathLength</span><span>/$</span><span>firstApl</span>
    <span>$</span><span>result</span><span>[$</span><span>i</span><span>].</span><span>ClusteringCoeeficient</span> <span>=</span> <span>$</span><span>result</span><span>[$</span><span>i</span><span>].</span><span>ClusteringCoeeficient</span><span>/$</span><span>firstCoeff</span>
<span>}</span>
```

While this is unfortunate, the results for 100 nodes with 3 connections (see first graph below) are showing a similar trend as the original study’s results from the Watts/Strogatz paper (L = average path length standardized, C = clustering coefficients standardized).As the probability increases, the average path length decreases quite rapidly because even a small number of randomly rewired edges provide shorter paths between nodes that are far apart. Replacing neighbouring links decreases the clustering coefficient much more slowly. As a result, there is a wide range of probabilities with high clustering coefficients and low average path lengths.

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/03/img3-1.png)

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/03/img3.png)

WordPress conversion from graphTheory2.ipynb by [nb2wp](https://github.com/bennylp/nb2wp) v0.3.1

![shareThoughts](https://powershellone.wordpress.com/wp-content/uploads/2015/10/sharethoughts.jpg)

___

Photo Credit: [Tree Stock photos by Vecteezy](https://www.vecteezy.com/free-photos/tree)

## Post navigation
