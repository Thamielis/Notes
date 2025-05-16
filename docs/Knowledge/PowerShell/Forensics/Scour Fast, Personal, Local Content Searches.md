https://www.leeholmes.com/scour-fast-personal-local-content-searches/

> Precision Computing - Software Design and Development

# Scour: Fast, Personal, Local Content Searches
### Scour: Fast, Personal, Local Content Searches

Tue, Aug 28, 2018 3-minute read

If you have a large collection of documents (source code or text files), searching them with PowerShell or your favourite code editor can feel like it takes forever.

[![image](https://www.leeholmes.com/images/2018/08/image_thumb.png "image")](https://www.leeholmes.com/images/2018/08/image.png)

How is it that we can search the entire content of the Internet in milliseconds, but searching your local files can take minutes or hours?

It turns out that there is a solution built into many products and technologies that can help us: the [Apache Lucene project](https://lucene.apache.org/). Lucene forms the search engine backbone for many popular products: Solr, Twitter, ElasticSearch, and at least [a few hundred others](https://wiki.apache.org/lucene-java/PoweredBy). Unfortunately for us, however, it comes as a software development kit and not a simple tool that you can use from the command line.

With the introduction of a Scour – a new PowerShell module – that all changes.

Scour is a PowerShell module that lets you search any directory on your computer using the power of the Lucene search engine backend. After you run an initial indexing process, future searches are tens or hundreds of times faster than the searches you are currently used to.

## Install Scour

To install Scour in PowerShell, simply run:

> Install-Module Scour –Scope CurrentUser

## Create an Index

Lucene accomplishes its excellent search performance by analyzing your files and then storing information in an index. To create this index, go to a directory that contains the files you care about and run:

> Initialize-ScourIndex

By default, Scour indexes text files (\*.txt) and the source files for popular programming languages. If you want it to index additional file types, you can use the –Path parameter.

Scour will first scan the current directory (and subdirectories) to determine how many files it has to index, and then displays a progress bar to let you know how much time is left in the indexing process.

[![image](https://www.leeholmes.com/images/2018/08/image_thumb-1.png "image")](https://www.leeholmes.com/images/2018/08/image-1.png)

## Search your Content

Once you’ve created the index for a directory, use the Search-ScourContent cmdlet:

> Search-ScourContent *“query”*

As mentioned before, Scour leverages the Lucene search engine under the hood, so *query* should follow the rules of [Lucene Search Syntax](https://lucene.apache.org/core/2_9_4/queryparsersyntax.html). This syntax is also described in the about\_query\_syntax.txt help file included with Scour. Here are a few examples:

-   Search-ScourContent “word1 word2” – Searches for all files that contain word1 or word2
-   Search-ScourContent “word1 AND word2” – Searches for all files that contain both word1 and word2
-   Search-ScourContent word\* – Searches for all files that have a word starting with “word”
-   Search-ScourContent word~ – Searches for all files that have a word similar to “word”

By default, Scour returns the files that match your query. You can pipe the results into Select-String, Copy-Item, or anything other scripting you might want to do on these results.

[![image](https://www.leeholmes.com/images/2018/08/image_thumb-2.png "image")](https://www.leeholmes.com/images/2018/08/image-2.png)

If you start your search from within a specific directory, Scour automatically limits your results to documents in that directory or below.

In addition to the file content, Scour also indexes the document paths. This lets you add path-based restrictions to your searches. For example:

-   Search-ScourContent ‘path:william AND following’

If you want to search for specific regular expressions within your files, Scour lets you combine the efficiency of indexed document searches with a line-by-line regular expression match. To do this, add the –RegularExpression parameter to your call.

Here’s an example of finding all documents that have the word “following” in them, and then returning just the lines that match the regular expression “follow.\*Cambri.\*”.

[![image](https://www.leeholmes.com/images/2018/08/image_thumb-3.png "image")](https://www.leeholmes.com/images/2018/08/image-3.png)

If you want to restrict your searches to a specific file type (i.e.: \*.cs), you can use the –Path parameter to Search-ScourContent.

Enjoy!
