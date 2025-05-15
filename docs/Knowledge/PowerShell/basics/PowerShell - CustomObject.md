# PowerShell - CustomObject

```powershell
$results = [PSCustomObject]@{
    HypTotal = $hyptotal
    MgmtVMTotal = $mgmtVMTotal
    UniqueCustomerCount = $customerTotal
    TotalComputerObjects = $allCompsTotal
    TotalUserObjects = $userTotal
}

[PSCustomObject]@{
    User1 = Get-Credential -Message User1
    User2 = Get-Credential -Message User2
} | Export-Clixml -Path $Path
```

## -------------------------------------------------------------------------------
## a few working examples of creating custom PSObjects that contain multiple values:
### example 1 - using noteProperty
```powershell
$results = @()
foreach ($user in $users) {
    $a = $null
    $a = Get-UserInfo -userName $user
    $obj = New-Object System.Object
    $obj | Add-Member -type NoteProperty -Name UserName -Value $a.UserName
    $obj | Add-Member -type NoteProperty -Name Name -Value $a.Name
    $obj | Add-Member -type NoteProperty -Name Title -Value $a.Title
    $results += $obj
}#foreach_user
```

### example 2 - using new PSObject
```powershell
foreach ($user in $users) {
    $a = $null
    $a = Get-ANTInfo -userName $user
    $obj = New-Object PSObject -Property ([ordered]@{
        UserName       = $a.UserName
        Name        = $a.Name
        Title       = $a.Title
    })#psobject
    $results += $obj
}#foreach_user
```

### example 3 - using new PSObject
```powershell
$results = @()
$vms = get-vm
foreach($vm in $vms){  
    $name = $vm | Select-Object -ExpandProperty Name
    $cpu = $vm | Select-Object -ExpandProperty ProcessorCount
    $dyanamic = $vm | Select-Object -ExpandProperty DynamicMemoryEnabled
    $memMin = [math]::round($vm.MemoryMinimum / 1MB, 0)
    $memMax = [math]::round($vm.MemoryMaximum / 1GB, 0)
    $TestObj = New-Object PSObject -Property @{
         Name = $name
         CPU = $cpu
         DynamicMemoryEnabled = $dyanamic
         MemoryMinimum = $memMin
         MemoryMaximum = $memMax
    }
    $results += $TestObj
}
```

## ------------------------------------------------------------------------------
## new basic custom ordered object
```powershell
$stock = New-Object PSObject -Property ([ordered]@{
    "FQDN" = "-----"
    "WhenCreated" = $created
    "Status" = "-----"
})
```

## ------------------------------------------------------------------------------
## array to object
```powershell
$resultsArray += @{ 
    "Name" =     $nameProperty; 
    "Present" =  $evalProperty;
    "Contents" = $contentsProperty
}
$a = $resultsArray | ForEach-Object { new-object PSObject -Property $_}
$output = $a | Select-Object Name, Present, Contents | Sort-Object Name
```

## ------------------------------------------------------------------------------
## hash to object
```powershell
$info = @{}
$info.BIOSVersion = Get-WmiObject Win32_BIOS | Select-Object -ExpandProperty Version
$info.OperatingSystemVersion = Get-WmiObject win32_OperatingSystem | Select-Object -ExpandProperty Version
$info.PowerShellVersion = $PSVersionTable.psversion.ToString()
New-Object PSObject -property $info
```

## ------------------------------------------------------------------------------
## based on code from: http://community.idera.com/powershell/powertips/b/tips/posts/turning-ad-user-into-a-hash-table
## ------------------------------------------------------------------------------
## Object to hash
```powershell
$blacklist = "ServiceHandle", "Container", "Site"
$services = Get-Service -Name BITS
$serviceManip = $services | Get-Member -MemberType *property | Select-Object -ExpandProperty Name

$newHash = [Ordered]@{}
$serviceManip |
    Sort-Object |
    Where-Object {
        $_ -notin $blacklist
    } |
    ForEach-Object {
        $newHash[$_] = $services.$_ 
    }
```

## ------------------------------------------------------------------------------
## multiple objects to hash
```powershell
$blacklist = "ServiceHandle", "Container", "Site"
$services = Get-Service
$serviceManip = $services | Get-Member -MemberType *property | Select-Object -ExpandProperty Name

$newHash = [Ordered]@{}
$serviceManip |
    Sort-Object |
    Where-Object {
        $_ -notin $blacklist
    } |
    ForEach-Object {
        $newHash[$_] += $services.$_ 
    }
```

## ------------------------------------------------------------------------------
```powershell
$results = @()
$properties = @{}
$properties.Add("Subnet-$i", $subnet.SubnetId)
$properties.Add("CIDR-$i", $subnet.CidrBlock)
$results += [PSCustomObject]$properties
```

# ------------------------------------------------------------------------------