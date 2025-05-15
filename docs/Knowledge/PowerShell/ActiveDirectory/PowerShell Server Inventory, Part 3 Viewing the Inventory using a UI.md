# PowerShell Server Inventory, Part 3: Viewing the Inventory using a UI

> This post is part 3 in a 3 part series on building your own server inventory system using PowerShell. Staging the SQL database and tables (Part 1) Collecting server data and pushing to the SQL data…

`Function` `Invoke-ExcelReport` `{`

`$Script:ExcelReports``.Clear()`

`$Return` `=` `$ExcelReport``.Invoke()`

`If` `(``$Return` `-AND` `$Script:ExcelReports``.Count` `-gt` `0) {`

`$UIHash``.ProgressBar.Maximum =` `$ExcelReports``.Count`

`$newRunspace` `=``[runspacefactory]``::CreateRunspace()`

`$newRunspace``.ApartmentState =` `"STA"`

`$newRunspace``.ThreadOptions =` `"ReuseThread"`

`$newRunspace``.Open()`

`$newRunspace``.SessionStateProxy.SetVariable(``"uiHash"``,``$uiHash``)`

`$newRunspace``.SessionStateProxy.SetVariable(``"ExcelReports"``,``$ExcelReports``)`

`$newRunspace``.SessionStateProxy.SetVariable(``"ExcludeProperties"``,``$ExcludeProperties``)`

`$newRunspace``.SessionStateProxy.SetVariable(``"ReportPath"``,``$ReportPath``)`

`$newRunspace``.SessionStateProxy.SetVariable(``"Letters"``,``$Letters``)`

`$PowerShell` `=` `[PowerShell]``::Create().AddScript({`

`Add-Type` `–assemblyName System.Windows.Forms`

`Function` `Show-ReportLocation` `{`

`Param``(``$ReportLocation``)`

`$title` `=` `"Report Completed"`

`$message` `=` `"The report has been saved to: $ReportLocation"`

`$button` `=` `[System.Windows.Forms.MessageBoxButtons]``::OK`

`$icon` `=` `[Windows.Forms.MessageBoxIcon]``::Information`

`[windows.forms.messagebox]``::Show(``$message``,``$title``,``$button``,``$icon``)`

`}`

`Function` `ConvertTo-MultidimensionalArray` `{`

`[``cmdletbinding``()]`

`Param` `(`

`[``parameter``(``ValueFromPipeline``)]`

`[object]``$InputObject` `= (``Get-Process``),`

`[``parameter``()]`

`[``ValidateSet``(``'AliasProperty'``,``'CodeProperty'``,``'ParameterizedProperty'``,``'NoteProperty'``,``'Property'``,``'ScriptProperty'``,``'All'``)]`

`[string[]]``$MemberType` `=` `'Property'``,`

`[string[]]``$PropertyOrder`

`)`

`Begin` `{`

`If` `(``-NOT` `$PSBoundParameters``.ContainsKey(``'Data'``)) {`

`Write-Verbose` `'Pipeline'`

`$isPipeline` `=` `$True`

`}` `Else` `{`

`Write-Verbose` `'Not Pipeline'`

`$isPipeline` `=` `$False`

`}`

`$List` `=` `New-Object` `System.Collections.ArrayList`

`$PSBoundParameters``.GetEnumerator() |` `ForEach` `{`

`Write-Verbose` `"$($_)"`

`}`

`}`

`Process` `{`

`If` `(``$isPipeline``) {`

`$null` `=` `$List``.Add(``$InputObject``)`

`}`

`}`

`End` `{`

`If` `(``$isPipeline``) {`

`$InputObject` `=` `$List`

`}`

`$rowCount` `=` `$InputObject``.count`

`If` `(``$PSBoundParameters``.ContainsKey(``'PropertyOrder'``)){`

`$columns` `=` `$PropertyOrder`

`}`

`Else` `{`

`$columns` `=` `$InputObject` `|` `Get-Member` `-MemberType` `$MemberType` `| Select` `-Expand` `Name`

`}`

`$columnCount` `=` `$columns``.count`

`$MultiArray` `=` `New-Object` `-TypeName` `'string[,]'` `-ArgumentList` `(``$rowCount``+1),``$columnCount`

`$col``=0`

`$columns` `|` `ForEach` `{`

`$MultiArray``[0,``$col``++] =` `$_`

`}`

`$col``=0`

`$row``=1`

`For` `(``$i``=0;``$i` `-lt` `$rowCount``;``$i``++) {`

`$columns` `|` `ForEach` `{`

`$MultiArray``[``$row``,``$col``++] =` `$InputObject``[``$i``].``$_`

`}`

`$row``++`

`$col``=0`

`}`

`,``$MultiArray`

`}`

`}`

`$uiHash``.Window.Dispatcher.Invoke(``"Background"``,``[action]``{`

