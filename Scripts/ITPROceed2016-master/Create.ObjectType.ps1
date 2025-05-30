#region Creating object type

# Create new object using type casting
$obj = [pscustomobject]@{Name='Kurt Roggen'; FirstName='Kurt'; LastName='Roggen'}
$obj

$obj | Get-Member

# Using PSTypeNames
$obj.PSTypeNames

# Insert your object type new PSTypeName
$obj.PSTypenames.Insert(0,'MyObject')
$obj.PSTypeNames
$obj | Get-Member

#endregion Creating object type
