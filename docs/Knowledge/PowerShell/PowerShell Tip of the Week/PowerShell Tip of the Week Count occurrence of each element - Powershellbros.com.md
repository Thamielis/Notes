![occurrence](PowerShell%20Tip%20of%20the%20Week%20Count%20occurrence%20of%20each%20element%20-%20Powershellbros.com/occurrence.png)

How to count the occurrence of each element. Today I would like to share a few examples describing how it can be done. To do this we can use [Group-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/group-object?view=powershell-6) cmdlet.

**Count the occurrence**

The `Group-Object` cmdlet displays objects in groups based on the value of a specified property. `Group-Object`returns a table with one row for each property value and a column that displays the number of items with that value.

**Example:**

Get unique [processes](https://www.powershellbros.com/tag/process/) count:

[![occurrence](PowerShell%20Tip%20of%20the%20Week%20Count%20occurrence%20of%20each%20element%20-%20Powershellbros.com/get-process-count.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/get-process-count.png?ssl=1)

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-Process</code> <code>| </code><code>Group-Object</code> <code>-NoElement</code> <code>| </code><code>Select-Object</code> <code>name,count&nbsp; | Sort count</code> <code>-Descending</code> <code>-Unique</code></p></div></td></tr></tbody></table>

**Example:**

Get files recursively and count occurrence. Display count greater than 1:

[![occurrence](PowerShell%20Tip%20of%20the%20Week%20Count%20occurrence%20of%20each%20element%20-%20Powershellbros.com/get-files-count.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/get-files-count.png?ssl=1)

<table><tbody><tr><td><p>1</p><p>2</p></td><td><div><p><code>$Files</code> <code>= </code><code>Get-ChildItem</code> <code>-Path</code> <code>"c:\users\pawel.janowicz\desktop"</code> <code>-Recurse</code></p><p><code>$Files</code> <code>| </code><code>Group-Object</code> <code>-NoElement</code> <code>| </code><code>Select-Object</code> <code>name,count | Sort count</code> <code>-Descending</code> <code>| where {</code><code>$_</code><code>.count </code><code>-gt</code> <code>1}</code></p></div></td></tr></tbody></table>

**Example:**

Get location count for [currently locked users:](https://www.powershellbros.com/get-lockout-source-for-currently-locked-users/)

[![occurrence](PowerShell%20Tip%20of%20the%20Week%20Count%20occurrence%20of%20each%20element%20-%20Powershellbros.com/location-count.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/location-count.png?ssl=1)

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p></td><td><div><p><code>$LockedUsers</code> <code>= @()</code></p><p><code>Search-ADAccount</code> <code>-LockedOut</code> <code>| select</code> <code>-first</code> <code>100 | </code><code>foreach</code><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$City</code> <code>= </code><code>$Object</code> <code>= </code><code>$Null</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$City</code> <code>= (</code><code>Get-ADUser</code> <code>-Identity</code> <code>$_</code><code>.name</code> <code>-Properties</code> <code>City).City</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code> <code>= </code><code>New-Object</code> <code>PSObject</code> <code>-Property</code> <code>(</code><code>[ordered]</code><code>@{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = </code><code>$_</code><code>.name</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Locked&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = </code><code>$_</code><code>.lockedout</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Location&nbsp;&nbsp;&nbsp;&nbsp; = </code><code>$City</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>UPN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = </code><code>$_</code><code>.UserPrincipalName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>})</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$LockedUsers</code> <code>+= </code><code>$Object</code></p><p><code>}</code></p><p><code>$LocationCount</code> <code>= </code><code>$LockedUsers</code><code>.location | </code><code>Group-Object</code> <code>-NoElement</code> <code>| </code><code>Select-Object</code> <code>name,count | Sort count</code> <code>-Descending</code></p><p><code>$LocationCount</code></p></div></td></tr></tbody></table>

**Example:**

Get events from remote machines and count the occurrence of event IDs and machine names:

[![occurrence](PowerShell%20Tip%20of%20the%20Week%20Count%20occurrence%20of%20each%20element%20-%20Powershellbros.com/get-events-count.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/get-events-count.png?ssl=1)

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p></td><td><div><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Servers</code> <code>= </code><code>Get-Content</code> <code>-path</code> <code>"D:\scripts\Input.txt"</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Results</code> <code>= @()</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Results</code> <code>= </code><code>Invoke-Command</code> <code>-cn</code> <code>$Servers</code> <code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$filter</code> <code>= @{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Logname = </code><code>'System'</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>ID = 142,139,35,38,24,29,50</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Get-WinEvent</code> <code>-FilterHashtable</code> <code>$filter</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} | select MachineName,TimeCreated,ID,Message</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Results</code><code>.ID | </code><code>Group-Object</code> <code>-NoElement</code> <code>| </code><code>Select-Object</code> <code>name,count | Sort count</code> <code>-Descending</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Results</code><code>.MachineName | </code><code>Group-Object</code> <code>-NoElement</code> <code>| </code><code>Select-Object</code> <code>name,count | Sort count</code> <code>-Descending</code></p></div></td></tr></tbody></table>

I hope that this was informative for you 🙂