`[System.Windows.Input.Mouse]``::OverrideCursor =` `[System.Windows.Input.Cursors]``::Wait`

`$UIHash``.ExportToExcel.IsEnabled =` `$False`

`$UIHash``.Filter_btn.IsEnabled =` `$False`

`$UIHash``.ClearFilter_btn.IsEnabled =` `$False`

`})`

`$excel` `=` `New-Object` `-ComObject` `excel.application`

`$workbook` `=` `$excel``.Workbooks.Add()`

`$excel``.Visible =` `$False`

`$excel``.DisplayAlerts =` `$False`

`$ToCreate` `=` `$Script:ExcelReports``.Count - 3`

`If` `(``$ToCreate` `-gt` `0) {`

`1..``$ToCreate` `|` `ForEach` `{`

`[void]``$workbook``.Worksheets.Add()`

`}`

`}`

`ElseIf` `(``$ToCreate` `-lt` `0) {`

`1..(``[math]``::Abs(``$ToCreate``)) |` `ForEach` `{`

`Try {`

`$Workbook``.worksheets.item(2).Delete()`

`}`

`Catch {}`

`}`

`}`

`$i` `= 1`

`ForEach` `(``$Table` `in` `$Script:ExcelReports``) {`

`$uiHash``.Window.Dispatcher.Invoke(``"Background"``,``[action]``{`

`$uiHash``.status_txt.text =` `"Generating Report: $(($Table).SubString(2))"`

`$UIHash``.ProgressBar.Value++`

`})`

`$uiHash``.Window.Dispatcher.Invoke(``"Background"``,``[action]``{`

`$Global:DataGrid` `=` `$UIHash``.``"$($Table)_Datagrid"`

`})`

`$Properties` `=` `$DataGrid``.ItemsSource[0].psobject.properties``|Where``{`

`$ExcludeProperties` `-notcontains` `$_``.Name`

`} |` `Select-Object` `-ExpandProperty` `Name`

`$RowCount` `=` `$DataGrid``.ItemsSource.Count+1`

`$ColumnCount` `= (``$DataGrid``.ItemsSource |` `Get-Member` `-MemberType` `Property).Count`

`$uiHash``.Window.Dispatcher.Invoke(``"Background"``,``[action]``{`

`$Global:__Data` `=` `$DataGrid``.ItemsSource`

`})`

`$Data` `=` `$__Data``|ConvertTo``-MultidimensionalArray` `-PropertyOrder` `$Properties`

`$serverInfoSheet` `=` `$workbook``.Worksheets.Item(``$i``)`

`[void]``$serverInfoSheet``.Activate()`

`$serverInfoSheet``.Name =` `$Table``.Substring(2)`

`$Range` `=` `$serverInfoSheet``.Range(``"A1"``,``"$($Letters[$ColumnCount])$($RowCount)"``)`

`$Range``.Value2 =` `$Data`

`$UsedRange` `=` `$serverInfoSheet``.UsedRange`

`$UsedRange``.Value2 =` `$UsedRange``.Value2`

`[void]``$workbook``.ActiveSheet.ListObjects.add( 1,``$workbook``.ActiveSheet.UsedRange,0,1)`

`[void]``$usedRange``.EntireColumn.AutoFit()`

`[void]``$usedRange``.EntireRow.AutoFit()`

`$i``++`

`}`

`Write-Verbose` `"Saving to $($Script:ReportPath)"`

`$workbook``.SaveAs((``$Script:ReportPath``)` `-f` `$pwd``)`

`$excel``.Quit()`

`[System.Runtime.InteropServices.Marshal]``::ReleaseComObject(``[System.__ComObject]``$excel``) |` `Out-Null`

`[gc]``::Collect()`

`[gc]``::WaitForPendingFinalizers()`

`Show-ReportLocation` `-ReportLocation` `$Script:ReportPath`

`$uiHash``.Window.Dispatcher.Invoke(``"Background"``,``[action]``{`

`[System.Windows.Input.Mouse]``::OverrideCursor =` `$Null`

`$UIHash``.ExportToExcel.IsEnabled =` `$True`

`$UIHash``.Filter_btn.IsEnabled =` `$True`

`$UIHash``.ClearFilter_btn.IsEnabled =` `$True`

`$uiHash``.status_txt.text =` `$Null`

`$UIHash``.ProgressBar.Value = 0`

`})`

`})`

`$PowerShell``.Runspace =` `$newRunspace`

`[void]``$Jobs``.Add((`

`[pscustomobject]``@{`

`PowerShell =` `$PowerShell`

`Runspace =` `$PowerShell``.BeginInvoke()`

`}`

`))`

`}`

`}`


[Source](https://learn-powershell.net/2017/05/09/powershell-server-inventory-part-3-viewing-the-inventory-using-a-ui/)