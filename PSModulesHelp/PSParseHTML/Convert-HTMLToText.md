Convert-HTMLToText
------------------

### Synopsis
Converts HTML to text.

---

### Description

Converts HTML to text. Simple in it's form it extracts only Text from HTML, regardless of it's structure.

---

### Examples
> EXAMPLE 1

```PowerShell
$HTMLContentFormatted = @"
<html>
        <!-- HEADER -->
        <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1" name="viewport">
                <meta name="author">
                <meta content="2019-08-09 11:26:37" name="revised">
                <title>My title</title>
                <!-- CSS Default fonts START -->
                <link href="https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald" type="text/css" rel="stylesheet">
                <!-- CSS Default fonts END -->
                <!-- CSS Default fonts icons START -->
                <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" type="text/css" rel="stylesheet">
                <!-- CSS Default fonts icons END -->
        </head>
        <body>
                <div class="flexElement overflowHidden">
                        <table id="DT-hZRTQIVT" class="display compact">
                                <thead>
                                        <tr>
                                                <th>Name</th>
                                                <th class="none">Id</th>
                                                <th class="none">HandleCount</th>
                                                <th>WorkingSet</th>
                                        </tr>
                                </thead>
                                <tbody>
                                        <tr>
                                                <td>1Password</td>
                                                <td>22268</td>
                                                <td>1007</td>
                                                <td>87146496</td>
                                        </tr>
                                        <tr>
                                                <td>aesm_service</td>
                                                <td>25340</td>
                                                <td>189</td>
                                                <td>3948544</td>
                                        </tr>
                                </tbody>
                        </table>
                </div>
                <footer></footer>
                <!-- END FOOTER -->
        </body>
        <!-- END BODY -->
        <!-- FOOTER -->
</html>
"@
Convert-HTMLToText -Content $HTMLContentFormatted
```

---

### Parameters
#### **File**
Provide HTML file to be converted to PowerShell object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OutputFile**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Content**
Provide HTML content to be converted to PowerShell object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Url**

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[Uri]`|true    |named   |false        |Uri    |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-HTMLToText [-File <String>] [-OutputFile <String>] -Content <String> [<CommonParameters>]
```
```PowerShell
Convert-HTMLToText [-File <String>] [-OutputFile <String>] -Url <Uri> [<CommonParameters>]
```
