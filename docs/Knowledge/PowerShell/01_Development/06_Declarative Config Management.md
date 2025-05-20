---
created: 2025-05-20T20:49:12 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/declarative-configuration-management-daec4007bb77
author: 
---

# Declarative Config Management | by Christopher Kuech | in The Startup - Freedium

---
_Part 6 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

Configuration Management is hard. It's hard because if you create one config per environment, the number of configs you manage can grow exponentially with a high rate of overlap, making config changes tedious, and prone to human error and configuration drift. It's hard because engineers casually choose heavy platforms (Chef, Puppet, Ansible, etc.) to solve the problem without sufficient experience to understand those platform's patterns, while also falling into vendor lock. Most importantly, it's hard because people implement configuration management scripts without properly formalizing the problem and implementing an appropriate solution.

We will seek inspiration from popular [Declarative DevOps](https://medium.com/@cjkuech/declarative-devops-30788ddd43cd) frameworks like Helm and ARM/CloudFormation to implement our own declarative microframework in PowerShell for managing configurations across non-homogenous environments. Using this approach my team was able to reduce lines of config code by 91%. The [completed solution](https://github.com/chriskuech/configsets) is only a couple hundred lines (including tests, robust interfaces, and additional utilities).

![None](https://miro.medium.com/v2/resize:fit:700/1*9P68qIca1VlnlgigAD58lg.jpeg)

What your configuration management system probably looks like today (Photo by [JF Martin](https://unsplash.com/@jfmartin67?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/messy-office?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText))

### Formalizing our understanding

Before we can discuss proper configuration management, we have to speak the same language. We will use these terms and concise definitions to formalize our understanding of the problem before we outline a solution.

#### Configuration

The complete set of data required to configure some aspect of a _Cluster Set._ Applications usually require two types of configuration data: static configuration data loaded at startup to give the application instance an identity and resources (i.e. database and key vault references), and dynamic configuration data determined at request time to flight features to users (i.e. A/B testing and dark features). Our DevOps configuration management solution will only handle static configuration data.

#### Partial Configuration

The smallest subset of the data required to configure some aspect of a _Cluster Set._ For example, if our service is GDPR-compliant, we will need to store European data in Europe and American data in the US, so our European _Clusters_ will have a different _Partial Configuration_ containing our database connection strings than our US _Clusters_. Because it is the smallest subset required for configuration, this GDPR-compliant _Partial Configuration_ would not contain any information unrelated to GDPR compliance.

#### Cluster

An indivisible set of objects that share a common _Configuration_. For example, a _Cluster_ of VMs will all share identical _Configuration_ data (except for their own unique identifiers, such as the Computer Name).

#### Cluster Set

A set of _Clusters_ that share a common _Partial Configuration_. In our example in the _Partial Configuration_ definition, our _Cluster Sets_ would be our Europe _Cluster_ and our US _Cluster_. If we added service flighting, we would also have a Staging _Cluster Set_ and a Production _Cluster Set_ both spanning Europe and the US. We also have more specific _Cluster Sets_ that contain just a single _Cluster_: Europe-Staging, Europe-Production, US-Staging, and US-Production.

#### Cluster Set Type

A single dimension across which we group _Clusters_ into _Cluster Sets_. For example, in our _Cluster Set_ definition, we have a _Cluster Set Type_ called "Flighting Ring" containing "Staging" and "Production", and we have a _Cluster Set Type_ called "Geo" containing "Europe" and "US". Typically, an enterprise-grade deployment platform will support 4 or 5 _Cluster Set Types_:

-   **Service** or **Namespace** — some grouping used solely for providing isolation. A true multi-tenant platform will not have this _Cluster Set Type_, so we will not use this is in our examples, but you may find it useful.
-   **Flighting Ring** — _Cluster Sets_ that share common versions of their hosted application, used for flighting changes with incremental rollout. Common values include "DEV" (development), "STAGING" (staging), "INT" (integration), "PPE" (preproduction), and "PROD" (production). These values are largely dependent on your team's processes. My teams have always used ALLCAPS casing to implicitly indicate that these are well-known enum values.
-   **Geo** — a grouping of services that share a common legal compliance requirement. For example, all _Clusters_ in the "Europe" _Cluster Set_ implement GDPR compliance in the same manner (storing data in any European data center). If all your _Clusters_ are in the same jurisdiction (ex: only hosted in the US), then you do not need this _Cluster Set Type_. Similar to Flighting Rings, you may wish to use well-known enum values, like "US" or "EU".
-   **Region** — the Cloud service provider region that hosts the Cluster. For example, if a Cluster's VMs are hosted in a data center in Virginia, the Cluster's region will be EastUS (if on Azure, with spaces removed) or useast1 (if on AWS, with non-alphanumeric characters removed). If you are hosted on-premises, this will be your data center identifier. _Partial Configurations_ that are attached to a regional _Cluster Set_ have common configuration related to the location, usually for latency considerations.

![None](https://miro.medium.com/v2/resize:fit:700/1*LgpJGIY0SbdWOXcDTdnx8Q.png)

A hierarchical tree of Cluster Sets

### Creating our Microframework

#### Formalizing our Problem

Using our concise terms, we need a microframework that will, given a _Cluster Set_ and mapping of _Cluster Sets_ to _Partial Configurations_, return the _Configuration_ for that _Cluster Set._ (Because this is a microframework and not a full-fledged framework, we are solving the minimal scope possible, so applying the configuration is out of scope).

> Given a Cluster Set, return the Configuration for that Cluster Set

We need to clearly identify a _Cluster Set_, so we will define an order for our _Cluster Set Types_, then take the cross-product of those sets in that order to generate the set of _Cluster Set_ identity vectors. For example, using the _Cluster Set Type_ examples above, our Cluster Set identity vectors are defined as members of _{DEV, STAGE, PROD} X {EU, US} X {NorthEurope, WestEurope, EastUS, WestUS}_, such as _(PROD, EU, NorthEurope)._ Note that only a subset of that cross-product actually exists — it's the set of potential _Cluster Sets_, not the set of actual _Cluster Sets_.

> A Cluster Set is identified as a member of the cross-product of our Cluster Set Types.

Fundamentally, we are trying to define a function that transforms a _Cluster Set_ and a set of _Partial Configurations_ to a _Configuration_. We will do this in two steps:

1.  Filtering the set of all _Partial Configurations_ to only the _Partial Configurations_ that apply to our _Cluster Set_
2.  Merging the _Partial Configurations_ into a single _Configuration_

#### Shaping the problem to work with PowerShell

PowerShell is optimized for I/O with files (it's arguably the best language around for I/O with files), so we will store our _Partial Configurations_ as files. We will name our _Partial Configuration_ file with a serialized version of our _Cluster Set_ identity. To convert a _Cluster Set_ identifier vector to a file name, we will join the values with dashes.

Sometimes a _Partial Configuration_ applies to all members of a _Cluster Set Type_. In that case, we need a wildcard to act as a placeholder for the _Cluster Set Type_. We use `_` as our wildcard in the file name and convert it to a glob `*` for use with `-like` or the Item cmdlets.

#### Generating the Configuration

We can use `Select-ClusterSetPartialConfig` to provide a list of Partial Configuration files that apply to our Cluster Set. Now we need to thoughtfully merge the partials into a single valid Configuration. This depends largely on your configs and how you want to merge them.

We will use the `Merge-Object` cmdlet from the [`Functional`](https://github.com/chriskuech/functional) module to merge our objects. `Merge-Object` supports two merge strategies: `Override` and `Fail`, and merges according to the following rules:

1.  Given two objects, recursively merge them.
2.  Given two hashtables, recursively merge them.
3.  Given two arrays, return the sorted unique values.
4.  Given a new value, return it.
5.  Given two conflicting values, use the conflict resolution strategy. If using `Override`, return the newer value; if using `Fail`, throw an error.

The `Fail` merge strategy is [commutative](https://en.wikipedia.org/wiki/Commutative_property) — the order in which we merge our configs does not matter. The `Override` merge strategy, however, does produce different results depending on the order of the _Partial Configurations_. As such, we need to intelligently `Sort-Object` our configs. If we want to always override wildcarded configs with non-wildcarded configs, such that more specific configs override more general configs, we can sort our _Partial Configuration_ file names using `Sort-Object`, so that `_` always comes before alphabetical names.

### The Completed Solution

By first abstracting the problem, then codifying the abstracted problem into idiomatic PowerShell, we were able to reduce the otherwise difficult problem of configuration management into one-liners like `Select-ClusterSetPartialConfig` that you can easily copy directly into your project.

If you prefer a more robust solution, you can install the [`configsets`](https://github.com/chriskuech/configsets) module from PowerShell Gallery. [`configsets`](https://github.com/chriskuech/configsets) introduces a few cmdlets for managing configs —

-   `Selet-Config`— a more robust equivalent to `Select-ClusterSetPartialConfig`.
-   `Assert-HomogenousConfig`— for asserting that all your configs are consistently named to work with `Select-Config`.
-   `Assert-ParseableJson` — for asserting that all your configs can be parsed as valid JSON.

You may also find the [`Test-Json`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/test-json) native cmdlet beneficial for validating your configs against a schema (assuming you don't hit [this bug](https://github.com/PowerShell/PowerShell/issues/9560) first).

### Next Steps

Now that we have functions that can select and merge _Partial Configurations_ into a _Configuration_, we can store _Partial Configurations_ in a folder in `git`. This opens up the door for significant improvements.

-   We can now add multiple types of configs. Our `Merge-Object` cmdlet from [`Functional`](https://github.com/chriskuech/functional) enables declarative config management and supports all configs that comply with our supported merge strategies. Instead of making a single big monolithic config, we can add more config folders to implement separation of concerns within our configs.
-   We can now add branch policies to force people to code review our config changes in Pull Requests.
-   We can now add Pull Request validation builds as part of our branch policies so that we can run assertion functions like `Assert-HomogenousConfig`, `Assert-ValidJson`, a custom wrapper around `Test-Json`, or a custom validation function to validate our configs before pushing them into `master` branch.
-   We can add Continuous Integration and Continuous Deployment to immediately begin pushing out our configs so that our `master` git branch is always the source of truth for our live configuration.

#### Learn more about scaling your PowerShell

This article is part of [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) series of articles on managing PowerShell codebases at scale. Read the [rest of the series](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to learn more about designing and writing less code for large DevOps codebases.

### Appendix: Secret configs

If all of your config data are just Key-Value pairs (not structured JSON), and some of your data is sensitive, you may require using secure secret storage as your source of truth rather than git.

#### Azure Key Vault

Create a Key Vault using a globally unique random identifier.

Put the Key Vault in a resource group named with your _Cluster Set_ identifier and always use the Azure Resource Manager API or cmdlets to find the Key Vault by resource group name to map the _Cluster Set_ identifier to its random identifier. Instead of recursively merging PowerShell objects as we do with config files, implement query and merging logic on Key Vaults instead.

Make sure you follow [best practices](https://medium.com/@zwc101/managing-application-secrets-88dd8d54d14a) when managing application secrets in Key Vault.

#### AWS SSM Parameter Store

If you use AWS, check out Parameter Store. Parameter Store lets you store key-value pairs at a path and traverse the Parameter Store "directories", giving you the select and merging logic we implemented as part of their SDK.
