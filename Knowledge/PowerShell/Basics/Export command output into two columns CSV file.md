Recently I was looking for easy way to export output into two columns CSV file. Finding solution for this was a little bit difficult because some values of the properties were another objects or they were for example `data.table` types. Below you will find how to do this based on one of the ADFS module commands.

##### Get-AdfsRelyingPartyTrust

The **Get-ADFSRelyingPartyTrust** cmdlet retrieves the relying party trusts in the Federation Service. You can use this cmdlet with no parameters to get all relying party trust objects.

Normally when you want to get some specific relying party details you can query ADFS database by its identifier or name:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-AdfsRelyingPartyTrust</code> <code>-Name</code> <code>"Your Relying Party Name"</code></p></div></td></tr></tbody></table>

Output of this query will be displayed in formatted list. However if you want to export it to CSV file then each property from results will be saved as a separated column:

[![CSV1](Export%20command%20output%20into%20two%20columns%20CSV%20file%20-%20Powershellbros.com/CSV1.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/11/CSV1.png)

CSV1

I just wanted to create CSV file with two columns. One columns will be `"Property"` and the second one `"Value"`. Final output should look like this:

[![CSV2](Export%20command%20output%20into%20two%20columns%20CSV%20file%20-%20Powershellbros.com/CSV2.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2017/12/CSV2.png)

CSV2

**Final script:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p><p>28</p><p>29</p><p>30</p><p>31</p><p>32</p><p>33</p><p>34</p><p>35</p><p>36</p><p>37</p></td><td><div><p><code>$tabName</code> <code>= “RelyingParty”</code></p><p><code>$table</code> <code>= </code><code>New-Object</code> <code>system.Data.DataTable “</code><code>$tabName</code><code>”</code></p><p><code>$col1</code> <code>= </code><code>New-Object</code> <code>system.Data.DataColumn </code><code>"Property"</code><code>,(</code><code>[string]</code><code>)</code></p><p><code>$col2</code> <code>= </code><code>New-Object</code> <code>system.Data.DataColumn </code><code>"Value"</code><code>,(</code><code>[string]</code><code>)</code></p><p><code>$table</code><code>.columns.add(</code><code>$col1</code><code>)</code></p><p><code>$table</code><code>.columns.add(</code><code>$col2</code><code>)</code></p><p><code>$Server</code> <code>= </code><code>"ADFS01"</code></p><p><code>$RPDetails</code> <code>= </code><code>Invoke-Command</code> <code>$Server</code> <code>-ScriptBlock</code><code>{ </code><code>Get-AdfsRelyingPartyTrust</code> <code>-Name</code> <code>"Your Relying Party Name"</code> <code>}</code></p><p><code>Foreach</code> <code>(</code><code>$line</code> <code>in</code> <code>$RPDetails</code><code>)</code></p><p><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Foreach</code> <code>(</code><code>$property</code> <code>in</code> <code>((</code><code>$RPDetails</code><code>| </code><code>Get-Member</code> <code>-MemberType</code> <code>Property).name))</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Value</code> <code>= </code><code>$line</code><code>.</code><code>$property</code> <code>| </code><code>Out-String</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Value</code> <code>= </code><code>$Value</code><code>.Trim()</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$row</code> <code>= </code><code>$table</code><code>.NewRow()</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$row</code><code>.</code><code>"Property"</code> <code>= </code><code>$property</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$row</code><code>.</code><code>"Value"</code> <code>= </code><code>$Value</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$table</code><code>.Rows.Add(</code><code>$row</code><code>)</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>}</code></p><p><code>$table</code> <code>| </code><code>Out-GridView</code></p><p><code>$table</code> <code>| </code><code>Export-Csv</code> <code>-Path</code> <code>C:\users\</code><code>$env:username</code><code>\desktop\RPDetails.csv</code> <code>-NoTypeInformation</code></p></div></td></tr></tbody></table>

For more information about ADFS command please visit [technet site](https://technet.microsoft.com/pl-pl/library/ee892326.aspx).