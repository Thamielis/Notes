ConvertTo-NormalizedString
--------------------------

### Synopsis
Converts a string to a normalized string

---

### Description

Converts a string to a normalized string

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-NormalizedString -String "café"
```
> EXAMPLE 2

```PowerShell
"café" | ConvertTo-NormalizedString
```
> EXAMPLE 3

```PowerShell
ConvertTo-NormalizedString -String "café"
"café" | ConvertTo-NormalizedString
'Helène' | ConvertTo-NormalizedString
"Przemysław Kłys and Helène" | ConvertTo-NormalizedString
```
> EXAMPLE 4

```PowerShell
"äöüß" | ConvertTo-NormalizedString
ConvertTo-NormalizedString -String "café"
"café" | ConvertTo-NormalizedString
'Helène' | ConvertTo-NormalizedString
"Przemysław Kłys and Helène" | ConvertTo-NormalizedString
"kłys" | ConvertTo-NormalizedString
"ąęćśł" | ConvertTo-NormalizedString
"Michael Roßbach" | ConvertTo-NormalizedString
"öüóőúéáűí" | ConvertTo-NormalizedString
"ß" | ConvertTo-NormalizedString
"Un été de Raphaël" | ConvertTo-NormalizedString
("äâûê", "éèà", "ùçä") | ConvertTo-NormalizedString
"Fore ðære mærðe…" | ConvertTo-NormalizedString
"ABC-abc-ČŠŽ-čšž" | ConvertTo-NormalizedString
"Æ×Þ°±ß…" | ConvertTo-NormalizedString
```

---

### Parameters
#### **String**
The string to convert

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

#### **Simplify**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertTo-NormalizedString [[-String] <String[]>] [-Simplify] [<CommonParameters>]
```
