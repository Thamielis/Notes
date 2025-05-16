---
created: 2022-03-10T13:07:08 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/export-csv/
author: 
---

# Export-Csv: Converting Objects to CSV Files

> ## Excerpt
> Learn to send information from Powershell using Export-CSV and create CSV files to feed reports, send to databases and more.

---
If you need to send information from PowerShell to a CSV file, the Export-CSV cmdlet is here to help. This cmdlet saves admins so much time wrangling loose text into a structured format. Instead of messing around with Excel, we can instead use PowerShell to create CSV files.

You can create CSV files to feed reports, send to databases and more from any PowerShell object with the `Export-Csv` cmdlet.

The CSV format is merely a comma-separated list of rows stored as a text file. Since it is just a text file, we _could_ technically just use a generic text file command like [`Set-Content`](https://adamtheautomator.com/powershell-write-to-file/) to do the job. To use a generic command though would require building out the necessary CSV structure ourselves. Why do that when we have a CSV export command already in `Export-Csv` to send CSV output to a file?

CSV files need a specific structure. This cmdlet’s ability to understand, read and transform information to CSV files is what makes this PowerShell cmdlet so handy.

-   [Objects -eq CSV Rows](https://adamtheautomator.com/export-csv/#Objects_-eq_CSV_Rows "Objects -eq CSV Rows")
-   [Useful Parameters](https://adamtheautomator.com/export-csv/#Useful_Parameters "Useful Parameters")
-   [Dealing with Quotation Marks](https://adamtheautomator.com/export-csv/#Dealing_with_Quotation_Marks "Dealing with Quotation Marks")
-   [Summary](https://adamtheautomator.com/export-csv/#Summary "Summary")

## Objects -eq CSV Rows

The `Export-Csv` cmdlet has a single purpose; to save PowerShell objects to a CSV file.

Let’s say you have an object with two properties called `foo` and `bar`.  Each of these properties has respective values of `1` and `2`.  When you send that object to `Export-Csv`, it will create a CSV file with two columns and a single row. You can then import the CSV contents and inspect what it looks like.

```powershell
PS> $testObject = [pscustomobject]@{'foo' = 1; 'bar' = 2}
PS> $testObject | Export-Csv -Path C:\TestObject.csv
PS> $testObject
foobar
1 2
PS> Import-Csv -Path C:\TestObject.csv
foobar
1  2
```

PowerShell essentially treats an object in memory and a CSV file the same! It also that my column labels are supposed to be headers. Exporting objects using this cmdlet is like saving the object to the file system. Using the generic text PowerShell command `[Get-Content](https://adamtheautomator.com/powershell-get-content/)`, we can inspect the raw text to see what the `Export-Csv` command exported.

```powershell
PS> Get-Content -Path C:\TestObject.csv

#TYPE System.Management.Automation.PSCustomObject
"foo","bar" "1","2"
```

Notice that the command uses the double quote around each row entry. This allows you to include fields with spaces as well.

## Useful Parameters

In Windows PowerShell 5.1, Export-CSV cmdlte the type of object that created the CSV file. If you’d rather now see this line, a popular parameter is `NoTypeInformation` which eliminates this line entirely.

If you work with many different CSV files or data sources, you might learn the hard way that Export-CSV overwrites existing files. No problem though if you’re using the `Append` parameter. The `Append` parameter allows you to add rows to the CSV rather than overwriting an existing file.

Another useful parameter is `Delimiter`. Occasionally, you may find yourself needing to create a CSV file that doesn’t use the usual list separator (comma) to separate fields. Instead, perhaps you need to create a file with a lot of data that uses tabs as separators or maybe even semicolons. The `Export-Csv` PowerShell cmdlet can help us out with these as well by specifying whatever delimiter we need.

```powershell
PS> $testObject | Export-Csv -Path C:\TestObject.csv -Delimiter "`t"
PS> Get-Content -Path C:\TestObject.csv

#TYPE System.Management.Automation.PSCustomObject
"foo"   "bar" "1"     "2"
```

## Dealing with Quotation Marks

When creating CSV rows, `Export-Csv` encloses all fields in quotation marks. In some situations, this might not be desirable. Unfortunately, there’s no way to prevent that. But, by using a little more code, you can make it happen.

Below you can see an example of creating the CSV file. Then, `Get-Content` reads the raw text file, replaces all double quotes in memory with nothing. Then `Set-Content` writes that information in memory back to disk.

```powershell
$testObject | Export-Csv -Path C:\TestObject.csv
(Get-Content -Path C:\TestObject.csv -Raw).replace('"','') | Set-Content -Path C:\TestObject.csv
```

## Summary

The `Export-Csv` cmdlet is a simple yet extremely useful tool for managing CSV data. It can understand the structure of a CSV data file and transform PowerShell objects into CSV rows.

I’m not about to go back to batch, or [VBScript where creating a CSV file](https://devblogs.microsoft.com/scripting/how-can-i-create-a-csv-file/%22) from an existing object required instantiating a FileSystemObject, creating a loop and a bunch of `Write()` methods!

This command is yet another great reason to start writing PowerShell code today!
