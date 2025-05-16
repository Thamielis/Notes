---
created: 2022-03-11T13:28:21 (UTC +01:00)
tags: []
source: https://www.der-windows-papst.de/2019/08/16/ordnerstruktur-uebertragen/
author: 
---

# Ordnerstruktur übertragen - Der Windows Papst - IT Blog Walter

> ## Excerpt
> Mit diesen beiden Skripten exportieren und legen die Ordnerstruktur auf ein neues Laufwerk an. Gerade bei Dateimigration sehr willkommen.

---
### Ordnerstruktur auf ein anderes Laufwerk übertragen

Mit diesen beiden Skripten exportieren und legen wir eine Ordnerstruktur neu an. Das Ganze funktioniert auch mit Netzwerkpfaden.

Die Ordnerstruktur bis zur 10. Ebene exportieren und den Pfad aus dem Export entfernen:

Get-ChildItem I:\\Test -Recurse -Directory -Depth 10 | Select-Object -Property FullName | ConvertTo-Csv -NoTypeInformation | % {$\_.Replace(‘I:\\’,”)} | % {$\_.Replace(‘”‘,”)} | Out-File I:\\Path.csv

[![Powershell Dateistruktur exportieren](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Dateistruktur-exportieren-300x78.png "Powershell Dateistruktur exportieren")](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Dateistruktur-exportieren.png)

[![Powershell Export Directory Structure](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Export-Directory-Structure-300x189.png "Powershell Export Directory Structure")](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Export-Directory-Structure.png)

Danach legen wir die exportierte Ordnerstruktur wieder an:

$Ordners = Get-Content “I:\\Path.csv” -Encoding UTF8  
ForEach ($Ordner in $Ordners)  
{  
$NewPath = Join-Path “D:\\” -childpath $Ordner  
New-Item $NewPath -type directory  
}

[![Powershell Dateistruktur anlegen](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Dateistruktur-anlegen-300x94.png "Powershell Dateistruktur anlegen")](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Dateistruktur-anlegen.png)

[![Powershell Create Directory Structure](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Create-Directory-Structure-300x128.png "Powershell Create Directory Structure")](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Powershell-Create-Directory-Structure.png)

[Ordner Strukturen übertragen](https://www.der-windows-papst.de/wp-content/uploads/2019/08/Ordner-Strukturen-%C3%BCbertragen.zip)
