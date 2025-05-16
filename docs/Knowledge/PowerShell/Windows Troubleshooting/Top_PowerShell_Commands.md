
# The Top 10 PowerShell Commands Every Sysadmin Should Know

## 1. Get-Help
`Get-Help <cmdlet_name>` provides information about cmdlets, parameters, aliases, and includes helpful examples.

## 2. Get-Command
`Get-Command` returns all cmdlets, functions, and aliases installed on the computer. Use filters to narrow down results, e.g., `Get-Command -Name *certificate*`.

## 3. Get-Member
`<cmdlet_name> | Get-Member` inspects objects to identify their methods and properties. Example: `Get-Date | Get-Member`.

## 4. Out-File
`Get-Process | Out-File C:\Temp\processes.txt` saves PowerShell output to a text file.

## 5. Export-Csv
`Get-Process | Select-Object -Property ID, ProcessName | Export-Csv C:\CSV\processes.csv` exports data to a CSV file.

## 6. Get-ChildItem
`Get-ChildItem <folder_name>` returns all items in a specified directory. Use `-Recurse` to include subdirectories.

## 7. Out-GridView
`<command> | Out-GridView` sends output to a GUI window for interaction.

## 8. Invoke-Item
`Invoke-Item <item_path>` launches items using the default file association.

## 9. Foreach
`foreach ($<item> in $<collection>){<statement list>}` iterates through a collection of items, performing actions.

## 10. If statements
`if ($<condition>){ <function to perform if the condition is true> }` executes logic based on conditions being met.
