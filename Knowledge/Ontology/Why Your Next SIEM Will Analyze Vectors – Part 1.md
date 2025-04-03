---
created: 2025-04-03T09:18:53 (UTC +02:00)
tags: []
source: https://auguria.io/insights/why-your-next-siem-will-analyze-vectors/
author: Oliver Rochford
---

# Why Your Next SIEM Will Analyze Vectors – Part 1

---
![](https://auguria.io/hubfs/vector-database.jpg)

#### Modern security data is growing not just in volume, but also in variety and complexity and these factors drive the need for the next phase of security analytics that will supersede your current SIEM.

### **Why Vectors Matter** 

Technology continues to advance and we find ourselves at a new stage; Auguria is in the vanguard of a new breed of solutions poised to harness vector databases to tackle the thorny problem of security information and event management. Vector databases will move the needle for SIEM systems because they enable faster, more efficient, and by proxy, cheaper, processing of massive amounts of security data.  Most important of all is that this way of representing data is particularly well suited to machine learning and AI.

Security information and event management solutions have been reinvented many times over to make use of the latest advancements in data processing and storage technology. Arcsight was the leader in the SQL era SIEM databases, Splunk in the age of NoSQL SIEM databases, and today there are several contenders vying for supremacy by building SIEM on cloud storage or data lakes.

With the ability to store and analyze highly dimensional data in vector format, Auguria’s solution differentiates with the promise of fast and affordable threat detection across vast quantities of data, something previously infeasible. Security operations professionals need to take note of this emerging technology. Here’s what you need to know.

#### Part I: What Security Operations Professionals Need to Know about Vector Databases

This is the first in a series of articles written to help security analysts, security engineers, and SIEM architects better understand the benefits of vector databases for security operations.

In part I we take a brief look at what a vector is, and how vector databases differ from traditional databases. We discuss why multidimensional or multi-vector analysis is crucial for detecting modern cyber threats.

In part II, we step through a detailed example of how vector embeddings can be used to identify suspicious and anomalous behavior by example of PowerShell commands.

### **Go Deeper: Understanding Vector Databases in SIEM**

Modern security data has grown not just in volume, but also in variety and complexity. Regardless of where or how it’s stored, the ability to quickly search through and retrieve relevant data from a large dataset is crucial for decisive incident investigation and response. But it’s not just sufficient anymore to keep increasing how much data we can ingest–bigger pipes, more storage capacity–only to make it available for primitive analytical methods like keyword search or tallying up numbers. 

Vector databases, a critical component to solving data scaling problems, take a very different approach, having been designed to represent complex information with large amounts of different attributes and features, or what is referred to as “high dimensionality”. Vectors are particularly suited for tasks involving similarity and semantic searches across many, many different attributes, or dimensions, where the goal is to find data points that are closest or furthest away in the vector space to a given query point. This makes vector databases ideal for the sort of analysis needed in threat hunting and for detection engineering, especially as we begin adding more intelligent automation.

#### **What is the difference between a vector database and a traditional database?**

A traditional database primarily stores and retrieves data structured as tables, optimizing for operations like joins, searches by indices, and transaction integrity. It’s ideal for exact match queries but can struggle with complex, high-dimensional data.

In contrast, a vector database is designed to handle high-dimensional vector data embeddings. They are comparatively more scalable, flexible, and efficient than a traditional database for certain applications, especially artificial intelligence, and machine learning applications, such as similarity search because it enables high-dimensional search without the cost and performance problems of traditional approaches. 

A vector is a general mathematical representation of data in a space described by multiple dimensions. An embedding, on the other hand, refers to the process of mapping high-dimensional data into a lower-dimensional, meaningful vector space while preserving contextual relationships. While all embeddings are vectors, not all vectors are embeddings.  Embeddings are vectors with embedded contextual meaning derived during a transformation process.

Vector databases excel in similarity searches – finding the nearest or furthest vectors by distance metrics – making it ideal for applications like threat hunting and anomaly detection in cybersecurity, because it allows fast identification of patterns or similar behaviors across large data sets, enhancing real-time response capabilities.

### **What Are Vectors?**

Vectors refer to a numerical representation of data where each element (or dimension) of the vector captures a specific characteristic of the data. Part of the magic is the data-to-numerical vector transformation that is notably **absent** in legacy database tech but which is one of the key ingredients to analyze multi-dimensional data at scale. In network security, for example, a vector might represent various attributes of network traffic, such as volume, types of protocols used, frequency of connections, and other relevant metrics. These vectors are used to quantify and analyze the behavior of network traffic in a structured and measurable way.

The fact that vectors represent data numerically is essential for tasks such as similarity search, clustering, and anomaly detection in massive datasets. Vector databases can handle high-dimensional data by providing capabilities for executing complex queries that involve multiple vectors simultaneously.  
 

#### **The Curse of Dimensionality**

“High dimensionality” refers to data that has a large number of attributes or features, each representing a different dimension in a dataset. 

High-dimensional data is difficult to analyze because each additional dimension adds more information that must be processed. Visualizing it is even harder, because we can’t imagine more than 3 physical dimensions. That’s why it is often called the “curse of dimensionality”.

A well-designed vector embedding engine will conduct dimensionality reduction, whereby complex data is simplified while preserving its important information aspects. For example, some data is repeated even within the same event log, but with different field names, e.g.  “Source IP-Address” and “Host IP-Address’ ‘, and can be rationalized. Data represented using meta schemas like the Open Cybersecurity Schema Framework (OCSF) or Elastic Common Schema (ECS)  may contain sparse fields, basically fields with empty or NULL values, that can safely be removed. 

Because a vector database can effectively reduce the dimensionality of data while simultaneously preserving its aggregate informational content, organizations can lower their operational costs, reducing the computational and storage requirements needed to process and analyze security data for security use-cases.

#### **Applying vector tech to existing and also emerging problems**

Vector databases are far superior to traditional SIEM databases in anomaly detection because they facilitate greater compute and performance efficiency for comparisons across extensive datasets containing thousands of individual attributes. SIEM systems that leverage vector analytics can detect more complex, subtle, and low-footprint security threats within very noisy data sets.

Because vector databases store dimensional data as numerical representations, they naturally support machine learning algorithms better than traditional relational databases. This is essential because AI and ML require data in vector format to effectively operate. Vector databases also leverage the massive parallel computing capabilities of GPUs, which are catalyzing the generational shift in AI technology. These advancements are going to significantly enhance the capabilities of SIEMs, allowing them to process unprecedented volumes of data in real-time.

Most importantly though, vector databases provide data ideally formatted for deep learning, the kind of self-learning AI approaches essential for ensuring that the next-generation of SIEM systems can dynamically adapt to and learn from new threats with minimal human intervention.  Machine learning models thrive on numerical data, and vectors are ideal representations for these algorithms. By encoding features as numerical values, machine learning models can perform calculations, learn patterns, and make predictions based on mathematical principles applied to these vectors. This allows scalable and powerful data analysis across various applications, from image recognition to natural language processing, and is also what enabled LLMs to achieve the high level of capability they display today.

### **Dig into an Example: The Old Way with One Attribute at a Time**

Drawing conclusions from single dimension (aka single vector, or univariate) analysis is often brittle and inaccurate. The “old way” often involves examining how a single characteristic or attribute behaves over time to detect anomalies based on predefined thresholds or patterns. For example, a detection might flag a network connection that shows an unusually high amount of data transfer as potentially malicious. This type of analysis is straightforward and can effectively catch anomalies that deviate significantly from normal behavior.  The problem is that though the traditional approach of single vector analysis is effective for identifying straightforward anomalies, it is also prone to false positives. This is especially problematic when we consider automating response actions that incorrectly disable, for example, the CEO’s network comms because of an incorrectly interpreted set of network events. Automating security responses reliably requires more than a single predictive model or single input detection. Conversely, multivector analysis in a vector database enables a more nuanced, reliable analysis approach and can provide a higher level of confidence that an automated response action is indeed appropriate.

##### _Automating security responses requires more than single model detection._

_![Autamating-security](https://auguria.io/hs-fs/hubfs/Autamating-security.png?width=955&height=541&name=Autamating-security.png)_

### **Dig into Another Example: A Better Way using Multivector Analysis**

Unlike single vector analysis, a vector database can compare multiple vectorized dimensions simultaneously, allowing the identification of patterns or anomalies across different dimensions of the data. An anomaly might not be apparent when assessing a single dimension like data volume but becomes more certain when correlated with other dimensions such as the time of day or the types of protocols used.

Vector databases also store long term historical data far more efficiently, allowing systems to perform trend analysis over longer periods of time for the same dollar. Contrast this with traditional SIEM’s that rarely keep live data around for longer than 30 days, essentially lobotomizing the SOC. By comparing multiple vectors over time, vector-based SIEM systems can identify trends and patterns that indicate emerging threats or ongoing attacks, including those that develop slowly and are hard to detect by viewing a snapshot.

#### **Multidimensionality in Layman’s Terms**

It might still not be entirely clear why multidimensionality is such a big deal for data analysis, so let’s use an analogy. Every location on earth can be described using the geographic coordinate system. The GCS defines two dimensions, longitude and latitude. For my home town for example, Glossop, for, the details are:

Latitude: 53.443272 Longitude: -1.948850.

I could now check on a map to see which 5 other towns or cities are nearest to me. For instance, there’s a town, Mottram, at 53.458519, -2.012480.  
  
But what if I want to use more granular criteria? I might be looking to move house, so it could be useful to add more dimensions to help me make a more informed choice. It would be nice to know which the 5 nearest towns are with a similar median income to where I currently live. I might also want to know which the top 5 locations are with closest proximity to an airport. Each one of these criteria can be considered a dimension (although some may be broken down further to model them more precisely). We can add any number of further dimensions, like the number of Michelin star restaurants, or the number of museums and libraries. 

Using a vector database, we can consider and analyze all of these simultaneously. And if this sounds vaguely familiar, that’s because similar approaches are being used in recommendation systems for movies or music, and even underpinning the current wave of Large Language Models.

Vector databases enable lower cost, higher performance security event similarity analysis, an essential capability for cybersecurity personnel looking for anomalies when they don’t know exactly what they are seeking. The simplest example for this would be identifying domain typosquatting, when hackers register domains with deliberately misspelled names of well-known websites.  By analyzing clusters of similar vectors, in this case similarly but differently spelt domain names, for example “microsoft.com”, “mircosoft.com”, “micrasoft.com”, a vector database can help identify patterns that represent a common type of potential threats. This type of clustering also helps in differentiating between benign anomalies (like an unusually large but legitimate data transfer by an IT department) and malicious activities (like data exfiltration attempts by malware).

Comprehensive multi-vector analysis is also the only way to automate detecting multi-stage, multi-technique attacks, especially when they leverage evasive techniques like [living-off-the-land](https://www.securonix.com/blog/thwarting-evasive-attacks-with-behavioral-analysis/) because they only become visible when data from all vectors is analyzed collectively.  Threat actors utilizing legitimate system administration tools like PowerShell are challenging to detect using traditional signatures, where we don’t have advanced knowledge of indicators of compromise, and the “Who, What, When, Why and Where” matter more. This is what makes vector databases exceptionally powerful at detecting complex, subtle, or evolving cybersecurity threats across large and diverse environments.

We’ve established what a vector database is, and why their ability to analyze multidimensional data in parallel and at scale makes them an ideal data foundation for many security operations use cases. In the next article in this series we will step through a simplified example of how security data is transformed into vector embeddings and how that is used for similarity and cluster analysis.
