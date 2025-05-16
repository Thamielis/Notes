

#$DTName = 'Root'
#$DataTable = [System.Data.DataTable]::new($DTName)

function New-DataColumn {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Name,
        [Parameter()]
        [String] $Type
    )

    $DataType = [System.Type]::GetType("System.$Type")
    $Column = [System.Data.DataColumn]::new($Name, $DataType)

    return $Column
}

# Define the DataColumn class
class DataColumn {
    [string]$Name
    [string]$Type
    [bool]$AllowNull

    DataColumn([string]$Name, [string]$Type, [bool]$AllowNull) {
        $this.Name = $Name
        $this.Type = $Type
        $this.AllowNull = $AllowNull
    }
}

# Define the DataRow class
class DataRow {
    [System.Collections.Hashtable]$Values

    DataRow() {
        $this.Values = @{}
    }

    [void] AddValue([string]$ColumnName, $Value) {
        $this.Values[$ColumnName] = $Value
    }
}

# Define the DataRelation class
class DataRelation {
    [string]$RelationName
    [DataTable]$ParentTable
    [DataTable]$ChildTable
    [string]$ParentColumn
    [string]$ChildColumn

    DataRelation([string]$RelationName, [DataTable]$ParentTable, [string]$ParentColumn, [DataTable]$ChildTable, [string]$ChildColumn) {
        $this.RelationName = $RelationName
        $this.ParentTable = $ParentTable
        $this.ChildTable = $ChildTable
        $this.ParentColumn = $ParentColumn
        $this.ChildColumn = $ChildColumn
    }

    [bool] ValidateChildRow($ChildRow) {
        $parentValues = $this.ParentTable.Rows | ForEach-Object { $_.Values[$this.ParentColumn] }
        return $parentValues -contains $ChildRow.Values[$this.ChildColumn]
    }
}

# Extend DataTable class
class DataTable {
    [string]$TableName
    [System.Collections.Generic.List[DataColumn]]$Columns
    [System.Collections.Generic.List[DataRow]]$Rows
    [System.Collections.Generic.List[DataTable]]$ChildTables
    [DataTable]$ParentTable
    [System.Collections.Generic.List[DataRelation]]$Relations

    DataTable([string]$TableName) {
        $this.TableName = $TableName
        $this.Columns = [System.Collections.Generic.List[DataColumn]]::new()
        $this.Rows = [System.Collections.Generic.List[DataRow]]::new()
        $this.ChildTables = [System.Collections.Generic.List[DataTable]]::new()
        $this.Relations = [System.Collections.Generic.List[DataRelation]]::new()
    }

    [void] AddColumn([string]$Name, [string]$Type, [bool]$AllowNull) {
        $column = [DataColumn]::new($Name, $Type, $AllowNull)
        $this.Columns.Add($column)
    }

    [void] AddRow([System.Collections.Hashtable]$RowData) {
        $row = [DataRow]::new()
        foreach ($column in $this.Columns) {
            if ($RowData.ContainsKey($column.Name)) {
                $value = $RowData[$column.Name]
                if ($null -ne $value -or $column.AllowNull) {
                    $row.AddValue($column.Name, $value)
                }
                else {
                    throw "Column '$($column.Name)' does not allow null values."
                }
            }
            else {
                throw "Missing value for column '$($column.Name)'."
            }
        }

        # Validate child relations
        foreach ($relation in $this.Relations) {
            if ($relation.ChildTable -eq $this -and !$relation.ValidateChildRow($row)) {
                throw "Invalid relationship value in column '$($relation.ChildColumn)'."
            }
        }

        $this.Rows.Add($row)
    }

    [void] AddChildTable([DataTable]$ChildTable) {
        $this.ChildTables.Add($ChildTable)
        $ChildTable.ParentTable = $this
    }

    [void] AddRelation([string]$RelationName, [string]$ParentColumn, [DataTable]$ChildTable, [string]$ChildColumn) {
        $relation = [DataRelation]::new($RelationName, $this, $ParentColumn, $ChildTable, $ChildColumn)
        $this.Relations.Add($relation)
        $ChildTable.Relations.Add($relation)
    }

    [void] DisplayTable() {
        Write-Host "Table: $($this.TableName)"
        $header = ($this.Columns | ForEach-Object { $_.Name }) -join "`t"
        Write-Host $header
        Write-Host ("-" * ($header.Length + 10))
        foreach ($row in $this.Rows) {
            $rowValues = $this.Columns | ForEach-Object { $row.Values[$_.Name] }
            Write-Host ($rowValues -join "`t")
        }
    }

    [void] DisplayRelations() {
        foreach ($relation in $this.Relations) {
            Write-Host "Relation: $($relation.RelationName)"
            Write-Host "Parent Table: $($relation.ParentTable.TableName) - Column: $($relation.ParentColumn)"
            Write-Host "Child Table: $($relation.ChildTable.TableName) - Column: $($relation.ChildColumn)"
        }
    }
}

# Example Usage

# Create Parent Table
$parentTable = [DataTable]::new("Departments")
$parentTable.AddColumn("DeptId", "int", $false)
$parentTable.AddColumn("DeptName", "string", $false)
$parentTable.AddRow(@{ DeptId = 1; DeptName = "HR" })
$parentTable.AddRow(@{ DeptId = 2; DeptName = "IT" })

# Create Child Table
$childTable = [DataTable]::new("Employees")
$childTable.AddColumn("EmpId", "int", $false)
$childTable.AddColumn("EmpName", "string", $false)
$childTable.AddColumn("DeptId", "int", $false)

# Establish Relationship
$parentTable.AddChildTable($childTable)
$parentTable.AddRelation("Dept-Employee", "DeptId", $childTable, "DeptId")

# Add Rows to Child Table
$childTable.AddRow(@{ EmpId = 1; EmpName = "Alice"; DeptId = 1 })
$childTable.AddRow(@{ EmpId = 2; EmpName = "Bob"; DeptId = 2 })

# Display Tables and Relations
$parentTable.DisplayTable()
$childTable.DisplayTable()
$parentTable.DisplayRelations()



