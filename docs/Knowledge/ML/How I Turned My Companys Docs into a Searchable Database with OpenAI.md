## And how you can do the same with your docs

[

![Jacob Marks, Ph.D.](https://miro.medium.com/v2/resize:fill:88:88/0*YukZswf8UB1bQdTV)



][1][

![Towards Data Science](https://miro.medium.com/v2/resize:fill:48:48/1*CJe3891yB1A1mzMdqemkdg.jpeg)



][2]

![](https://miro.medium.com/v2/resize:fit:700/1*rsp22rKwFDjiwwCcUly56Q.jpeg)

Image courtesy of Unsplash.

For the past six months, I’ve been working at series A startup Voxel51, a and creator of the [open source computer vision toolkit FiftyOne][3]. As a machine learning engineer and developer evangelist, my job is to listen to our open source community and bring them what they need — new features, integrations, tutorials, workshops, you name it.

A few weeks ago, we added native support for vector search engines and text similarity queries to FiftyOne, so that users can find the most relevant images in their (often massive — containing millions or tens of millions of samples) datasets, via simple natural language queries.

This put us in a curious position: it was now possible for people using open source FiftyOne to readily search datasets with natural language queries, but using our documentation still required traditional keyword search.

We have a lot of documentation, which has its pros and cons. As a user myself, I sometimes find that given the sheer quantity of documentation, finding precisely what I’m looking for requires more time than I’d like.

I was not going to let this fly… so I built this in my spare time:

![](https://miro.medium.com/v2/resize:fit:700/1*BhZ7mT-Y_RvFhdeSCR6-zQ.gif)

Semantically search your company’s docs from the command line. Image courtesy of author.

So, here’s how I turned our docs into a semantically searchable vector database:

-   [Converted all of the docs to a unified format][4]
-   [Split docs into blocks and added some automated cleanup][5]
-   [Computed embeddings for each block][6]
-   [Generated a vector index from these embedding][7]
-   [Defined the index query][8]
-   [Wrapped it all in a user-friendly command line interface and Python API][9]

You can find all the code for this post in the [voxel51/fiftyone-docs-search][10] repo, and it’s easy to install the package locally in edit mode with `pip install -e .`.

Better yet, if you want to implement semantic search for your own website using this method, you can follow along! Here are the ingredients you’ll need:

-   _Install the_ [_openai_][11] _Python package and create an account:_ you will use this account to send your docs and queries to an inference endpoint, which will return an embedding vector for each piece of text.
-   _Install the_ [_qdrant-client_][12] _Python package and launch a_ [_Qdrant server via Docker_][13]: you will use [Qdrant][14] to create a locally hosted vector index for the docs, against which queries will be run. The Qdrant service will run inside a Docker container.

## Converting the docs to a unified format

My company’s docs are all hosted as HTML documents at [https://docs.voxel51.com][15]. A natural starting point would have been to download these docs with Python’s [requests][16] library and parse the document with [Beautiful Soup][17].

As a developer (and author of many of our docs), however, I thought I could do better. I already had a working clone of the GitHub repository on my local computer that contained all of the raw files used to generate the HTML docs. Some of our docs are written in [Sphinx ReStructured Text (RST)][18], whereas others, like tutorials, are converted to HTML from Jupyter notebooks.

I figured (mistakenly) that the closer I could get to the raw text of the RST and Jupyter files, the simpler things would be.

## RST

In RST documents, sections are delineated by lines consisting only of strings of `=`, `-` or `_`. For example, here’s a document from the FiftyOne User Guide which contains all three delineators:

![](https://miro.medium.com/v2/resize:fit:700/1*4IavnXBTTQNrM813sGzq8w.png)

RST document from open source FiftyOne Docs. Image courtesy of author.

I could then remove all of the RST keywords, such as `toctree`, `code-block`, and `button_link` (there were many more), as well as the `:`, `::`, and `..` that accompanied a keyword, the start of a new block, or block descriptors.

Links were easy to take care of too:

```
no_links_section = re.sub(r"<[^>]+>_?","", section)
```

Things started to get dicey when I wanted to extract the section anchors from RST files. Many of our sections had anchors specified explicitly, whereas others were left to be inferred during the conversion to HTML.

Here is an example:

```
.. _brain-embeddings-visualization:Visualizing embeddings______________________The FiftyOne Brain provides a powerful:meth:`compute_visualization() <fiftyone.brain.compute_visualization>` methodthat you can use to generate low-dimensional representations of the samplesand/or individual objects in your datasets.These representations can be visualized natively in the App's:ref:`Embeddings panel <app-embeddings-panel>`, where you can interactivelyselect points of interest and view the corresponding samples/labels of interestin the :ref:`Samples panel <app-samples-panel>`, and vice versa... image:: /images/brain/brain-mnist.png   :alt: mnist   :align: centerThere are two primary components to an embedding visualization: the method usedto generate the embeddings, and the dimensionality reduction method used tocompute a low-dimensional representation of the embeddings.Embedding methods-----------------The `embeddings` and `model` parameters of:meth:`compute_visualization() <fiftyone.brain.compute_visualization>`support a variety of ways to generate embeddings for your data:
```

In the brain.rst file in our User Guide docs (a portion of which is reproduced above), the _Visualizing embeddings_ section has an anchor `#brain-embeddings-visualization` specified by `.. _brain-embeddings-visualization:`. The _Embedding methods_ subsection which immediately follows, however, is given an auto-generated anchor.

Another difficulty that soon reared its head was how to deal with tables in RST. [List tables][19] were fairly straightforward. For instance, here’s a list table from our View Stages cheat sheet:

```
.. list-table::   * - :meth:`match() <fiftyone.core.collections.SampleCollection.match>`   * - :meth:`match_frames() <fiftyone.core.collections.SampleCollection.match_frames>`   * - :meth:`match_labels() <fiftyone.core.collections.SampleCollection.match_labels>`   * - :meth:`match_tags() <fiftyone.core.collections.SampleCollection.match_tags>`
```

[Grid tables][20], on the other hand, can get messy fast. They give docs writers great flexibility, but this same flexibility makes parsing them a pain. Take this table from our Filtering cheat sheet:

```
+-----------------------------------------+-----------------------------------------------------------------------+| Operation                               | Command                                                               |+=========================================+=======================================================================+| Filepath starts with "/Users"           |  .. code-block::                                                      ||                                         |                                                                       ||                                         |     ds.match(F("filepath").starts_with("/Users"))                     |+-----------------------------------------+-----------------------------------------------------------------------+| Filepath ends with "10.jpg" or "10.png" |  .. code-block::                                                      ||                                         |                                                                       ||                                         |     ds.match(F("filepath").ends_with(("10.jpg", "10.png"))            |+-----------------------------------------+-----------------------------------------------------------------------+| Label contains string "be"              |  .. code-block::                                                      ||                                         |                                                                       ||                                         |     ds.filter_labels(                                                 ||                                         |         "predictions",                                                ||                                         |         F("label").contains_str("be"),                                ||                                         |     )                                                                 |+-----------------------------------------+-----------------------------------------------------------------------+| Filepath contains "088" and is JPEG     |  .. code-block::                                                      ||                                         |                                                                       ||                                         |     ds.match(F("filepath").re_match("088*.jpg"))                      |+-----------------------------------------+-----------------------------------------------------------------------+
```

Within a table, rows can take up arbitrary numbers of lines, and columns can vary in width. Code blocks within grid table cells are also difficult to parse, as they occupy space on multiple lines, so their content is interspersed with content from other columns. This means that code blocks in these tables need to be effectively reconstructed during the parsing process.

Not the end of the world. But also not ideal.

## Jupyter

Jupyter notebooks turned out to be relatively simple to parse. I was able to read the contents of a Jupyter notebook into a list of strings, with one string per cell:

```
import jsonifile = "my_notebook.ipynb"with open(ifile, "r") as f:    contents = f.read()contents = json.loads(contents)["cells"]contents = [(" ".join(c["source"]), c['cell_type'] for c in contents]
```

Furthermore, the sections were delineated by Markdown cells starting with `#`.

Nevertheless, given the challenges posed by RST, I decided to turn to HTML and treat all of our docs on equal footing.

## HTML

I built the HTML docs from my local install with `bash generate_docs.bash`, and began parsing them with Beautiful Soup. However, I soon realized that when RST code blocks and tables with inline code were being converted to HTML, although they were rendering correctly, the HTML itself was incredibly unwieldy. Take our filtering cheat sheet for example.

When rendered in a browser, the code block preceding the _Dates and times_ section of our filtering cheat sheet looks like this:

![](https://miro.medium.com/v2/resize:fit:700/1*qQbA0hfzNLkDs7vL2L6IDQ.png)

Screenshot from cheat sheet in open source FiftyOne Docs. Image courtesy of author.

The raw HTML, however, looks like this:

![](https://miro.medium.com/v2/resize:fit:700/1*Win6Z82ZfGMz0ofsWs9XTQ.png)

RST cheat sheet converted to HTML. Image courtesy of author.

This is not impossible to parse, but it is also far from ideal.

## Markdown

Fortunately, I was able to overcome these issues by converting all of the HTML files to Markdown with [markdownify][21]. Markdown had a few key advantages that made it the best fit for this job.

1.  **Cleaner than HTML**: code formatting was simplified from the spaghetti strings of `span` elements to inline code snippets marked with single `` ` `` before and after, and blocks of code were marked by triple quotes ` ``` `before and after. This also made it easy to split into text and code.
2.  **Still contained anchors:** unlike raw RST, this Markdown included section heading anchors, as the implicit anchors had already been generated. This way, I could link not just to the page containing the result, but to the specific section or subsection of that page.
3.  **Standardization**: Markdown provided a mostly uniform formatting for the initial RST and Jupyter documents, allowing us to give their content consistent treatment in the vector search application.

## Note on LangChain

Some of you may know about the open source library [LangChain][22] for building applications with LLMs, and may be wondering why I didn’t just use LangChain’s [Document Loaders][23] and [Text Splitters][24]. The answer: I needed more control!

## Processing the documents

Once the documents had been converted to Markdown, I proceeded to clean the contents and split them into smaller segments.

## Cleaning

Cleaning most consisting in removing unnecessary elements, including:

-   Headers and footers
-   Table row and column scaffolding — e.g. the `|`’s in `|select()| select_by()|`
-   Extra newlines
-   Links
-   Images
-   Unicode characters
-   Bolding — i.e. `**text**` → `text`

I also removed escape characters that were escaping from characters which have special meaning in our docs: `_` and `*`. The former is used in many method names, and the latter, as usual, is used in multiplication, regex patterns, and many other places:

```
document = document.replace("\_", "_").replace("\*", "*")
```

## Splitting documents into semantic blocks

With the contents of our docs cleaned, I proceeded to split the docs into bite-sized blocks.

First, I split each document into sections. At first glance, it seems like this can be done by finding any line that starts with a `#` character. In my application, I did not differentiate between h1, h2, h3, and so on (`#` , `##` , `###`), so checking the first character is sufficient. However, this logic gets us in trouble when we realize that `#` is also employed to allow comments in Python code.

To bypass this problem, I split the document into text blocks and code blocks:

```
text_and_code = page_md.split('```')text = text_and_code[::2]code = text_and_code[1::2]
```

Then I identified the start of a new section with a `#` to start a line in a text block. I extracted the section title and anchor from this line:

```
def extract_title_and_anchor(header):    header = " ".join(header.split(" ")[1:])    title = header.split("[")[0]    anchor = header.split("(")[1].split(" ")[0]    return title, anchor
```

And assigned each block of text or code to the appropriate section.

Initially, I also tried splitting the text blocks into paragraphs, hypothesizing that because a section may contain information about many different topics, the embedding for that entire section may not be similar to an embedding for a text prompt concerned with only one of those topics. This approach, however, resulted in top matches for most search queries disproportionately being single line paragraphs, which turned out to not be terribly informative as search results.

> _Check out the accompanying_ [_GitHub repo_][25] _for the implementation of these methods that you can try out on your own docs!_

## Embedding text and code blocks with OpenAI

With documents converted, processed, and split into strings, I generated an embedding vector for each of these blocks. Because large language models are flexible and generally capable by nature, I decided to treat both text blocks and code blocks on the same footing as pieces of text, and to embed them with the same model.

I used OpenAI’s [text-embedding-ada-002 model][26] because it is easy to work with, achieves the highest performance out of all of OpenAI’s embedding models (on the [BEIR benchmark][27]), and is also the cheapest. It’s so cheap in fact ($0.0004/1K tokens) that generating all of the embeddings for the FiftyOne docs only cost a few cents! As OpenAI themselves put it, “We recommend using text-embedding-ada-002 for nearly all use cases. It’s better, cheaper, and simpler to use.”

With this embedding model, you can generate a 1536-dimensional vector representing any input prompt, up to 8,191 tokens (approximately 30,000 characters).

To get started, you need to create an OpenAI account, generate an API key at [https://platform.openai.com/account/api-keys][28], export this API key as an environment variable with:

```
export OPENAI_API_KEY="<MY_API_KEY>"
```

You will also need to install the [openai Python library][29]:

```
pip install openai
```

I wrote a wrapper around OpenAI’s API that takes in a text prompt and returns an embedding vector:

```
MODEL = "text-embedding-ada-002"def embed_text(text):    response = openai.Embedding.create(        input=text,        model=MODEL    )    embeddings = response['data'][0]['embedding']    return embeddings
```

To generate embeddings for all of our docs, we just apply this function to each of the subsections — text and code blocks — across all of our docs.

## Creating a Qdrant vector index

With embeddings in hand, I created a vector index to search against. I chose to use Qdrant for the same reasons we chose to add native Qdrant support to FiftyOne: it’s open source, free, and easy to use.

To get started with Qdrant, you can pull a pre-built Docker image and run the container:

```
docker pull qdrant/qdrantdocker run -d -p 6333:6333 qdrant/qdrant
```

Additionally, you will need to install the Qdrant Python client:

```
pip install qdrant-client
```

I created the Qdrant collection:

```
import qdrant_client as qcimport qdrant_client.http.models as qmodelsclient = qc.QdrantClient(url="localhost")METRIC = qmodels.Distance.DOTDIMENSION = 1536COLLECTION_NAME = "fiftyone_docs"def create_index():    client.recreate_collection(    collection_name=COLLECTION_NAME,    vectors_config = qmodels.VectorParams(            size=DIMENSION,            distance=METRIC,        )    )
```

I then created a vector for each subsection (text or code block):

```
import uuiddef create_subsection_vector(    subsection_content,    section_anchor,    page_url,    doc_type    ):    vector = embed_text(subsection_content)    id = str(uuid.uuid1().int)[:32]    payload = {        "text": subsection_content,        "url": page_url,        "section_anchor": section_anchor,        "doc_type": doc_type,        "block_type": block_type    }    return id, vector, payload
```

For each vector, you can provide additional context as part of the [payload][30]. In this case, I included the URL (and anchor) where the result can be found, the _type_ of document, so the user can specify if they want to search through all of the docs, or just certain types of docs, and the contents of the string which generated the embedding vector. I also added the block type (text or code), so if the user is looking for a code snippet, they can tailor their search to that purpose.

Then I added these vectors to the index, one page at a time:

```
def add_doc_to_index(subsections, page_url, doc_type, block_type):    ids = []    vectors = []    payloads = []        for section_anchor, section_content in subsections.items():        for subsection in section_content:            id, vector, payload = create_subsection_vector(                subsection,                section_anchor,                page_url,                doc_type,                block_type            )            ids.append(id)            vectors.append(vector)            payloads.append(payload)        ## Add vectors to collection    client.upsert(        collection_name=COLLECTION_NAME,        points=qmodels.Batch(            ids = ids,            vectors=vectors,            payloads=payloads        ),    )
```

## Querying the index

Once the index has been created, running a search on the indexed documents can be accomplished by embedding the query text with the same embedding model, and then searching the index for similar embedding vectors. With a Qdrant vector index, a basic query can be performed with the Qdrant client’s `search()` command.

To make my company’s docs searchable, I wanted to allow users to filter by section of the docs, as well as by the type of block that was encoded. In the parlance of vector search, filtering results while still ensuring that a predetermined number of results (specified by the `top_k` argument) will be returned is referred to as _pre-filtering_.

To achieve this, I wrote a programmatic filter:

```
def _generate_query_filter(query, doc_types, block_types):    """Generates a filter for the query.    Args:        query: A string containing the query.        doc_types: A list of document types to search.        block_types: A list of block types to search.    Returns:        A filter for the query.    """    doc_types = _parse_doc_types(doc_types)    block_types = _parse_block_types(block_types)    _filter = models.Filter(        must=[            models.Filter(                should= [                    models.FieldCondition(                        key="doc_type",                        match=models.MatchValue(value=dt),                    )                for dt in doc_types                ],                    ),            models.Filter(                should= [                    models.FieldCondition(                        key="block_type",                        match=models.MatchValue(value=bt),                    )                for bt in block_types                ]              )        ]    )    return _filter
```

The internal `_parse_doc_types()` and `_parse_block_types()` functions handle cases where the argument is string or list-valued, or is None.

Then I wrote a function `query_index()` that takes the user’s text query, pre-filters, searches the index, and extracts relevant information from the payload. The function returns a list of tuples of the form `(url, contents, score)`, where the score indicates how good of a match the result is to the query text.

```
def query_index(query, top_k=10, doc_types=None, block_types=None):    vector = embed_text(query)    _filter = _generate_query_filter(query, doc_types, block_types)        results = CLIENT.search(        collection_name=COLLECTION_NAME,        query_vector=vector,        query_filter=_filter,        limit=top_k,        with_payload=True,        search_params=_search_params,    )    results = [        (            f"{res.payload['url']}#{res.payload['section_anchor']}",            res.payload["text"],            res.score,        )        for res in results    ]    return results
```

## Writing the search wrapper

The final step was providing a clean interface for the user to semantically search against these “vectorized” docs.

I wrote a function `print_results()`, which takes the query, results from `query_index()`, and a `score` argument (whether or not to print the similarity score), and prints the results in an easy to interpret way. I used the [rich][31] Python package to format hyperlinks in the terminal so that when working in a terminal that supports hyperlinks, clicking on the hyperlink will open the page in your default browser. I also used [webbrowser][32] to automatically open the link for the top result, if desired.

![](https://miro.medium.com/v2/resize:fit:700/1*l05snNlGxtVd4LIFLG_deg.gif)

Display search results with rich hyperlinks. Image courtesy of author.

For Python-based searches, I created a class `FiftyOneDocsSearch` to encapsulate the document search behavior, so that once a `FiftyOneDocsSearch` object has been instantiated (potentially with default settings for search arguments):

```
from fiftyone.docs_search import FiftyOneDocsSearchfosearch = FiftyOneDocsSearch(open_url=False, top_k=3, score=True)
```

You can search within Python by calling this object. To query the docs for “How to load a dataset”, for instance, you just need to run:

```
fosearch(“How to load a dataset”)
```

![](https://miro.medium.com/v2/resize:fit:700/1*vp7HRYNYuiZSSbgqDj9aBw.gif)

Semantically search your company’s docs within a Python process. Image courtesy of author.

I also used [argparse][33] to make this docs search functionality available via the command line. When the package is installed, the docs are CLI searchable with:

```
fiftyone-docs-search query "<my-query>" <args 
```

Just for fun, because `fiftyone-docs-search query` is a bit cumbersome, I added an alias to my `.zsrch` file:

```
alias fosearch='fiftyone-docs-search query'
```

With this alias, the docs are searchable from the command line with:

```
fosearch "<my-query>" args
```

## Conclusion

Coming into this, I already fashioned myself a power user of my company’s open source Python library, FiftyOne. I had written many of the docs, and I had used (and continue to use) the library on a daily basis. But the process of turning our docs into a searchable database forced me to understand our docs on an even deeper level. It’s always great when you’re building something for others, and it ends up helping you as well!

Here’s what I learned:

-   **Sphinx RST is cumbersome**: it makes beautiful docs, but it is a bit of a pain to parse
-   **Don’t go crazy with preprocessing:** OpenAI’s text-embeddings-ada-002 model is great at understanding the meaning behind a text string, even if it has slightly atypical formatting. Gone are the days of stemming and painstakingly removing stop words and miscellaneous characters.
-   **Small semantically meaningful snippets are best**: break your documents up into the smallest possible meaningful segments, and retain context. For longer pieces of text, it is more likely that overlap between a search query and a part of the text in your index will be obscured by less relevant text in the segment. If you break the document up too small, you run the risk that many entries in the index will contain very little semantic information.
-   **Vector search is powerful**: with minimal lift, and without any fine-tuning, I was able to dramatically enhance the searchability of our docs. From initial estimates, it appears that this improved docs search is more than twice as likely to return relevant results than the old keyword search approach. Furthermore, the semantic nature of this vector search approach means that users can now search with arbitrarily phrased, arbitrarily complex queries, and are guaranteed to get the specified number of results.

If you find yourself (or others) constantly digging or sifting through treasure troves of documentation for specific kernels of information, I encourage you to adapt this process for your own use case. You can modify this to work for your personal documents, or your company’s archives. And if you do, I guarantee you’ll walk away from the experience seeing your documents in a new light!

Here are a few ways you could extend this for your own docs!

-   [Hybrid search][34]: combine vector search with traditional keyword search
-   Go global: Use [Qdrant Cloud][35] to store and query the collection in the cloud
-   Incorporate web data: use [requests][36] to download HTML directly from the web
-   Automate updates: use [Github Actions][37] to trigger recomputation of embeddings whenever the underlying docs change
-   Embed: wrap this in a Javascript element and drop it in as a replacement for a traditional search bar

All code used to build the package is open source, and can be found in the [voxel51/fiftyone-docs-search][38] repo.

[1]: https://medium.com/@jacob_marks?source=post_page-----4f2d34bd8736--------------------------------
[2]: https://towardsdatascience.com/?source=post_page-----4f2d34bd8736--------------------------------
[3]: https://github.com/voxel51/fiftyone
[4]: https://towardsdatascience.com/how-i-turned-my-companys-docs-into-a-searchable-database-with-openai-4f2d34bd8736#eb87
[5]: https://towardsdatascience.com/how-i-turned-my-companys-docs-into-a-searchable-database-with-openai-4f2d34bd8736#8ed1
[6]: https://towardsdatascience.com/how-i-turned-my-companys-docs-into-a-searchable-database-with-openai-4f2d34bd8736#1a17
[7]: https://towardsdatascience.com/how-i-turned-my-companys-docs-into-a-searchable-database-with-openai-4f2d34bd8736#34d3
[8]: https://towardsdatascience.com/how-i-turned-my-companys-docs-into-a-searchable-database-with-openai-4f2d34bd8736#87c5
[9]: https://towardsdatascience.com/how-i-turned-my-companys-docs-into-a-searchable-database-with-openai-4f2d34bd8736#9d79
[10]: https://github.com/voxel51/fiftyone-docs-search
[11]: https://github.com/openai/openai-python
[12]: https://github.com/qdrant/qdrant_client
[13]: https://qdrant.tech/
[14]: https://qdrant.tech/
[15]: https://docs.voxel51.com/
[16]: https://pypi.org/project/requests/
[17]: https://beautiful-soup-4.readthedocs.io/en/latest/
[18]: https://www.sphinx-doc.org/en/master/
[19]: https://sublime-and-sphinx-guide.readthedocs.io/en/latest/tables.html#list-table-directive
[20]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#grid-tables
[21]: https://pypi.org/project/markdownify/
[22]: https://python.langchain.com/en/latest/index.html
[23]: https://python.langchain.com/en/latest/modules/indexes/document_loaders.html
[24]: https://python.langchain.com/en/latest/modules/indexes/text_splitters.html
[25]: https://github.com/voxel51/fiftyone-docs-search
[26]: https://platform.openai.com/docs/guides/embeddings/embedding-models
[27]: https://arxiv.org/pdf/2104.08663.pdf
[28]: https://platform.openai.com/account/api-keys
[29]: https://github.com/openai/openai-python
[30]: https://qdrant.tech/documentation/payload/
[31]: https://rich.readthedocs.io/en/stable/introduction.html
[32]: https://docs.python.org/3/library/webbrowser.html
[33]: https://docs.python.org/3/library/argparse.html
[34]: https://www.pinecone.io/learn/hybrid-search-intro/
[35]: https://cloud.qdrant.io/
[36]: https://pypi.org/project/requests/
[37]: https://docs.github.com/en/actions
[38]: https://github.com/voxel51/fiftyone-docs-search