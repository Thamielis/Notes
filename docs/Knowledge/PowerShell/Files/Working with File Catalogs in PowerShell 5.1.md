---
created: 2025-04-17T17:00:37 (UTC +02:00)
tags: []
source: https://www.progress.com/blogs/working-with-file-catalogs-in-powershell-5.1
author: Adam Bertram
---

# Working with File Catalogs in PowerShell 5.1

---
![file-catalogs-in-powershell.jpg](https://www.progress.com/images/default-source/ipsblogposts/file-catalogs-in-powershell.jpg?sfvrsn=a78b676_4)

Working with lots of files all strewn about in different folders can sometimes prove troublesome. This is where PowerShell can help. Times like [data migrations](https://www.progress.com/moveit/moveit-cloud) can be especially hard when it's _critical_ that the information on the destination is _exactly_ as it were on the source system. Commands like **Copy-Item** work fine (if it doesn't throw an error) but what if you're moving files over the Internet or when it's _critical_ that the data is the same in the source as it is in the destination. In this case, it's important to be more diligent and _test_ to ensure both places look the same.

One way to confirm the source and destination locations are the same is to generate a hash for each file in the source and do the same in the destination. A command like **Get-FileHash** and a loop can do this.

```
PS&gt; Get-ChildItem -Path C:\Path | Get-FileHash
```

Once you've collected a hash for the source you'd then have to do the same for the destination _and_ then manually compare them. Luckily, there's an easier way to do this through a concept called file catalogs.

As of PowerShell v5.1, we now have multiple **FileCatalog** cmdlets that allow us to treat an entire folder as one and then compare that as such. This means no more checking hashes of individual files and then having to compare. Instead, we can now make this happen in three lines:

```
PS&gt; New-FileCatalog -Path C:\Source -CatalogFilePath C:\Source.cat -CatalogVersion 2.0<br>PS&gt; New-FileCatalog -Path C:\Destination -CatalogFilePath C:\Destination.cat -CatalogVersion 2.0<br>PS&gt; Test-FileCatalog -Path C:\Source -CatalogFilePath C:\Destination.cat
```

In the example above, I've created two file catalog (CAT files) and then tested to ensure that the contents of **C:\\Source** match the contents of the **Destination** catalog. If each folder's contents is the same **Test-FileCatalog** will return **Valid** but when different will display the file and the hashes that are different. For example, I've created the same text files in the folders **C:\\Source** and **C:\\Destination**. When the above example is run, it returned Valid. Now let's see what happens when I delete a file from the destination folder.

```
PS&gt; Remove-Item -Path C:\Destination\1.txt<br>PS&gt; New-FileCatalog -Path C:\Destination -CatalogFilePath C:\Destination.cat -CatalogVersion 2.0<br>PS&gt; Test-FileCatalog -Path C:\Source -CatalogFilePath C:\Destination.cat<br> <br>ValidationFailed
```

You can also use the **Detailed** parameter of **Test-FileCatalog** to get more information about the differences. Each of the file hashes stored in the catalog are part of the **CatalogItems** property, and each of the hashes in the path being compared will be in the PathItems property.

```
PS&gt; Test-FileCatalog -Path C:\Source -CatalogFilePath C:\Destination.cat -Detailed<br> <br> Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ValidationFailed<br> HashAlgorithm : SHA256<br> CatalogItems&nbsp; : {[1.txt, 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6], [54.txt, 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6],<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6]...}<br> PathItems&nbsp;&nbsp;&nbsp;&nbsp; : {[0.txt, 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6], [1.txt, 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6],<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6]...}<br> Signature&nbsp;&nbsp;&nbsp;&nbsp; : System.Management.Automation.Signature
```

Sometimes when creating a large file catalog, you may not want to check _all_ of the files. In that case, you can always use the **FilesToSkip** parameter on **Test-FileCatalog**. This excludes certain files from the comparison. **Test-FileCatalog -Path C:\\Source -CatalogFilePath C:\\Destination.cat -Detailed -FilesToSkip 0.txt,1.txt**

File catalogs are an excellent way to treat lots of files and folders as one unit. By creating file catalogs prior and after [a big copy/move](https://www.progress.com/moveit) and then immediately running **Test-FileCatalog**, you can be sure that what was in the source is also at the destination.
