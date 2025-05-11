Add-GitHubReleaseAsset
----------------------

### Synopsis
Upload a release asset

---

### Description

This endpoint makes use of [a Hypermedia relation](https://docs.github.com/rest/overview/resources-in-the-rest-api#hypermedia)
to determine which URL to access. The endpoint you call to upload release assets is specific to your release. Use the
`upload_url` returned in
the response of the [Create a release endpoint](https://docs.github.com/rest/releases/releases#create-a-release) to upload
a release asset.

You need to use an HTTP client which supports [SNI](http://en.wikipedia.org/wiki/Server_Name_Indication) to make calls to
this endpoint.

Most libraries will set the required `Content-Length` header automatically. Use the required `Content-Type` header to provide
the media type of the asset. For a list of media types, see
[Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml). For example:

`application/zip`

GitHub expects the asset data in its raw binary form, rather than JSON. You will send the raw binary content of the asset
as the request body. Everything else about the endpoint is the same as the rest of the API. For example,
you'll still need to pass your authentication to be able to upload an asset.

When an upstream failure occurs, you will receive a `502 Bad Gateway` status. This may leave an empty asset with a state
of `starter`. It can be safely deleted.

**Notes:**
* GitHub renames asset filenames that have special characters, non-alphanumeric characters, and leading or trailing periods.
The "[List release assets](https://docs.github.com/rest/releases/assets#list-release-assets)"
endpoint lists the renamed filenames. For more information and help, contact
[GitHub Support](https://support.github.com/contact?tags=dotcom-rest-api).
* To find the `release_id` query the
[`GET /repos/{owner}/{repo}/releases/latest` endpoint](https://docs.github.com/rest/releases/releases#get-the-latest-release).
* If you upload an asset with the same filename as another uploaded asset, you'll receive an error and must delete
the old file before you can re-upload the new asset.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-GitHubReleaseAsset -Owner 'octocat' -Repository 'hello-world' -ID '7654321' -FilePath 'C:\Users\octocat\Downloads\hello-world.zip'
Gets the release assets for the release with the ID '1234567' for the repository 'octocat/hello-world'.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |1       |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ID**
The unique identifier of the release.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |3       |false        |release_id|

#### **Name**
The name of the file asset.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Label**
An alternate short description of the asset. Used in place of the filename.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ContentType**
The content type of the asset.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **FilePath**
The path to the asset file.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |7       |false        |FullName|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

---

### Notes
[Upload a release asset](https://docs.github.com/rest/releases/assets#upload-a-release-asset)

---

### Syntax
```PowerShell
Add-GitHubReleaseAsset [-Owner] <String> [-Repository] <String> [-ID] <String> [[-Name] <String>] [[-Label] <String>] [[-ContentType] <String>] [-FilePath] <String> [[-Context] <Object>] [<CommonParameters>]
```
