---
created: 2025-04-03T09:23:39 (UTC +02:00)
tags: []
source: https://auguria.io/insights/unlocking-the-power-of-ontologies-for-advanced-security-analytics/
author: James Briggs
---

# Unlocking the Power of Ontologies for Advanced Security Analytics – Part 3

---
![](https://auguria.io/hubfs/Auguria-Unlocking-the-Power-of-Ontologies-Featured-Image-1536x878.jpg)

This is the third and last in a series of articles written to help security analysts, security engineers, and SIEM architects better understand the benefits of vector databases for security operations.

In [part I](https://auguria.io/insights/why-your-next-siem-will-analyze-vectors/), we took a brief look at what a vector is, and how vector databases differ from traditional databases. We discuss why multidimensional or multi-vector analysis is crucial for detecting modern cyber threats.

In [part II](https://auguria.io/insights/why-your-next-siem-will-analyze-vectors-part-2/), we step through a detailed example of how vector embeddings can be used to identify suspicious and anomalous behavior by example of PowerShell commands.

In part III, we talk about ontologies and the groundbreaking role they play in Auguria’s Security Knowledge Layer.

In our previous two blogs on why your next SIEM will analyze vectors, we delved into the transformative potential of vector databases in modernizing SIEM operations. We [explored](https://auguria.io/insights/why-your-next-siem-will-analyze-vectors/) how vector databases are revolutionizing security analytics by offering faster, more efficient, and cost-effective solutions for handling massive amounts of data. We’ve [seen](https://auguria.io/insights/why-your-next-siem-will-analyze-vectors-part-2/) how these databases, with their ability to process high-dimensional data, are particularly well-suited for AI and machine learning applications, which are becoming indispensable in detecting and mitigating cyber threats.

With a solid understanding of vector databases and their application in security operations, we are now ready to delve into the fascinating world of ontologies. This third blog, written by data science luminary James Briggs, unravels how ontologies can further enhance the capabilities of vector databases. We’ll explore how a robust ontology framework helps create highly accurate ontology predictions that can be made at huge scales and retrained within just a few hours using a fully automated training pipeline, providing a powerful method for cybersecurity experts to automate incident triage and prioritization.

### Auguria Ontology Under the Hood

The knowledge layer is the information retrieval component of modern AI systems. It is how AI can provide us with up-to-date, cited, and reliable information. The only problem is that this is for natural language AI applications. There is no knowledge layer for security.

You cannot directly apply modern AI solutions to security event telemetry. First, there is vast data to process, categorize, and enrich. The typical approach of “adding LLMs” to the pipeline may work at a small scale, but to be truly useful, we must operate at the petabyte-per-hour scale.

**The Auguria Security Knowledge Layer (SKL)** enables us to filter down events to remove the vast majority of noise — but how do we squeeze maximum insight out of what remains? The answer: We use a parallel AI-powered “ontology pipeline” to give even more meaning to data.

A high-performance, accurate ontology engine can enrich the data output of our threat detection layer, providing security professionals with a massive edge. These two pipelines mean that we tell you where to look and what to look at.

We will discuss the what, why, and how behind our hybrid vector-based ontology pipeline. Exploring how we’ve used this unique architecture to achieve high flexibility and accuracy in our labeling of security events at massive scale.

### Ontology

When we talk about **ontology**, we refer to the categorization of events into a set of predefined categories. These categories are hierarchical, meaning we also infer relations among events.

**What goes into an Ontology?**  
An ontology is a structured framework that categorizes and defines relationships among different concepts within a domain. For instance, an ontology for cybersecurity organizes security events into categories like ‘user actions’, ‘network activities’, etc., and establishes how these categories relate to each other. By providing a well-defined hierarchy and set of relationships between different cybersecurity elements, an ontology helps in understanding complex security scenarios. By using a common language and set of rules, ontologies can help avoid misunderstandings and improve the accuracy and consistency of information. An ontology typically consist of three things:**#1: Classes**  
The distinct things we are trying to model in our data, for example, users, endpoints, networks and applications.  
**#2: Relationships**  
How classes are connected, for example, users relate to endpoints via credentials, or networks communicate via other networks.  
**#3: Attributes**  
Properties that describe a class, for example users have usernames, endpoints have operating systems.

![Auguria-Unlocking-the-Power-Of-Ontologies-Ontology-Image](https://auguria.io/hs-fs/hubfs/Auguria-Unlocking-the-Power-Of-Ontologies-Ontology-Image.webp?width=994&height=700&name=Auguria-Unlocking-the-Power-Of-Ontologies-Ontology-Image.webp)

Auguria’s default ontology includes three hierarchical layers of categorization. As we move down the hierarchy the precision of our category increases.

> “Auguria provides human operators with context via fully automated, high-confidence ontology labeling all events, even the most obscure ones.”

By utilizing the three-layer hierarchy, Auguria provides human operators with context via fully automated high-confidence ontology labeling for all events, even the most obscure ones. For example, a typical event may land in **Hardware > IoT Devices > Configuration**, but a more obscure event may have a vague third category. Yet, it may still land in a first—or second-level category such as **Hardware > IoT Devices.**

### The Pipeline

Auguria’s ontology pipeline uses the latest technologies from information retrieval and Natural Language Processing (NLP) to enable highly dynamic categorization of ontology labels. The pipeline is optimized for flexibility, requiring only a few examples of a new ontology label to begin effectively categorizing never-before-seen events. Auguria does not require weeks or even months worth of data to train, ensuring that new data sources can be onboarded and classified without much effort or time.

![Auguria-Unlocking-the-Power-Of-Ontologies-The-Pipeline-Image-1536x363](https://auguria.io/hs-fs/hubfs/Auguria-Unlocking-the-Power-Of-Ontologies-The-Pipeline-Image-1536x363.png?width=1536&height=363&name=Auguria-Unlocking-the-Power-Of-Ontologies-The-Pipeline-Image-1536x363.png)

#### Auguria does not require weeks or even months worth of data to train, ensuring that new data sources can be onboarded and classified without much effort or time.

The core concept behind the Ontology pipeline is akin to building a map. On this map, we place flags for particular features. We see a few “Hardware, IoT Devices, Configuration” events in one place, so we label those events. Now, as soon as a new event lands in that region of our map, we can give a % confidence that it belongs to the same category as our previously labeled events based on proximity.  
To produce this map — which we will call our vector space — we need to transform our security events into meaningful numerical representations — which we call “vector embeddings.”

![Auguria-Unlocking-the-Power-Of-Ontologies-Graphic](https://auguria.io/hs-fs/hubfs/Auguria-Unlocking-the-Power-Of-Ontologies-Graphic.webp?width=952&height=410&name=Auguria-Unlocking-the-Power-Of-Ontologies-Graphic.webp)

These vectors are special in that they are generated by AI models that have been specifically trained to understand security event data. When these vectors are created, the AI model encodes its own understanding of what that security event is into the vector. This representation is similar to how a human security professional may view events—they can identify similar events and understand the “meaning” behind them.

Event vectors represent a type of internal language of our AI models. That means that when we feed a new event into the model, the model can place that event into the same vector space. Once inside that vector space, we can identify the ontology event class by comparing its proximity to existing labeled events.

![Auguria-Unlocking-the-Power-Of-Ontologies-Graphic (2)](https://auguria.io/hs-fs/hubfs/Auguria-Unlocking-the-Power-Of-Ontologies-Graphic%20(2).webp?width=725&height=312&name=Auguria-Unlocking-the-Power-Of-Ontologies-Graphic%20(2).webp)

Taking this approach not only allows us to scale at inference time, but also allows us to train and retrain our classifier with a fully automated pipeline. This retrain ability enables us to rapidly specialize across a broad range of use-cases.

Building the vector space and generating our vector embeddings is critical to maximizing accuracy and minimizing latency of our ontology classifier. So, before we discuss the pipeline, let’s examine the vector logic.

### Meaning vs. Terms

When looking for similar events, we can build our vectors using different techniques. The primary approaches are “dense vector search” and “sparse vector search”.

**Dense vector search** describes search using “abstract meaning”. Search based on meaning is made possible with transformer embedding models. This search methodology is similar to how humans think of objects or ideas in abstract terms.

**Sparse vector search** is the traditional approach to text-based search. It generates vectors based on specific terms using techniques like TFIDF or BM25 and then calculates similarity based on term overlap.

Both dense and sparse methods come with their advantages and disadvantages. Dense allows semantic meaning between records to be calculated but struggles with out-of-vocabulary terms. Sparse functions well with out-of-vocabulary terms — however, due to focusing on comparing the terms themselves, we often miss nuances like where different terms may have the same or similar meaning. By using a hybrid vector space we find a balanced mix between semantic and term-based matches — giving us the best of both worlds.

To maximize our ontology performance we merge both dense vectors $x\_d$ and sparse vectors $x\_s$ to produce a hybrid vector space. This is done by calculating similarity matrices for dense ($X\_d$) and sparse ($X\_s$) vector spaces.

We merge the vector spaces by calculating similarity matrices for dense ($X\_d$) and sparse ($X\_s$) vector spaces.

`$$ X_d = x_{A_d} \cdot x_{B_d} $$`

`$$ X_s = x_{A_s} \cdot x_{B_s} $$`

We then merge our similarity matrices with a simple additive function scaled using a scaling factor ($\\alpha$).

`$$ X_h = \alpha * X_d + (1 - \alpha) * X_s $$`

Using this methodology we can identify similar objects based on a hybrid vector space.

### Classifying Ontology Labels

After creating our hybrid vector space pipeline, we feed pre-labeled events into it. This pre-population step acts as a training step, after which we can feed in new, unlabelled events.

The pipeline compares new events to the pre-labeled events within our hybrid vector space. Here we use parallel matrix computations to minimize latency and maximize throughput.

![Auguria-Unlocking-the-Power-Of-Ontologies-Graphic-2-1536x999](https://auguria.io/hs-fs/hubfs/Auguria-Unlocking-the-Power-Of-Ontologies-Graphic-2-1536x999.png?width=1536&height=999&name=Auguria-Unlocking-the-Power-Of-Ontologies-Graphic-2-1536x999.png)

When a new event passes through our hybrid vector space, we return the k most similar ontology labels from the pre-labeled event set. These top k labels may not belong to the same ontology label, so we will produce a final label using a mean, max, or sum aggregation.

Our final label, the predicted ontology label, is then returned from our pipeline, providing us with highly accurate ontology predictions that can be made at huge scales and retrained within just a few hours using a fully automated training pipeline.

### Conclusion

Much more goes into developing this ontology classifier into a fully developed infrastructure pipeline that can handle millions of events every hour.

We must also consider how to quickly retrain ontology labels when moving to a new “domain” of events, how to generate the vast numbers of embeddings to keep up with the volume of incoming logs, how to identify model or data drift over time, and much more. All of these are worthwhile topics worthy of their own articles, which we will discuss in future posts.

For now, we will leave you with the core logic behind our vector-based ontology classifier, why we use vector embeddings to scale classification to massive events-per-hour capability while keeping our training pipelines as flexible as possible, and why we use hybrid vector space to optimize classifier performance.
