Get-OAIImageGeneration
----------------------

### Synopsis
Generates an image using the OpenAI API.

---

### Description

The Get-OAIImageGeneration function generates an image using the OpenAI API by sending a POST request to the '/images/generations' endpoint. It allows you to specify various parameters such as the prompt, model, number of generations, quality, response format, size, style, and user.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/images/create](https://platform.openai.com/docs/api-reference/images/create)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIImageGeneration -Prompt "Generate a beautiful landscape image"
Generates an image using the default parameters and the specified prompt.
```
> EXAMPLE 2

```PowerShell
Get-OAIImageGeneration -Prompt "Generate a cute cat image" -Model "cat-v1" -N 5 -Quality "high" -ResponseFormat "json"
Generates 5 high-quality cat images in JSON format using the specified prompt and model.
```

---

### Parameters
#### **Prompt**
Specifies the prompt for generating the image. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Model**
Specifies the model to use for generating the image. If not specified, the default model will be used.
Valid Values:

* dall-e-2
* dall-e-3

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **N**
The number of images to generate. Must be between 1 and 10. For dall-e-3, only n=1 is supported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Quality**
The quality of the image that will be generated. hd creates images with finer details and greater consistency across the image. This param is only supported for dall-e-3.
Valid Values:

* standard
* hd

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **ResponseFormat**
The format in which the generated images are returned. Must be one of url or b64_json. URLs are only valid for 60 minutes after the image has been generated.
Valid Values:

* url
* b64_json

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **Size**
The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024 for dall-e-2. Must be one of 1024x1024, 1792x1024, or 1024x1792 for dall-e-3 models.
Valid Values:

* 256x256
* 512x512
* 1024x1024
* 1792x1024
* 1024x1792

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **Style**
The style of the generated images. Must be one of vivid or natural. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images. This param is only supported for dall-e-3.
Valid Values:

* vivid
* natural

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **User**
Specifies the user for generating the image. If not specified, the default user will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **Show**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-OAIImageGeneration [-Prompt] <Object> [[-Model] <Object>] [[-N] <Object>] [[-Quality] <Object>] [[-ResponseFormat] <Object>] [[-Size] <Object>] [[-Style] <Object>] [[-User] <Object>] [-Show] [<CommonParameters>]
```
