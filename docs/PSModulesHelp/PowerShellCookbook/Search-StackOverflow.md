Search-StackOverflow
--------------------

### Synopsis
Searches Stack Overflow for PowerShell questions that relate to your
search term, and provides the link to the accepted answer.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Search-StackOverflow upload ftp
Searches StackOverflow for questions about how to upload FTP files
```
> EXAMPLE 2

```PowerShell
$answers = Search-StackOverflow.ps1 upload ftp
PS > $answers | Out-GridView -PassThru | Foreach-Object { start $_ }
Launches Out-GridView with the answers from a search. Select the URLs
that you want to launch, and then press OK. PowerShell then launches
your default web brower for those URLs.
```

---

### Syntax
```PowerShell
Search-StackOverflow [<CommonParameters>]
```
