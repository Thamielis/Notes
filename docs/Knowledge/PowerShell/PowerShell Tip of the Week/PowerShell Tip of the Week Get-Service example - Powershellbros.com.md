Starting from today we will add also short articles with simple PowerShell examples once per week. Below you can find how to use `Get-Service` command against several servers and get nice formatted output.

##### Get-Service

The **Get-Service** cmdlet gets objects that represent the services on a local computer or on a remote computer, including running and stopped services.

In this example we will limit our query to 4 properties:

– MachineName  
– Name  
– Displayname  
– Status

To list all available service properties you can run:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>Get-Service</code> <code>-ComputerName</code> <code>DC01</code> <code>-Name</code> <code>HealthService | </code><code>Select-Object</code> <code>*</code></p><p><code>Get-Service</code> <code>-ComputerName</code> <code>DC01</code> <code>-Name</code> <code>HealthService | </code><code>Get-Member</code> <code>-MemberType</code> <code>Properties</code></p></div></td></tr></tbody></table>

[![service properties](PowerShell%20Tip%20of%20the%20Week%20Get-Service%20example%20-%20Powershellbros.com/service-properties.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2017/11/service-properties.png)

service properties

**Final script:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>Get-Service</code> <code>-ComputerName</code> <code>DC01,DC02</code> <code>-Name</code> <code>HealthService | </code><code>Select-Object</code> <code>MachineName,Displayname,Name,Status</code></p><p><code>Get-Service</code> <code>-Computername</code> <code>( </code><code>Get-Content</code> <code>-path</code> <code>"c:\temp\servers.txt"</code> <code>)</code> <code>-Name</code> <code>HealthService | </code><code>Select-Object</code> <code>MachineName,Name,Displayname,Status | </code><code>Sort-Object</code> <code>Status</code></p></div></td></tr></tbody></table>

**Output:**

[![Get-Service](PowerShell%20Tip%20of%20the%20Week%20Get-Service%20example%20-%20Powershellbros.com/Get-Service-1024x114.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/11/Get-Service.png)

Get-Service

For more **Get-Service** examples please visit [Microsoft docs site](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-service?view=powershell-5.1).