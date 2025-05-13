Get-OAIVectorStore
------------------

### Synopsis
Retrieves vector stores from the specified base URL.

---

### Description

The Get-OAIVectorStore function retrieves vector stores from the specified base URL. It supports various parameters such as limit, order, after, before, and raw output.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores/list](https://platform.openai.com/docs/api-reference/vector-stores/list)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIVectorStore -limit 10 -order desc
Retrieves the 10 most recent vector stores in descending order.
```

---

### Parameters
#### **limit**
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **order**
Sort order by the created_at timestamp of the objects. asc for ascending order and desc for descending order.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **after**
A cursor for use in pagination. after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **before**
A cursor for use in pagination. before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Raw**
Switch parameter. If specified, the function returns the raw response object. Otherwise, it returns only the data property of the response.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* The function returns an array of vector stores or the raw response object, depending on the value of the Raw parameter.

---

### Syntax
```PowerShell
Get-OAIVectorStore [[-limit] <Object>] [[-order] <Object>] [[-after] <Object>] [[-before] <Object>] [-Raw] [<CommonParameters>]
```
