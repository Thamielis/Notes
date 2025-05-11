---
created: 2025-04-03T09:22:19 (UTC +02:00)
tags: []
source: https://auguria.io/insights/why-your-next-siem-will-analyze-vectors-part-2/
author: Oliver Rochford
---

# Why Your Next SIEM Will Analyze Vectors – Part 2

---
![](https://auguria.io/hubfs/why-your-next-siem-will-analyze-vectors-part-2.jpg)

#### Vector database technology is poised to supersede and enhance traditional SIEM systems by overcoming the cost and performance limitations associated with relational data technologies. Due to vector databases’ superior handling of native data formats friendly to a slew of AI and machine learning applications, they open the path to more intelligent, automated and cost effective security operations.

This is the second in a series of articles written to help security analysts, security engineers, and SIEM architects better understand the benefits of vector databases for security operations. 

In part I, we took a brief look at what a vector is, and how vector databases differ from traditional databases. We discuss why multidimensional or multi-vector analysis is crucial for detecting modern cyber threats.

In part II, we step through a detailed example of how vector embeddings can be used to identify suspicious and anomalous behavior by example of PowerShell commands.

In the [first article in this series](https://auguria.io/insights/why-your-next-siem-will-analyze-vectors/), we spoke about the difference between a traditional database and a vector database, and we also touched upon why it’s important to be able to analyze multiple attributes of our data, or vectors, simultaneously. In this second article, we actually break down a simplified real-world example of how a PowerShell command can be transformed into vectors and used to detect anomalies.

A note to data scientists. This blog is not an exhaustive treatise on vector technology. Instead it is aimed at educating on the basic concepts of vectors using a specific security example as its backbone. Our intent is to make the topic more approachable by security professionals by relating it to how it compares to the technologies they are familiar with.

### **Concept 1: Tokenization**

Tokenization involves breaking down text into smaller, more manageable chunks called tokens. It’s a central step for preparing textual data for use in a vector database. Each token might represent a word, phrase, or even a symbol. Proper tokenization ensures that all elements of a command are correctly identified and represented as a vector. For general purpose use-cases like generating text it can be sufficient to divide sentences into individual words and characters. However, in security we ideally want to only analyze a command’s **_meaningful components_**, or better referred to as our “semantic” understanding.

Cybersecurity professionals must understand that _meaningful_ tokenization is fundamental, because it accurately breaks down the script into meaningful units (tokens), allowing for effective analysis and pattern recognition. This step ensures that each command, parameter, and operator is correctly identified and analyzed, which is essential for detecting malicious activities, anomalies, or non-compliant operations within the scripts. Proper tokenization helps in building more accurate models for threat detection and enhances the overall security monitoring capabilities.“Meaningful” means tokenization of the select portions of events and logs that are relevant for analysis and not necessarily everything in said events and logs.

### **Concept 2: Defining the Right Ontology**

The word semantic means “as relates to _human_ language or logic.” Semantic understanding in the context of PowerShell would mean that our AI models are aware, for example, that there is a specific set of PowerShell commands to manage active directory users:

-   New-ADUser
-   Get-ADUser
-   Set-ADUser

Once semantics are formalized, we call this an ontology which is something like a dictionary. Let’s expand. If you’re familiar with the MITRE ATT&CK™ framework, or the common vulnerability scoring system (CVSS), you’ve already used an ontology. An ontology for PowerShell scripts–our main example in this blog–includes entities like ‘username’, ‘command’, and  ‘parameters’, along with their relationships (e.g., ‘executes’,’modifies’). In the context of machine learning and vectors, the ontology is how different data points are **organized semantically** by meaning. This ensures that related concepts are within proximity of each other in the vector space (more on that in a bit), reflecting their **real-world interconnections.** It’s how we make it possible for machine learning models to understand and process complex information.

#### **What’s an Ontology?**

An ontology is a structured framework that categorizes and defines the relationships among multiple concepts within a specific domain. Imagine a vocabulary or a set of rules that provides a common understanding of a specific subject area.

Ontologies are used to enable _human and increasingly digital_ sharing and reuse of knowledge and to facilitate communication and reasoning among people or computer systems. For example, in a cyber security ontology, the nodes might represent users, workstations or mobile devices, while the edges represent the relationships between them, such as “DNS request” “” or “diagnoses.” 

One of the main benefits of ontologies is that they provide a standardized way of representing and sharing knowledge, which can improve communication and collaboration across different organizations and systems. By using a common language and set of rules, ontologies can help avoid misunderstandings and improve the accuracy and consistency of information.

Auguria has developed its own unique ontology, a core component of our Security Knowledge Layer™. Future blogs will delve further into ontology.

Guided by a well-designed ontology, the vector computation process, aka the **embedding** process, occurs automatically without any additional rules or data wrangling. The importance of defining a reliable ontology ensures the data can describe reality well, otherwise we will struggle to get meaningful insights from the data.

In order to avoid garbage-in-garbage-out, a reliable ontology is designed by humans and is semantically sound in the sense that it describes interesting data accurately.

### **![Defining-the-Right-Ontology-Graphic](https://auguria.io/hs-fs/hubfs/Defining-the-Right-Ontology-Graphic.webp?width=951&height=515&name=Defining-the-Right-Ontology-Graphic.webp)**

### **Concept 3: Creating the embeddings**

Let’s assume we are processing a series of PowerShell Event Logs as seen in this table:

<table><tbody><tr><td><strong>#</strong></td><td><strong>Symbol</strong></td><td><strong>Date</strong></td><td><strong>Execution Time</strong></td><td><strong>Command</strong></td><td><strong>Parameter Username</strong></td></tr><tr><td><span>a</span></td><td>&nbsp;🔵</td><td><span>7/13/2022</span></td><td><span>12:37:06 AM</span></td><td><span>Get-ADUser</span></td><td><span>G.Apple</span></td></tr><tr><td><span>b</span></td><td>&nbsp;🔵</td><td><span>7/13/2022</span></td><td><span>14:12:01 AM</span></td><td><span>Get-ADUser</span></td><td><span>N.Ormal</span></td></tr><tr><td><span>c</span></td><td>&nbsp;🔵</td><td><span>7/13/2022</span></td><td><span>09:40:19 AM</span></td><td><span>Get-ADUser</span></td><td><span>B.Enign</span></td></tr><tr><td><span>d</span></td><td>&nbsp;🔴</td><td><span>7/13/2022</span></td><td><span>22:43:11 AM</span></td><td><span>New-ADUser</span></td><td><span>B.Apple</span></td></tr><tr><td><span>e</span></td><td>&nbsp;🟢</td><td><span>7/13/2022</span></td><td><span>22:43:37 AM</span></td><td><span>Get-ADUser</span></td><td><span>B.Apple</span></td></tr><tr><td><span>f</span></td><td>&nbsp;🔵</td><td><span>7/13/2022</span></td><td><span>07:43:30 AM</span></td><td><span>Get-ADUser</span></td><td><span>A.Lgood</span></td></tr><tr><td><span>g</span></td><td>&nbsp;🔵</td><td><span>7/13/2022</span></td><td><span>15:27:23 AM</span></td><td><span>Get-ADUser</span></td><td><span>B.Safe</span></td></tr><tr><td><span>h</span></td><td>&nbsp;🔵</td><td><span>7/13/2022</span></td><td><span>12:00:35 AM</span></td><td><span>Get-ADUser</span></td><td><span>N.Ofret</span></td></tr></tbody></table>

To create the vectors, only the most important terms or words are converted into a numerical representation to derive the command’s strongest semantic meaning. First you might, for example, issue each PowerShell active directory commands a numerical representation.

<table><tbody><tr><td><span>Get-ADUser</span></td><td><span>1</span></td></tr><tr><td><span>Set-ADUser</span></td><td><span>2</span></td></tr><tr><td><span>New-ADUser</span></td><td><span>3</span></td></tr></tbody></table>

Second, you could use the execution time as a basis for our next vector, with values from 1-24.

Third, and this is a highly simplified abstraction, we use the First letter of the user name as our third vector with values corresponding to 1 – 26, and we could convert all of the following letters into their numerical representation for even finer granularity as well.

<table><tbody><tr><td><strong>#</strong></td><td><strong>Symbol</strong></td><td><strong>Execution Time</strong></td><td><strong>Execution Time Vector</strong></td><td><strong>Command</strong></td><td><strong>Command Vector</strong></td><td><strong>Username</strong></td><td><strong>Username Vector</strong></td></tr><tr><td><span>a</span></td><td>&nbsp;🔵</td><td><span>12:37:06 AM</span></td><td><span>12</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>G.Apple</span></td><td><strong>8.1</strong><span> [,16,16,12,5]</span></td></tr><tr><td><span>b</span></td><td>&nbsp;🔵</td><td><span>14:12:01 AM</span></td><td><span>14</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>N.Ormal</span></td><td><strong>14.15..</strong></td></tr><tr><td><span>c</span></td><td>&nbsp;🔵</td><td><span>09:40:19 AM&nbsp;</span></td><td><span>9</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>B.Enign</span></td><td><span>2.5..</span></td></tr><tr><td><span>d</span></td><td>&nbsp;🔴</td><td><span>22:43:11 AM</span></td><td><span>22</span></td><td><span>New-ADUser</span></td><td><span>3</span></td><td><span>B.Apple</span></td><td><span>2.1..</span></td></tr><tr><td><span>e</span></td><td>&nbsp;🟢</td><td><span>22:43:37 AM</span></td><td><span>22</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>B.Apple</span></td><td><span>2.1..</span></td></tr><tr><td><span>f</span></td><td><span>&nbsp;🔵</span></td><td><span>07:43:30 AM&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></td><td><span>7</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>A.Lgood</span></td><td><span>1.8..</span></td></tr><tr><td><span>g</span></td><td><span>&nbsp;🔵</span></td><td><span>15:27:23 AM</span></td><td><span>15</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>B.Safe</span></td><td><span>2.19..</span></td></tr><tr><td><span>h</span></td><td><span>&nbsp;🔵</span></td><td><span>12:00:35 AM</span></td><td><span>12</span></td><td><span>Get-ADUser</span></td><td><span>1</span></td><td><span>N.Ofret</span></td><td><span>14.16..</span></td></tr></tbody></table>

### **Concept 4: Analyzing Vectors in Flatland**

We can begin analysis by comparing two vectors in a 2 dimensional space. If we correlate the Command Vectors with the Execution Time vectors, we can easily identify clusters and outliers, or measure the distance between data points to identify their closest neighbors. This last aspect is why vector databases uniquely enable similarity, or fuzzy searching. It treats data points as existing in spatial dimensions, and can measure these much like the distance between two landmarks. Datapoint ‘d’ for example is clearly an outlier, lying further to right and the top than any other data point. Note that ‘d’ and ‘e’ are not clustered together even though they are two different commands applied to the same username at almost the same time. Other strong relationships can also be indicated by proximity.

![Analyzing-Vectors-in-Flatland-Graphic-768x472](https://auguria.io/hs-fs/hubfs/Analyzing-Vectors-in-Flatland-Graphic-768x472.png?width=952&height=585&name=Analyzing-Vectors-in-Flatland-Graphic-768x472.png)

### **Concept 5: Multidimensional vector analysis**

Now look at the example below, and you can see that we’ve now also added ‘UserName’ for a total of 3 dimensions. We can now correlate Powershell commands that were executed to add, modify or view an active directory user based on the time of day and the username in question. Interestingly, datapoints ‘d’ and ‘e’ are now the nearest neighbors and form a denser cluster based once we add ‘username’ as a dimension. Other data points have spread out in distance from one another and now seem less close, forming fewer clusters.

What is this diagram telling me? We are seeing somebody adding a new user account outside of usual business hours, and then checking that they succeeded. Suspicious Yes. Malicious? Maybe.

![Multidimensional-vector-analysis-Graphs-768x663](https://auguria.io/hs-fs/hubfs/Multidimensional-vector-analysis-Graphs-768x663.png?width=956&height=825&name=Multidimensional-vector-analysis-Graphs-768x663.png)

As more data points are added, patterns like clusters become more pronounced. If these types of diagrams didn’t make sense before, do they now?

![Enrich-Every-Event-@2x-768x657](https://auguria.io/hs-fs/hubfs/Enrich-Every-Event-@2x-768x657.png?width=967&height=827&name=Enrich-Every-Event-@2x-768x657.png)

Alas, humans (usually) can’t visualize more than 3 dimensions well, so we can’t show you. But you can add more and more dimensions, for example ‘Average Execution Duration’, or ‘Task Category’. Using a vector database, thousands of dimensions with millions of vectors can be correlated, searched and analyzed at the same time. 

### **The future vectors are bright**

The shift towards vector-based analytics in SIEM is not just a technological upgrade; it’s a strategic evolution. With their capacity to perform multidimensional analysis and integrate seamlessly with machine learning, vector databases equip SIEM systems for the AI age. But more than that, they solve some hard, practical problems that would otherwise be impossible to solve, or require far more complex and computationally expensive data gymnastics. 

At Auguria, we are using these capabilities to automatically reduce the volume, density and redundancy of security data, but also to classify, and rank security events for augmented incident response and guided threat hunting. Our users have the full breadth and depth of what a vector database can offer at their fingertips, and it fits seamlessly into your existing security operations stack, so now you can derive the complementary synergies of both traditional and cutting edge analytics for security operations.  
  
Most of all though, we’ve done all of the heavy lifting for you. It’s easy to throw text into any old vector database, but that’s not sufficient for effective security analytics. For that you need to know the best way to transform security data into meaningful dimensions and vectors, and that requires an ontology. That’s what we will be discussing in our next article.

**Join us next week when we discuss Unlocking the Power of Ontologies for Advanced Security Analytics.**
