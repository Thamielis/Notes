---
created: 2025-03-26T14:14:08 (UTC +01:00)
tags: []
source: https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/
author: Dirk
---

# Graph theory with PowerShell – Tech thoughts

---
[![](https://powershellone.wordpress.com/wp-content/uploads/2021/02/50898643907_ba64d7a5fa_e.jpg?w=499)](https://powershellone.wordpress.com/wp-content/uploads/2021/02/50898643907_ba64d7a5fa_e.jpg)

## Table of contents[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Table-of-contents)

-   ## [Directed graphs](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#directed)
    
-   ## [Undirected graphs](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#undirected)
    
-   ## [Connected graphs](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#connected)
    
    -   ### [Complete graphs](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#complete)
        
    -   ### [Random graphs](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#random)
        
    -   ### [Probability of connectivity](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#connectivity)
        

When I try to learn a new technical topic it is easier for me to do/experience the new topic through a technology I already know about. That’s why I prefer to play around with things in PowerShell even though there might be better ways of doing the same using another technology.

In this post, I’m going to explore a bit of graph theory based on chapter 2 of the excellent book “[Think Complexity 2e](https://greenteapress.com/wp/think-complexity-2e/)” by Allen B. Downey (in fact I’d highly recommend any of the books in the “Think…” series some of which I might cover in future posts). The book and the book’s source (in Python) are available for free through the book’s webpage. [Graph theory](https://en.wikipedia.org/wiki/Graph_theory) is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph is made up of vertices (also called nodes or points) which are connected by edges (also called links or lines). Since networks are everywhere, graph theory is everywhere, too. Graph theory is used to model and study all kinds of things that affect our daily lives: from traffic routes to social networks or integrated circuits.

We will use the excellent [PSGraph](https://github.com/KevinMarquette/PSGraph) module developed by Kevin Marquette for visualizing the graphs. PSGraph is a wrapper around [Graphviz](https://graphviz.org/) which is a commandline utility for displaying graphs. We will need to install both PSGraph and Graphviz.

```
<span></span><span># install Chocolatey</span>
<span>[System.Net.ServicePointManager]</span><span>::</span><span>SecurityProtocol</span> <span>=</span> <span>[System.Net.ServicePointManager]</span><span>::</span><span>SecurityProtocol</span> <span>-bor</span>
<span>[System.Net.SecurityProtocolType]</span><span>::</span><span>Tls12</span>
<span>Invoke-RestMethod</span> <span>-UseBasicParsing</span> <span>-Uri</span> <span>'https://chocolatey.org/install.ps1'</span> <span>|</span> <span>Invoke-Expression</span>
<span># use chocolatey to install graphviz</span>
<span>cinst</span> <span>graphviz</span> <span>-</span>
<span># install PSgraph</span>
<span>Install-Module</span> <span>PSGraph</span>
```

For some reason the command to export and show the Graph (Show-PSGraph) did not work on my machine. Therefore, I’ve written my own version of the command which will overwrite the version that comes with the PSGraph module after importing it.

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
```

To work through the examples we need some way to visualize the graph, which PSGraph will take care of. But we also need a way to represent a graph as an object. Let’s setup some helper functions in order to do that.

```
<span></span><span>function</span> <span>New-Edge</span> <span>($</span><span>From</span><span>,</span> <span>$</span><span>To</span><span>,</span> <span>$</span><span>Attributes</span><span>,</span> <span>[switch]</span><span>$</span><span>AsObject</span><span>)</span> <span>{</span>
    <span>$</span><span>null</span> <span>=</span> <span>$</span><span>PSBoundParameters</span><span>.</span><span>Remove</span><span>(</span><span>'AsObject'</span><span>)</span>
    <span>$</span><span>ht</span> <span>=</span> <span>[Hashtable]</span><span>$</span><span>PSBoundParameters</span>
    <span>if</span> <span>($</span><span>AsObject</span><span>)</span> <span>{</span>
        <span>return</span> <span>[PSCustomObject]</span><span>$</span><span>ht</span>
    <span>}</span>
    <span>return</span> <span>$</span><span>ht</span>
<span>}</span>

<span>function</span> <span>New-Node</span> <span>($</span><span>Name</span><span>,</span> <span>$</span><span>Attributes</span><span>)</span> <span>{</span>
    <span>[Hashtable]</span><span>$</span><span>PSBoundParameters</span>
<span>}</span>

<span>function</span> <span>Get-GraphVisual</span> <span>($</span><span>Name</span><span>,</span> <span>$</span><span>Nodes</span><span>,</span> <span>$</span><span>Edges</span><span>,</span> <span>[switch]</span><span>$</span><span>Undirected</span><span>)</span> <span>{</span>
    <span>$</span><span>sb</span> <span>=</span> <span>{</span>
        <span>if</span> <span>($</span><span>Undirected</span><span>)</span> <span>{</span> <span>inline</span> <span>'edge [arrowsize=0]'</span> <span>}</span>
        <span>foreach</span> <span>($</span><span>node</span> <span>in</span> <span>$</span><span>Nodes</span><span>)</span> <span>{</span>
            <span>node</span> <span>@node</span>
        <span>}</span>
        <span>foreach</span> <span>($</span><span>edge</span> <span>in</span> <span>$</span><span>Edges</span><span>)</span> <span>{</span>
            <span>edge</span> <span>@edge</span>
        <span>}</span>
    <span>}</span>
    <span>graph</span> <span>$</span><span>sb</span>
<span>}</span>
```

The logic of the above functions will get much clearer as we go.

Graphs are usually drawn with squares or circles for nodes (the things in the graph) and lines for edges (the connections between the things). Edges may be directed or undirected, depending on whether the relation- ships they represent are asymmetric or symmetric.

## Directed graphs[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Directed-graphs-)

A directed graph might represent three people who follow each other on Twitter. The arrow indicates the direction of the relationship. Let’s create and draw our first graph using the helper functions. Grapviz/PSGraph takes care of the creation of nodes based on edges. This works fine if all nodes in a graph are connected.

```
<span></span><span>$</span><span>edges</span> <span>=</span> <span>&amp;</span> <span>{</span>
    <span>New-Edge</span> <span>Alice</span> <span>Bob</span>
    <span>New-Edge</span> <span>Alice</span> <span>Chuck</span>
    <span>New-Edge</span> <span>Bob</span> <span>Alice</span>
    <span>New-Edge</span> <span>Bob</span> <span>Chuck</span>
<span>}</span>

<span>Get-GraphVisual</span> <span>Friends</span> <span>-Edges</span> <span>$</span><span>edges</span> <span>|</span> <span>Show-PSGraph</span>
```

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/02/img0-3.png)

## Undirected graphs[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Undirected-graphs-)

As an example of an undirected graph the below graph shows the connection between four cities in the United States. The labels on the edges indicate driving time in hours. In this example, the placement of the nodes corresponds roughly to the geography of the cities, but in general, the layout of a graph is arbitrary. This time we will create node and edge objects since the position of the nodes is an attribute of a node rather than an edge. Edges can also have labels assigned through the label attribute. We also need to switch the LayoutEngine since not every one of them honors the position attribute (see [here](https://observablehq.com/@magjac/placing-graphviz-nodes-in-fixed-positions)).

```
<span></span><span>$</span><span>nodes</span> <span>=</span> <span>&amp;</span> <span>{</span>
    <span>New-Node</span> <span>Albany</span> <span>@{</span> <span>pos</span> <span>=</span> <span>'-74,43!'</span> <span>}</span>
    <span>New-Node</span> <span>Boston</span> <span>@{</span> <span>pos</span> <span>=</span> <span>'-71,42!'</span> <span>}</span>
    <span>New-Node</span> <span>NYC</span> <span>@{</span> <span>pos</span> <span>=</span> <span>'-74,41!'</span> <span>}</span>
    <span>New-Node</span> <span>Philly</span> <span>@{</span> <span>pos</span> <span>=</span> <span>'-75,40!'</span> <span>}</span>
<span>}</span>

<span>$</span><span>edges</span> <span>=</span> <span>&amp;</span> <span>{</span>
    <span>New-Edge</span> <span>Albany</span> <span>Boston</span> <span>@{</span><span>label</span> <span>=</span> <span>3</span> <span>}</span>
    <span>New-Edge</span> <span>Albany</span> <span>NYC</span> <span>@{</span><span>label</span> <span>=</span> <span>4</span> <span>}</span>
    <span>New-Edge</span> <span>Boston</span> <span>NYC</span> <span>@{</span><span>label</span> <span>=</span> <span>4</span> <span>}</span>
    <span>New-Edge</span> <span>NYC</span> <span>Philly</span> <span>@{</span><span>label</span> <span>=</span> <span>2</span> <span>}</span>
<span>}</span>


<span>Get-GraphVisual</span> <span>Cities</span> <span>$</span><span>nodes</span> <span>$</span><span>edges</span> <span>-Undirected</span> <span>|</span> <span>Show-PSGraph</span> <span>-LayoutEngine</span> <span>neato</span>
```

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/02/img1-2.png)

## Connected graphs[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Connected-graphs-)

#### Complete graphs[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Complete-graphs-)

A complete graph is a graph where every node is connected to every other. Let’s create a function that draws a complete graph based on a list of Nodes. With this function, we’ll also start returning a Graph object with Nodes, Edges, and Visual properties.

```
<span></span><span>function</span> <span>Get-CompleteGraph</span><span>($</span><span>Nodes</span><span>)</span> <span>{</span>
    <span>$</span><span>ht</span> <span>=</span> <span>[ordered]</span><span>@{}</span>
    <span>$</span><span>ht</span><span>.</span><span>Nodes</span> <span>=</span> <span>$</span><span>Nodes</span>
    <span>$</span><span>ht</span><span>.</span><span>Edges</span> <span>=</span> <span>for</span> <span>($</span><span>i</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>i</span> <span>-lt</span> <span>$</span><span>Nodes</span><span>.</span><span>Count</span><span>;</span> <span>$</span><span>i</span><span>++)</span> <span>{</span>
        <span>for</span> <span>($</span><span>j</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>j</span> <span>-lt</span> <span>$</span><span>nodes</span><span>.</span><span>Count</span><span>;</span> <span>$</span><span>j</span><span>++)</span> <span>{</span>
            <span>if</span> <span>($</span><span>i</span> <span>-lt</span> <span>$</span><span>j</span><span>)</span> <span>{</span>
                <span>New-Edge</span> <span>$</span><span>Nodes</span><span>[$</span><span>i</span><span>]</span> <span>$</span><span>Nodes</span><span>[$</span><span>j</span><span>]</span> <span>-AsObject</span>
            <span>}</span>
        <span>}</span>
    <span>}</span>
    <span>$</span><span>ht</span><span>.</span><span>Visual</span> <span>=</span> <span>graph</span> <span>{</span>
        <span>inline</span> <span>'edge [arrowsize=0]'</span>
        <span>edge</span> <span>$</span><span>ht</span><span>.</span><span>Edges</span> <span>-FromScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>}</span> <span>-ToScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>From</span> <span>}</span>
    <span>}</span>
    <span>[PSCustomObject]</span><span>$</span><span>ht</span>
<span>}</span>
```

Let’s just draw a complete graph with 10 nodes.

```
<span></span><span>$</span><span>completeGraph</span> <span>=</span> <span>Get-CompleteGraph</span> <span>(</span><span>0</span><span>..</span><span>9</span><span>)</span>
<span>$</span><span>completeGraph</span><span>.</span><span>Visual</span> <span>|</span> <span>Show-PSGraph</span>
```

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/02/img2-3.png)

#### Random graphs[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Random-graphs-)

A random graph is just what it sounds like: a graph with nodes and edges generated at random.

One of the more interesting kinds of random graphs is the Erdös-Renyi model, studied by Paul Erdös and Alfred Renyi in the 1960s. An Erdös-Renyi graph (ER graph) is characterized by two parameters:

1.  The number of nodes
2.  The probability that there is an edge between any two nodes

Erdös and Renyi studied the properties of these random graphs; one of their surprising results is the existence of abrupt changes in the properties of random graphs as random edges are added. One of the properties that displays this kind of transition is connectivity (An undirected graph is connected if there is a path from every node to every other node.)

In an ER graph, the probability (p) that the graph is connected is very low when p is small and nearly 1 when p is large. Let’s create a function that creates ER random graphs where the probability of an edge between each pair of nodes can be controlled via the Probability parameter.

```
<span></span><span>function</span> <span>Get-RandomGraph</span> <span>($</span><span>NodeCount</span><span>,</span> <span>$</span><span>Probability</span><span>,</span> <span>[switch]</span><span>$</span><span>NoVisual</span><span>)</span> <span>{</span>
    <span>$</span><span>ht</span> <span>=</span> <span>[ordered]</span><span>@{}</span>
    <span>$</span><span>ht</span><span>.</span><span>Edges</span> <span>=</span> <span>for</span> <span>($</span><span>i</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>i</span> <span>-le</span> <span>$</span><span>NodeCount</span> <span>-</span> <span>1</span><span>;</span> <span>$</span><span>i</span><span>++)</span> <span>{</span>
        <span>for</span> <span>($</span><span>j</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>j</span> <span>-le</span> <span>$</span><span>NodeCount</span> <span>-</span> <span>1</span><span>;</span> <span>$</span><span>j</span><span>++)</span> <span>{</span>
            <span>if</span> <span>($</span><span>i</span> <span>-lt</span> <span>$</span><span>j</span><span>)</span> <span>{</span>
                <span>$</span><span>rand</span> <span>=</span> <span>(</span><span>Get-Random</span> <span>-Minimum</span> <span>0</span> <span>-Maximum</span> <span>10000</span><span>)</span> <span>/</span> <span>10000</span>
                <span>if</span> <span>($</span><span>rand</span> <span>-lt</span> <span>$</span><span>Probability</span><span>)</span> <span>{</span>
                    <span>New-Edge</span> <span>$</span><span>i</span> <span>$</span><span>j</span> <span>-AsObject</span>
                <span>}</span>
            <span>}</span>
        <span>}</span>
    <span>}</span>
    <span>$</span><span>ht</span><span>.</span><span>Nodes</span> <span>=</span> <span>0</span><span>..($</span><span>NodeCount</span> <span>-</span> <span>1</span><span>)</span>
    <span>if</span> <span>(</span><span>-not</span> <span>$</span><span>NoVisual</span><span>)</span> <span>{</span>
        <span>$</span><span>ht</span><span>.</span><span>Visual</span> <span>=</span> <span>graph</span> <span>-Name</span> <span>Random</span> <span>{</span>
            <span>inline</span> <span>'edge [arrowsize=0]'</span>
            <span>node</span> <span>$</span><span>ht</span><span>.</span><span>Nodes</span>
            <span>edge</span> <span>$</span><span>ht</span><span>.</span><span>Edges</span> <span>-FromScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>From</span> <span>}</span> <span>-ToScript</span> <span>{</span> <span>$</span><span>_</span><span>.</span><span>To</span> <span>}</span>
        <span>}</span>
    <span>}</span>
    <span>[PSCustomObject]</span><span>$</span><span>ht</span>
<span>}</span>
```

Next we use the function to create a random Graph with 10 nodes and a Probability of edges between them of 30%.

```
<span></span><span>$</span><span>randomGraph</span> <span>=</span> <span>Get-RandomGraph</span> <span>10</span> <span>.</span><span>3</span>
<span>$</span><span>randomGraph</span><span>.</span><span>Visual</span> <span>|</span> <span>Show-PSGraph</span>
<span>$</span><span>randomGraph</span><span>.</span><span>Edges</span><span>.</span><span>Count</span>
```

![image.png](https://powershellone.wordpress.com/wp-content/uploads/2021/02/img3.png)

Remember? A graph is connected if there is a path from every node to every other node For many applications involving graphs, it is useful to check whether a graph is connected. An algorithm that does this starts at any node and checks whether you can reach all other nodes. If a node can be reached, it implies, that you can also reach any of its neighbour nodes. Below is a function that returns the neighbours of a given node by its name.

```
<span></span><span>function</span> <span>Get-Neighbours</span> <span>($</span><span>Edges</span><span>,</span> <span>$</span><span>Name</span><span>,</span> <span>[switch]</span><span>$</span><span>Undirected</span><span>)</span> <span>{</span>
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
```

Let’s use it to find the neighbours of some nodes within the random- and completeGraph we created earlier:

```
<span></span><span>Get-Neighbours</span> <span>$</span><span>completeGraph</span><span>.</span><span>Edges</span> <span>0</span>
```

```
<span></span><span>Get-Neighbours</span> <span>$</span><span>randomGraph</span><span>.</span><span>Edges</span> <span>2</span>
```

With the Get-Neighbours function, we can also create a function that iterates through a graph’s nodes connected by edges and return the nodes that can be reached from a given start node. This is implemented through Get-ReachableNodes, where we use a Stack to collect the neighbours and a HashSet to keep track of “visited” nodes.

```
<span></span><span>function</span> <span>Get-ReachableNodes</span> <span>($</span><span>Edges</span><span>,</span> <span>$</span><span>StartNode</span><span>,</span> <span>[switch]</span><span>$</span><span>Undirected</span><span>)</span> <span>{</span>
    <span>$</span><span>seen</span> <span>=</span> <span>New-Object</span> <span>System</span><span>.</span><span>Collections</span><span>.</span><span>Generic</span><span>.</span><span>HashSet</span><span>[string]</span>
    <span>$</span><span>stack</span> <span>=</span> <span>New-Object</span> <span>System</span><span>.</span><span>Collections</span><span>.</span><span>Generic</span><span>.</span><span>Stack</span><span>[string]</span>
    <span>$</span><span>null</span> <span>=</span> <span>$</span><span>stack</span><span>.</span><span>Push</span><span>($</span><span>StartNode</span><span>)</span>
    <span>while</span> <span>($</span><span>stack</span><span>.</span><span>Count</span> <span>-gt</span> <span>0</span><span>)</span> <span>{</span>
        <span>$</span><span>node</span> <span>=</span> <span>$</span><span>stack</span><span>.</span><span>Pop</span><span>()</span>
        <span>if</span> <span>(</span><span>-not</span> <span>$</span><span>seen</span><span>.</span><span>Contains</span><span>($</span><span>node</span><span>))</span> <span>{</span>
            <span>$</span><span>null</span> <span>=</span> <span>$</span><span>seen</span><span>.</span><span>Add</span><span>($</span><span>node</span><span>)</span>
            <span>Get-Neighbours</span> <span>$</span><span>Edges</span> <span>$</span><span>node</span> <span>-Undirected</span><span>:</span><span>$</span><span>Undirected</span> <span>|</span> <span>ForEach</span><span>-Object</span> <span>{</span>
                <span>$</span><span>null</span> <span>=</span> <span>$</span><span>stack</span><span>.</span><span>Push</span><span>(</span> <span>$</span><span>_</span> <span>)</span>
            <span>}</span>
        <span>}</span>
    <span>}</span>
    <span>return</span> <span>$</span><span>seen</span>
<span>}</span>
```

The last piece of the puzzle to check whether a graph is connected, is to use the Get-ReachableNodes function to get the set of nodes that can be reached from a giving starting point. If this number equals the number of nodes in the graph, that means we can reach all nodes, which means the graph is connected.

```
<span></span><span>function</span> <span>Get-IsConnected</span><span>($</span><span>Graph</span><span>,</span> <span>[switch]</span><span>$</span><span>Undirected</span><span>)</span> <span>{</span>
    <span>if</span> <span>($</span><span>Graph</span><span>.</span><span>Edges</span><span>.</span><span>Count</span> <span>-eq</span> <span>0</span><span>)</span> <span>{</span> <span>return</span> <span>$</span><span>false</span> <span>}</span>
    <span>$</span><span>startNode</span> <span>=</span> <span>$</span><span>Graph</span><span>.</span><span>Edges</span><span>[</span><span>0</span><span>].</span><span>From</span>
    <span>$</span><span>reachable</span> <span>=</span> <span>Get-ReachableNodes</span> <span>$</span><span>Graph</span><span>.</span><span>Edges</span> <span>$</span><span>startNode</span> <span>-Undirected</span><span>:</span><span>$</span><span>Undirected</span>
    <span>$</span><span>reachable</span><span>.</span><span>Count</span> <span>-eq</span> <span>$</span><span>Graph</span><span>.</span><span>Nodes</span><span>.</span><span>Count</span>
<span>}</span>
```

Our complete graph is connected and our random graph happened to be not connected:

```
<span></span><span>Get-IsConnected</span> <span>$</span><span>completeGraph</span> <span>-Undirected</span>
```

```
<span></span><span>Get-IsConnected</span> <span>$</span><span>randomGraph</span> <span>-Undirected</span>
```

#### Probability of connectivity[](https://powershellone.wordpress.com/2021/03/03/graph-theory-with-powershell/#Probability-of-connectivity-)

For given values, number of nodes, and probability, we would like to know the probability of the graph being connected. We can estimate this by generating a number of random graphs and counting how many are connected.

```
<span></span><span>function</span> <span>Get-ProbabilityConnected</span><span>($</span><span>NodeCount</span><span>,</span> <span>$</span><span>Probability</span><span>,</span> <span>$</span><span>Iterations</span> <span>=</span> <span>100</span><span>)</span> <span>{</span>
    <span>$</span><span>count</span> <span>=</span> <span>0</span>
    <span>for</span> <span>($</span><span>i</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>i</span> <span>-le</span> <span>$</span><span>Iterations</span><span>;</span> <span>$</span><span>i</span><span>++)</span> <span>{</span>
        <span>$</span><span>randomGraph</span> <span>=</span> <span>Get-RandomGraph</span> <span>$</span><span>NodeCount</span> <span>$</span><span>Probability</span> <span>-Undirected</span> <span>-NoVisual</span>
        <span>if</span> <span>((</span><span>Get-IsConnected</span> <span>$</span><span>randomGraph</span> <span>-Undirected</span> <span>))</span> <span>{</span> <span>$</span><span>count</span><span>++</span> <span>}</span>
    <span>}</span>
    <span>$</span><span>count</span> <span>/</span> <span>$</span><span>Iterations</span>
<span>}</span>
```

```
<span></span><span>$</span><span>nodeCount</span> <span>=</span> <span>10</span>
<span>Get-ProbabilityConnected</span> <span>$</span><span>nodeCount</span> <span>.</span><span>23</span> <span>100</span>
```

23% was chosen because it is close to the critical value where the probability of connectivity goes from near 0 to near 1. According to Erdös and Renyi.

```
<span></span><span>[System.Math]</span><span>::</span><span>Log</span><span>($</span><span>nodeCount</span><span>)</span> <span>/</span> <span>$</span><span>nodeCount</span>
```

We can try to replicate the transition by estimating the probability of connectivity for a range of values of probabilities. We implement Python’s [numpy.Logspace](https://numpy.org/doc/stable/reference/generated/numpy.logspace.html) function to get an evenly spread list of probabilities within a range on a log scale:

```
<span></span><span>function</span> <span>Get-LogSpace</span><span>(</span><span>[Double]</span><span>$</span><span>Minimum</span><span>,</span> <span>[Double]</span><span>$</span><span>Maximum</span><span>,</span> <span>$</span><span>Count</span><span>)</span> <span>{</span>
    <span>$</span><span>increment</span> <span>=</span> <span>($</span><span>Maximum</span> <span>-</span> <span>$</span><span>Minimum</span><span>)</span> <span>/</span> <span>($</span><span>Count</span> <span>-</span> <span>1</span><span>)</span>
    <span>for</span> <span>(</span> <span>$</span><span>i</span> <span>=</span> <span>0</span><span>;</span> <span>$</span><span>i</span> <span>-lt</span> <span>$</span><span>Count</span><span>;</span> <span>$</span><span>i</span><span>++</span> <span>)</span> <span>{</span>
        <span>[Math]</span><span>::</span><span>Pow</span><span>(</span> <span>10</span><span>,</span> <span>($</span><span>Minimum</span> <span>+</span> <span>$</span><span>increment</span> <span>*</span> <span>$</span><span>i</span><span>))</span>
    <span>}</span>
<span>}</span>
<span>#So let's plot the probability of connectivity for a range of values for p</span>
<span>$</span><span>probabilities</span> <span>=</span> <span>Get-LogSpace</span> <span>-</span><span>1</span><span>.</span><span>3</span> <span>0</span> <span>11</span>
<span>$</span><span>probabilities</span>
```

```
0.0501187233627272
0.0676082975391982
0.091201083935591
0.123026877081238
0.165958690743756
0.223872113856834
0.301995172040202
0.407380277804113
0.549540873857625
0.741310241300917
1
```

```
<span></span><span>foreach</span> <span>($</span><span>probability</span> <span>in</span> <span>$</span><span>probabilites</span><span>)</span> <span>{</span>
    <span>[PSCustomObject][ordered]</span><span>@{</span>
        <span>Probability</span>          <span>=</span> <span>$</span><span>probability</span>
        <span>ProbabilityConnected</span> <span>=</span> <span>(</span><span>Get-ProbabilityConnected</span> <span>$</span><span>nodeCount</span> <span>$</span><span>probability</span> <span>100</span><span>)</span>
    <span>}</span>
<span>}</span>
```

```
Probability        ProbabilityConnected
-----------        --------------------
0.0501187233627272 0
0.0676082975391982 0.01
0.091201083935591  0.01
0.123026877081238  0.02
0.165958690743756  0.16
0.223872113856834  0.35
0.301995172040202  0.56
0.407380277804113  0.97
0.549540873857625  1.01
0.741310241300917  1.01
1                  1.01

```

There you have it. I hope you enjoyed this exploration of graph theory as much as I did.

WordPress conversion from GraphTheory.ipynb by [nb2wp](https://github.com/bennylp/nb2wp) v0.3.1

![shareThoughts](https://powershellone.wordpress.com/wp-content/uploads/2015/10/sharethoughts.jpg)

___

Photo Credit: [PapaPiper](https://www.flickr.com/photos/16516058@N03/50898643907/) Flickr via [Compfight](http://compfight.com/) [cc](https://creativecommons.org/licenses/by-nd/2.0/)

## Post navigation
