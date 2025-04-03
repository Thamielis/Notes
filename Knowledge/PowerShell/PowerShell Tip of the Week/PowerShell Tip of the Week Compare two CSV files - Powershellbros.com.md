![](PowerShell%20Tip%20of%20the%20Week%20Compare%20two%20CSV%20files%20-%20Powershellbros.com/compare.png)

In this article I wanted to show you how to compare two CSV files using **Compare-Object** command. It might be useful if you run some scans on regular basis and want to check if they contains the same data.

##### Compare-Object

Script is based on Compare-Object cmdlet which compares two sets of objects. One set of objects is the “reference set,” and the other set is the “difference set.”

The result of the comparison indicates whether a property value appeared only in the object from the reference set (indicated by the <= symbol), only in the object from the difference set (indicated by the => symbol) or, if the IncludeEqual parameter is specified, in both objects (indicated by the == symbol).

For more information about this command please visit [Microsoft docs page](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/compare-object?view=powershell-6).

Lets compare two CSV files with users scans. We will check how many of them are in both files. To do this we need to specify side indicator `==` and we will compare **SamAccountName** column:

<table><tbody><tr><td><p>1</p><p>2</p></td><td><div><p><code>$Results</code> <code>= </code><code>Compare-Object</code>&nbsp; <code>$File1</code> <code>$File2</code> <code>-Property</code> <code>SamAccountName</code> <code>-IncludeEqual</code></p><p><code>$R</code><code>.sideindicator </code><code>-eq</code> <code>"=="</code></p></div></td></tr></tbody></table>

**Output:**

[![Compare-Object](PowerShell%20Tip%20of%20the%20Week%20Compare%20two%20CSV%20files%20-%20Powershellbros.com/Compare-Object.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2018/02/Compare-Object.png)

Compare-Object

**Final script:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p><p>28</p><p>29</p></td><td><div><p><code>$File1</code> <code>= </code><code>Import-Csv</code> <code>-Path</code> <code>"C:\Users\$env:username\Desktop\Files\Users 2018-02-01 12.55.02.csv"</code></p><p><code>$File2</code> <code>= </code><code>Import-Csv</code> <code>-Path</code> <code>"C:\Users\$env:username\Desktop\Files\Users 2018-02-03 07.55.00.csv"</code></p><p><code>$Results</code> <code>= </code><code>Compare-Object</code>&nbsp; <code>$File1</code> <code>$File2</code> <code>-Property</code> <code>SamAccountName</code> <code>-IncludeEqual</code></p><p><code>$Array</code> <code>= @()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code></p><p><code>Foreach</code><code>(</code><code>$R</code> <code>in</code> <code>$Results</code><code>)</code></p><p><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>If</code><code>( </code><code>$R</code><code>.sideindicator </code><code>-eq</code> <code>"=="</code> <code>)</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code> <code>= </code><code>[pscustomobject][ordered]</code> <code>@{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Username = </code><code>$R</code><code>.SamAccountName</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"Compare indicator"</code> <code>= </code><code>$R</code><code>.sideindicator</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Array</code> <code>+= </code><code>$Object</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>}</code></p><p><code>(</code><code>$Array</code> <code>| </code><code>sort-object</code> <code>username | </code><code>Select-Object</code> <code>*</code> <code>-Unique</code><code>).count</code></p><p><code>$Array</code></p></div></td></tr></tbody></table>