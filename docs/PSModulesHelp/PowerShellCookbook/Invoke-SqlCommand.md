Invoke-SqlCommand
-----------------

### Synopsis
Return the results of a SQL query or operation

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-SqlCommand.ps1 -Sql "SELECT TOP 10 * FROM Orders"
Invokes a command using Windows authentication
```
> EXAMPLE 2

```PowerShell
$cred = Get-Credential
PS > Invoke-SqlCommand.ps1 -Sql "SELECT TOP 10 * FROM Orders" -Cred $cred
Invokes a command using SQL Authentication
```
> EXAMPLE 3

```PowerShell
$server = "MYSERVER"
PS > $database = "Master"
PS > $sql = "UPDATE Orders SET EmployeeID = 6 WHERE OrderID = 10248"
PS > Invoke-SqlCommand $server $database $sql
Invokes a command that performs an update
```
> EXAMPLE 4

```PowerShell
$sql = "EXEC SalesByCategory 'Beverages'"
PS > Invoke-SqlCommand -Sql $sql
Invokes a stored procedure
```
> EXAMPLE 5

```PowerShell
Invoke-SqlCommand (Resolve-Path access_test.mdb) -Sql "SELECT * FROM Users"
Access an Access database
```
> EXAMPLE 6

```PowerShell
Invoke-SqlCommand (Resolve-Path xls_test.xls) -Sql 'SELECT * FROM [Sheet1$]'
Access an Excel file
```

---

### Parameters
#### **DataSource**
The data source to use in the connection

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Database**
The database within the data source

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **SqlCommand**
The SQL statement(s) to invoke against the database

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |3       |false        |

#### **Timeout**
The timeout, in seconds, to wait for the query to complete

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **Credential**
The credential to use in the connection, if any.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Syntax
```PowerShell
Invoke-SqlCommand [[-DataSource] <String>] [[-Database] <String>] [-SqlCommand] <String[]> [[-Timeout] <Int32>] [[-Credential] <Object>] [<CommonParameters>]
```
