#region Use format manifest

# Create new object using type casting
$obj = [pscustomobject]@{Name='Kurt Roggen'; FirstName='Kurt'; LastName='Roggen'}
Add-Member -InputObject $obj -MemberType AliasProperty -Name FullName -Value Name
Add-Member -InputObject $obj -MemberType ScriptProperty -Name MyFullName -Value { $this.Firstname + ' ' + $this.LastName.ToUpper() }
Add-Member -InputObject $obj -MemberType ScriptProperty -Name IsUNC -Value {$this.Name -match "^\\w*"}

$obj

$obj | Get-Member

# Using PSTypeNames
$obj.PSTypeNames

# Insert your object type new PSTypeName
$obj.PSTypenames.Insert(0,'MyObject')
$obj.PSTypeNames
$obj | Get-Member

# Use format manifest
$File = 'D:\PS\ITPROceed\ITPROceed.format.ps1xml'

# Open format manifest
powershell_ise.exe $File

# See the current view of the object
$obj

# Update format data (in memory)
Update-FormatData -AppendPath $File

# See the new view 'Extended' of the object
$obj
$obj | Format-List -View Extended
$obj | Get-Member

#endregion Use format manifest
