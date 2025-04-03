param([string] $kustoquery, [string] $wmiquery, [string] $select)

# Read the queries and selects
$kustoquery  = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($kustoquery.Substring(2))).Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)
$wmiqueries  = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($wmiquery.Substring(2))).Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)
$selects = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($select.Substring(2))).Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)


#create the result xml writer
$sb = New-Object System.Text.StringBuilder
$sw = New-Object System.IO.StringWriter($sb)
$writer = New-Object System.Xml.XmlTextWriter($sw)
$writer.WriteStartDocument()
$writer.WriteStartElement("result")
$writer.WriteAttributeString("ResultCode", 0x00000000 )

# A helper function to create a datatable of properties
function CreateTableFromPropertyList
{
    param ([string[]]$properties, [String[]]$propertyTypes)

    $dt = New-Object system.Data.DataTable

    # Add Device column first
    $col_device = New-Object system.Data.DataColumn 'Device',([Microsoft.ConfigurationManagement.AdminConsole.CMPivotParser.Device])
    $dt.Columns.Add($col_device)

    # Add the rest properties to columns
    for( $index = 0; $index -lt $properties.Length; $index++ )
    {
        # Get the column datatype
        switch($propertyTypes[$index])
        {
            "Boolean"
            {
                $colType = [System.Boolean]
                break
            }
            "Number"
            {
                $colType = [System.Int64]
                break
            }
            "String"
            {
                $colType = [System.String]
                break
            }
            "TimeSpan"
            {
                $colType = [System.TimeSpan]
                break
            }
            "DateTime"
            {
                $colType = [System.DateTime]
                break                
            }
            default
            {
                throw
            }
        }
        $column = New-Object system.Data.DataColumn $properties[$index], ($colType)
        $dt.Columns.Add($column)
    }

    return ,$dt
}

Try
{
    # Lookup the CCM directory
    $key = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, [Microsoft.Win32.RegistryView]::Registry64)
    $subKey =  $key.OpenSubKey("SOFTWARE\Microsoft\SMS\Client\Configuration\Client Properties")
    $ccmdir = $subKey.GetValue("Local SMS Path")
    $key.Close()
    $binName = 'AdminUI.CMPivotParser.dll'
    $binPath = (join-path $ccmdir $binName)
        
    # Try to load AdminUI.CMPivotParser.dll from ccm binary folder
    try
    {
        [System.Reflection.Assembly]::LoadFile($binPath) | Out-Null
    }
    catch
    {   
        throw 'Failed to load CMPivotParser'
    }

    # Create the resultant data table list
    $datatables = New-Object System.Collections.Generic.List[Data.DataTable]

    # For each query
    for( $queryIndex = 0; $queryIndex -lt $wmiqueries.Length; $queryIndex++ )
    {
        # For this index
        $wmiquery = $wmiqueries[$queryIndex]
        $select = $selects[$queryIndex]

        # Parse the select parameter
        $propertyFilter = @()
        $propertyTypes = @()
        $propertySerializer = @()

        foreach($p in $select.Split(','))
        {
            # Parse property definition
            $p = $p.Split(':')

            # Generate a property serializer
            if( $p[2] -eq "KiloBytes" )
            {   
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return [Int64]::Parse($val.ToString()) -shr 10 }
            }
            elseif( $p[2] -eq "MegaBytes" )
            {   
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return [Int64]::Parse($val.ToString()) -shr 20 }
            }
            elseif( $p[2] -eq "GigaBytes" )
            {   
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return [Int64]::Parse($val.ToString()) -shr 30 }
            }
            elseif( $p[2] -eq "Seconds" )
            {   
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return [Int64]::Parse($val.ToString())/1000 }
            }
            elseif( $p[2] -eq "HexSring" )
            {   
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return "0x"+[Int64]::Parse($val.ToString()).ToString("X") }
            }
            elseif( $p[2] -eq "DateString" )
            {   
                # The DateString field format is "ddddddddHHMMSS.mmmmmm:000" --> %d Days 02:01:01 Hours
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { 
                    Param( [Object] $val ) 
                    $days = [Int64]::Parse( $val.SubString(0, 8))
                    $hours = $val.SubString(8, 2)
                    $min = $val.SubString(10, 2)
                    $seconds = $val.SubString(12, 2)
                    return "${days} Days ${hours}:${min}:${seconds} Hours"
                }
            }
            elseif ( $p[1] -eq 'Number' )
            {
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return [Int64]::Parse($val.ToString()) }
            }
            elseif ( $p[1] -eq 'Boolean' )
            {
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return [Boolean]::Parse($val.ToString()) }
            }
            elseif( $p[1] -eq 'DateTime' )
            {
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]  
                $propertySerializer += { 
                    Param( [Object] $val )           
            
                    try
                    {
                       $val = [System.Management.ManagementDateTimeconverter]::ToDateTime($val)
                         
                       #Sql.MinDateTime -> Null
                       if( $val -lt (get-date -Year 1753 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0 -Millisecond 0))
                       {     
                          return $null
                       }
                       else
                       {
                          return $val
                       }
                     
                    }
                    catch
                    {
                        return $null
                    }
                }
            }
            elseif( $p[1] -ne 'Device' )
            {
                $propertyFilter+= $p[0]                
                $propertyTypes+= $p[1]
                $propertySerializer += { Param( [Object] $val ) return $val.ToString() }                
            }
        }

        # Create a data table to store the results of this query
        $dt = CreateTableFromPropertyList -properties $propertyFilter -propertyTypes $propertyTypes

        #Create the result set
        $results = New-Object System.Collections.Generic.List[Object]

        #deal with one-offs that don't work well over WMI
        if( $wmiquery -eq 'SMBConfig' )
        {
            # Get Smb Config
            $smbConfig = Get-SmbServerConfiguration -ErrorAction Stop| Select-object -Property $propertyFilter

            #Add to results list
            $results.Add($smbConfig)
        }
        elseif( $wmiquery -eq 'Users' )
        {
            $users = New-Object System.Collections.Generic.List[String]

            foreach( $user in (get-WmiObject -class Win32_LoggedOnuser -ErrorAction Stop | Select Antecedent))
            {
                $parts = $user.Antecedent.Split("""")
        
                # If this is not a built-in account
                if(( $parts[1] -ne "Window Manager" ) -and (($parts[1] -ne $env:COMPUTERNAME) -or (($parts[3] -notlike "UMFD-*")) -and ($parts[3] -notlike "DWM-*")))
                {
                    # add to list
                    $users.Add($parts[1] + "\" + $parts[3])            
                }
            }
   
            # Create unique set of users
            $users | sort-object -Unique | foreach-object { $results.Add(@{ UserName = $_ }) }         
        }
        elseif( $wmiquery -eq 'IPConfig' )
        {
            $ipconfigs = (Get-NetIPConfiguration -ErrorAction Stop)

            foreach( $ipconfig in $ipconfigs )
            {
                $hash = @{
                    InterfaceAlias = $ipconfig.InterfaceAlias
                    Name = $ipconfig.NetProfile.Name
                    InterfaceDescription = $ipconfig.InterfaceDescription
                    Status = $ipconfig.NetAdapter.Status
                    IPV4Address = $ipconfig.IPv4Address.IPAddress
                    IPV6Address = $ipconfig.IPv6Address.IPAddress
                    IPV4DefaultGateway = $ipconfig.IPv4DefaultGateway.NextHop
                    IPV6DefaultGateway = $ipconfig.IPv6DefaultGateway.NextHop
                    DNSServerList = ($ipconfig.DNSServer.ServerAddresses -join "; ")
                }
    
                $results.add($hash)
            }
        }
        elseif( $wmiquery -eq 'Connections' )
        {
            $netstat = "$Env:Windir\system32\netstat.exe"
            $rawoutput = & $netstat -f
            $netstatdata = $rawoutput[3..$rawoutput.count] | ConvertFrom-String | select p2,p3,p4,p5 | where p5 -eq 'established' | select P4  

            foreach( $data in $netstatdata)
            {        
                #Add to results list
                $hash = @{ Server = $data.P4.Substring(0,$data.P4.LastIndexOf(":")) }
                $results.Add($hash )
            }        
        }
        elseif( $wmiquery -eq 'EPStatus' )
        {
            $epStatus = (Get-MpComputerStatus -ErrorAction Stop)

            $hash = @{                 
                AMServiceEnabled = $epStatus.AMServiceEnabled
                AntispywareEnabled = $epStatus.AntispywareEnabled
                AntispywareSignatureLastUpdated = $epStatus.AntispywareSignatureLastUpdated
                AntispywareSignatureVersion = $epStatus.AntispywareSignatureVersion
                AntivirusEnabled = $epStatus.AntivirusEnabled
                AntivirusSignatureLastUpdated = $epStatus.AntivirusSignatureLastUpdated
                AntivirusSignatureVersion = $epStatus.AntivirusSignatureVersion
                BehaviorMonitorEnabled = $epStatus.BehaviorMonitorEnabled
                IoavProtectionEnabled = $epStatus.IoavProtectionEnabled
                IsTamperProtected = $epStatus.IsTamperProtected
                NISEnabled = $epStatus.NISEnabled
                NISSignatureLastUpdated = $epStatus.NISSignatureLastUpdated
                NISSignatureVersion = $epStatus.NISSignatureVersion
                OnAccessProtectionEnabled = $epStatus.OnAccessProtectionEnabled
                QuickScanEndTime = $epStatus.QuickScanEndTime
                RealTimeProtectionEnabled = $epStatus.RealTimeProtectionEnabled            
            }
                
            $results.Add($hash)
        }
        elseif( $wmiquery.StartsWith('Updates') )
        {
            # Default server selection
            $serverSelection = 0 

            # if server selection has been specified then use it
            $first = $wmiquery.IndexOf("(")

            if( $first -ne -1 ) 
            {
                $last = $wmiquery.LastIndexOf(")")            
                $serverSelection = [Int32]::Parse( $wmiquery.Substring($first+1, $last-$first-1))
            }

            # Create an update session object
            $Session =  [activator]::CreateInstance([type]::GetTypeFromProgID("Microsoft.Update.Session",$null))
            $Searcher = $Session.CreateUpdateSearcher()
            $Searcher.ServerSelection = $serverSelection

            # Search for any uninstalled updates
            $MissingUpdates = $Searcher.Search("DeploymentAction=* and IsInstalled=0 and Type='Software'")  
    
            if ($MissingUpdates.Updates.Count -gt 0) 
            {
                foreach( $Update in $MissingUpdates.Updates )
                {   
                    $KBArticleIDs = ""
                    foreach( $KB in $Update.KBArticleIDs)
                    {
                        if( $KBAticleIDs.Length -gt 0 )
                        {
                            $KBArticleIDs = $KBArticleIDs + ","
                        }

                        $KBArticleIDs = $KBArticleIDs + "KB$KB"
                    }
            
                    $SecurityBulletinIDs = ""
                    foreach( $BulletinID in $Update.SecurityBulletinIDs)
                    {
                        if( $SecurityBulletinIDs.Length -gt 0 )
                        {
                            $SecurityBulletinIDs = $SecurityBulletinIDs + ","
                        }

                        $SecurityBulletinIDs = $SecurityBulletinIDs + $BulletinID
                    }

                    $Categories = ""
                    foreach( $Category in $Update.Categories)
                    {
                        if( $Categories.Length -gt 0 )
                        {
                            $Categories = $Categories + ","
                        }

                        $Categories = $Categories + $Category.Name
                    }

                    #Add to results list
                    $hash = @{                 
                        Title = $Update.Title
                        RebootRequired = $Update.RebootRequired
                        LastDeploymentChangeTime = $Update.LastDeploymentChangeTime
                        UpdateID = $Update.Identity.UpdateID
                        KBArticleIDs = $KBArticleIDs
                        SecurityBulletinIDs = $SecurityBulletinIDs                                
                        Categories = $Categories                
                    }
                
                    $results.Add($hash)            
                }
            } 
        }
        elseif( $wmiquery -eq 'AppCrash' )
        {
            Try
            {
                $crashes = get-eventlog -ErrorAction Stop -LogName Application  -After (Get-Date).AddDays(-7) -InstanceId 1000 -Source 'Application Error'

                foreach ($crash in $crashes)  
                {
                    $hash = @{
                            FileName = $crash.ReplacementStrings[0]
                            Version = $crash.ReplacementStrings[1]
                            ReportId = $crash.ReplacementStrings[12]
                            DateTime = $crash.TimeGenerated
                    } 
    
                    $results.Add($hash)        
                }
            }
            Catch
            {
            }
        }
        elseif( $wmiquery -eq 'AadStatus' )
        {
            $dsregcmd = "$Env:Windir\system32\dsregcmd.exe"
            $hash = @{}

            if( Test-Path -Path $dsregcmd -PathType Leaf )            
            {
                $rawoutput = & $dsregcmd /status

                foreach( $line in $rawoutput )
                {
                    $sep = $line.IndexOf(":")

                    if( $sep -ne -1 )
                    {
                        $propName = $line.SubString(0, $sep).Trim()
                        $propValue = $line.SubString($sep+1).Trim()

                        if( $propValue -eq 'YES' )
                        {
                            $propValue = $true
                        }
                        elseif( $propValue -eq 'NO' )
                        {
                            $propValue = $false
                        }

                        $hash.Add($propName,$propValue)

                    }
                }
            }
            else
            {   
                # On an OS that does not support AAD Join         
                $hash.Add("EnterpriseJoined",$false)
                $hash.Add("AzureAdJoined",$false)
                $hash.Add("WorkplaceJoined",$false)

                $OSInfo=(Get-CIMInstance Win32_ComputerSystem)

                if( $OSInfo.PartOfDomain )
                {
                    $hash.Add("DomainJoined",$true)
                    $hash.Add("DomainName",$OSInfo.Domain)
                }
                else
                {
                    $hash.Add("DomainJoined",$false)
                }
            }

            $results.Add($hash)
        }
        elseif( $wmiquery -eq 'Administrators' )
        {
            $admins = (get-localgroupmember -SID S-1-5-32-544 -ErrorAction Stop)
            foreach( $admin in $admins )
            {
                $hash = @{
                    ObjectClass = $admin.ObjectClass
                    Name = $admin.Name
                    PrincipalSource = $admin.PrincipalSource
                }

                $results.Add($hash)        
            }
        }
        elseif ($wmiquery.StartsWith("File(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")
    
            $fileSpec = [System.Environment]::ExpandEnvironmentVariables( $wmiquery.Substring($first, $last-$first))
   
            foreach( $file in (Get-Item -Force -ErrorAction SilentlyContinue -Path $filespec))
            {
                $fileSHA256 = ""
                $fileMD5 = ""

                Try
                {
                    $fileSHA256 = (get-filehash -ErrorAction SilentlyContinue -Path $file).Hash 
                    $fileMD5 = (get-filehash -ErrorAction SilentlyContinue -Path $file -Algorithm MD5).Hash
                }
                Catch
                {
                }

                 $hash = @{
                    FileName = $file.FullName
                    Mode = $file.Mode
                    LastWriteTime = $file.LastWriteTime
                    Size = $file.Length
                    Version = $file.VersionInfo.ProductVersion
                    SHA256Hash = $fileSHA256
                    MD5Hash = $fileMD5
                 }

                 $results.Add($hash)

            }
        }
        elseif ($wmiquery.StartsWith("FileContent(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'") 

            $filepath = [System.Environment]::ExpandEnvironmentVariables( $wmiquery.Substring($first, $last-$first) )   

            #verify if the file exists
            if( [System.IO.File]::Exists($filepath) )
            {        
                $lines = (get-content -path $filepath -ErrorAction Stop)
                
                # our code handles lines as list of object
                # get-content return list of lines if multiple lines are present
                # in case of single line a string is returned which is casted to list
                if ($lines -is [string]) {
                    $lines = @($lines)
                }
                for ($index = 0; $index -lt $lines.Length; $index++)
                {
                    $line = $lines[$index]

                    $hash = @{
                            Line = $index+1
                            Content = $line
                    }
                    $results.Add($hash)
                }
            }
        }
        elseif ($wmiquery.StartsWith("EventLog(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")    
            $logName = $wmiquery.Substring($first, $last-$first)

            $first_time = $wmiquery.LastIndexOf(",")+1
            $last_time = $wmiquery.LastIndexOf(")")
            $secondsAgo = [System.Int64]::Parse($wmiquery.Substring($first_time, $last_time-$first_time))
    
            $events = get-eventlog -LogName $logName -ErrorAction Stop -After (Get-Date).AddSeconds(-1*$secondsAgo)
    
            foreach ($event in $events)  
            {
                $hash = @{
                        DateTime = $event.TimeGenerated
                        EntryType = $event.EntryType
                        Source = $event.Source
                        EventID = $Event.EventID
                        Message = $Event.Message
                } 
    
                $results.Add($hash)        
            }
        }
        elseif ($wmiquery.StartsWith("CcmLog(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")    
            $logFileName = $wmiquery.Substring($first, $last-$first)

            $first_time = $wmiquery.LastIndexOf(",")+1
            $last_time = $wmiquery.LastIndexOf(")")
            $secondsAgo = [System.Int64]::Parse($wmiquery.Substring($first_time, $last_time-$first_time))

            $key = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, [Microsoft.Win32.RegistryView]::Registry64)
            $subKey =  $key.OpenSubKey("SOFTWARE\Microsoft\CCM\Logging\@Global")
            $ccmlogdir = $subKey.GetValue("LogDirectory")
            $key.Close()
            $logPath = (join-path $ccmlogdir ($logFileName+".log"))

            #verify format of file name
            if(( $logFileName -match '[\w\d-_@]+' ) -and ([System.IO.File]::Exists($logPath)))
            {        
                $lines = (get-content -path $logpath -ErrorAction Stop)

                [regex]$ccmLog = '<!\[LOG\[(?<logtext>.*)\]LOG\]!><\s*time\s*\=\s*"(?<time>\d\d:\d\d:\d\d)[^"]+"\s+date\s*\=\s*"(?<date>[^"]+)"\s+component\s*\=\s*"(?<component>[^"]*)"\s+context\s*\=\s*"(?<context>[^"]*)"\s+type\s*\=\s*"(?<type>[^"]+)"\s+thread\s*\=\s*"(?<thread>[^"]+)"\s+file\s*\=\s*"(?<file>[^"]+)"\s*>'

                for( $index = $lines.Length-1; $index -ge 0; $index-- )
                {
                    $line = $lines[$index]

                    $m = $ccmLog.Match($line)

                    if( $m.Success -eq $true )
                    {
                        $hash = @{
                            LogText = $m.Groups["logtext"].Value
                            DateTime = ([DateTime]($m.Groups["date"].Value +' '+ $m.Groups["time"].Value)).ToUniversalTime()
                            Component = $m.Groups["component"].Value
                            Context = $m.Groups["context"].Value
                            Type = $m.Groups["type"].Value
                            Thread = $m.Groups["thread"].Value
                            File = $m.Groups["file"].Value
                        }
                        
                        # Filter out logs based on timespan
                        if ( [System.DateTime]::Compare($hash.DateTime, (Get-Date).AddSeconds(-1*$secondsAgo).ToUniversalTime()) -lt 0 )
                        {
                            break
                        }
                        else
                        {
                            $results.Add($hash)
                        }
                    }   
                }

                # Reverse the results list to ascending datetime
                $results.Reverse()
            }
        }
        elseif ($wmiquery.StartsWith("WinEvent("))
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")
            $logFileName =  $wmiquery.Substring($first, $last-$first)

            $first_time = $wmiquery.LastIndexOf(",")+1
            $last_time = $wmiquery.LastIndexOf(")")
            $secondsAgo = [System.Int64]::Parse($wmiquery.Substring($first_time, $last_time-$first_time))

            $ComputerName = [System.Environment]::MachineName 
            $EventStartDate = (Get-Date).AddSeconds(-1*$secondsAgo)
            $EventEndTime = (Get-Date)
            $filterTable = @{logname = $logFileName; StartTime=$EventStartDate; EndTime=$EventEndTime}

            # Filter out the winEvent logs that we need
            try
            {
                $winEvents = Get-WinEvent -ComputerName $ComputerName -FilterHashTable $filterTable  -ErrorAction Stop
            }
            catch
            {
            }

            foreach ($winEvent in $winEvents)  
            {
                $hash = @{
                        DateTime = $winEvent.TimeCreated
                        LevelDisplayName = $winEvent.LevelDisplayName
                        ProviderName = $winEvent.ProviderName
                        ID = $winEvent.ID
                        Message = $winEvent.Message
                } 
    
                $results.Add($hash)        
            }
        }
        elseif ($wmiquery.StartsWith("Registry(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")
            $regSpec =  $wmiquery.Substring($first, $last-$first)
   
            $result = New-Object System.Collections.Generic.List[Object]

            foreach( $regKey in (Get-Item -ErrorAction SilentlyContinue -Path $regSpec) )
            {
                foreach( $regValue in $regKey.Property )
                {
                    $val = $regKey.GetValue($regValue)

                    if ( $val -eq $null)
                    { 
                        $valDefaultProp = Get-ItemProperty -Path $regSpec
                        $valDefault = $valDefaultProp."(Default)"

                        $hashDefault = @{
                            Key = $regKey.Name
                            Property = '(Default)' 
                            Value = $valDefault.ToString()
                        }

                        $results.Add($hashDefault)
                    }
                    else
                    {
                        if( $val.GetType() -eq [Byte[]] )
                        {
                            $val = [System.BitConverter]::ToString($val)
                        }
                        elseif( $val.GetType() -eq [String[]] )
                        {
                            $val = [System.String]::Join(", ", $val)
                        }

                        $hash = @{
                            Key = $regKey.Name
                            Property = $regValue
                            Value = $val.ToString()
                        }

                        $results.Add($hash)
                    }
                }
            }
        }
        elseif ($wmiquery.StartsWith("RegistryKey(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")
            $regSpec =  $wmiquery.Substring($first, $last-$first)
   
            $result = New-Object System.Collections.Generic.List[Object]

            foreach( $regKey in (Get-Item -ErrorAction SilentlyContinue -Path $regSpec) )
            {
                $hash = @{
                    Key = $regKey.Name
                }

                $results.Add($hash)
            }

        }
        elseif ($wmiquery.StartsWith("ProcessModule(") )
        {
            $first = $wmiquery.IndexOf("'")+1
            $last = $wmiquery.LastIndexOf("'")
            $processName =  $wmiquery.Substring($first, $last-$first)

            $modules = get-process -name $processName -module -ErrorAction SilentlyContinue

            foreach ($module in $modules)  
            {
                $hash = @{
                        ModuleName = $module.ModuleName
                        FileName = $module.FileName
                        FileVersion = $module.FileVersion
                        Size = $module.Size
                        MD5Hash = (get-filehash -ErrorAction SilentlyContinue -Path $module.FileName -Algorithm MD5).Hash
                } 
    
                $results.Add($hash)     
            }

        }
        else
        {
            $namespace = "root/cimv2"

            # if there is a namespace
            if( ($wmiquery.StartsWith("root/")) -and ($wmiquery.Contains(":")))
            {
                $seperator = $wmiquery.IndexOf(":")
                $namespace =  $wmiquery.Substring(0, $seperator)
                $wmiquery = $wmiquery.Substring($seperator+1)
            }

            # Execute the query
            $wmiresult = (get-wmiobject -query $wmiquery -Namespace $namespace -ErrorAction Stop) 

            # create result set
            $result = New-Object System.Collections.Generic.List[Object]

            foreach( $obj in $wmiresult )
            {
                $hash = @{}

                for( $i=0; $i -lt $propertyFilter.Length; $i++ )
                {            
                   $propName = $propertyFilter[$i]
                   $propValue = $obj[$propName]
 
                   if( $propValue -ne $null)
                   {
                       $hash[$propName] = $($propertySerializer[$i].Invoke($propValue))
                   }
                   else
                   {
                       $hash[$propName] = $null
                   }
                }

                $results.Add($hash)
            }
        }

        # Write the results to the data table
        foreach( $obj in $results )
        {   
            # Add a row in data table
            $insertRow = $dt.NewRow()

            $device = New-Object Microsoft.ConfigurationManagement.AdminConsole.CMPivotParser.Device ([System.Environment]::MachineName), 1

            $insertRow.Device = [Microsoft.ConfigurationManagement.AdminConsole.CMPivotParser.Device]$device
        
            for( $i=0; $i -lt $propertyFilter.Length; $i++ )
            {
                $propName = $propertyFilter[$i]
                $propValue = $obj[$propName]

                if( $propValue -ne $null)
                {
                    switch($propertyTypes[$i])
                    {
                        "Boolean"
                        {
                            $insertRow[$propName] = [System.Boolean]$propValue
                            break
                        }
                        "Number"
                        {
                            $insertRow[$propName] = [System.Int64]$propValue
                            break
                        }
                        "TimeSpan"
                        {
                            $insertRow[$propName] = [System.TimeSpan]$propValue
                            break
                        }
                        "DateTime"
                        {
                            $insertRow[$propName] = ([System.DateTime]$propValue).ToUniversalTime()
                            break                
                        }
                        default
                        {
                            $insertRow[$propName] = $propValue
                        }
                    }
                }
                else
                {
                    $insertRow[$propName] = [System.DBNull]::Value
                }
            }
            $dt.Rows.Add($insertRow)
        }

        # Add the data table to list
        $datatables.Add($dt)
    }

    # Call the static method to evaluate the pivot query
    $maxResultSize = 128000
    $moreResults = $false
    $eval_result = [Microsoft.ConfigurationManagement.AdminConsole.CMPivotParser.KustoParser]::Evaluate($kustoquery, $datatables, $maxResultSize, [ref]$moreResults)

    # Add an attribute to result node to indicate if there should be more results
    $writer.WriteAttributeString("moreResults", $moreResults.ToString())

    # Write the results to Xml
    foreach ( $dr in $eval_result.Rows )
    {
        $writer.WriteStartElement("e")
        
        $writer.WriteAttributeString("_i", 0 )

        foreach ( $dc in $eval_result.Columns )
        {
            $prop = $dc.ColumnName

            # Skip Device column in writing to xml
            if ($prop -eq 'Device')
            {
                continue
            }
            $Value = $dr[$prop]
            
            if( !([DBNull]::Value).Equals($Value) )
            {
                if( $Value.GetType() -eq [DateTime] )
                {
                    $writer.WriteAttributeString("$prop", $Value.ToString("yyyy-MM-dd HH:mm:ss", [CultureInfo]::InvariantCulture))
                }
                else
                {
                    $writer.WriteAttributeString("$prop", $Value.ToString() )
                }
            }
        }

        $writer.WriteEndElement()
    }
}
Catch
{
    #format the exception as an xml 
    $sb = New-Object System.Text.StringBuilder
    $sw = New-Object System.IO.StringWriter($sb)
    $writer = New-Object System.Xml.XmlTextWriter($sw)

    $writer.WriteStartDocument()
    $writer.WriteStartElement("result")
    $writer.WriteAttributeString("ResultCode", 0x80004005 )
    $writer.WriteStartElement("error")
    $writer.WriteAttributeString("ErrorMessage", $_.Exception.Message )
    $writer.WriteEndElement()

    # Dispose the datatable if catch an exception
    if( $dt -ne $null )
    {
        $dt.Dispose()
		$datatables = $null
    }
}

# Finish off Xml
$writer.WriteEndElement()
$writer.WriteEndDocument()
$writer.Flush()
$writer.Close()

$writer.Close()
$sw.Dispose()

$Bytes = [System.Text.Encoding]::Unicode.GetBytes($sb.ToString())

if( $Bytes.Length -lt 4096 ) 
{
    return [Convert]::ToBase64String($Bytes)
}
else
{
    # Otherwise compress
    [System.IO.MemoryStream] $output = New-Object System.IO.MemoryStream
    $gzipStream = New-Object System.IO.Compression.GzipStream $output, ([IO.Compression.CompressionMode]::Compress)
    $gzipStream.Write( $Bytes, 0, $Bytes.Length )
    $gzipStream.Close()
    $output.Close()

    return [Convert]::ToBase64String($output.ToArray())
}

# SIG # Begin signature block
# MIIoMQYJKoZIhvcNAQcCoIIoIjCCKB4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDw/pGFNR4cD3Q/
# es4E02vMY24vHfy4cLg7LwYnbNVpFKCCDXYwggX0MIID3KADAgECAhMzAAADTrU8
# esGEb+srAAAAAANOMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMwMzE2MTg0MzI5WhcNMjQwMzE0MTg0MzI5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDdCKiNI6IBFWuvJUmf6WdOJqZmIwYs5G7AJD5UbcL6tsC+EBPDbr36pFGo1bsU
# p53nRyFYnncoMg8FK0d8jLlw0lgexDDr7gicf2zOBFWqfv/nSLwzJFNP5W03DF/1
# 1oZ12rSFqGlm+O46cRjTDFBpMRCZZGddZlRBjivby0eI1VgTD1TvAdfBYQe82fhm
# WQkYR/lWmAK+vW/1+bO7jHaxXTNCxLIBW07F8PBjUcwFxxyfbe2mHB4h1L4U0Ofa
# +HX/aREQ7SqYZz59sXM2ySOfvYyIjnqSO80NGBaz5DvzIG88J0+BNhOu2jl6Dfcq
# jYQs1H/PMSQIK6E7lXDXSpXzAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUnMc7Zn/ukKBsBiWkwdNfsN5pdwAw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzUwMDUxNjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAD21v9pHoLdBSNlFAjmk
# mx4XxOZAPsVxxXbDyQv1+kGDe9XpgBnT1lXnx7JDpFMKBwAyIwdInmvhK9pGBa31
# TyeL3p7R2s0L8SABPPRJHAEk4NHpBXxHjm4TKjezAbSqqbgsy10Y7KApy+9UrKa2
# kGmsuASsk95PVm5vem7OmTs42vm0BJUU+JPQLg8Y/sdj3TtSfLYYZAaJwTAIgi7d
# hzn5hatLo7Dhz+4T+MrFd+6LUa2U3zr97QwzDthx+RP9/RZnur4inzSQsG5DCVIM
# pA1l2NWEA3KAca0tI2l6hQNYsaKL1kefdfHCrPxEry8onJjyGGv9YKoLv6AOO7Oh
# JEmbQlz/xksYG2N/JSOJ+QqYpGTEuYFYVWain7He6jgb41JbpOGKDdE/b+V2q/gX
# UgFe2gdwTpCDsvh8SMRoq1/BNXcr7iTAU38Vgr83iVtPYmFhZOVM0ULp/kKTVoir
# IpP2KCxT4OekOctt8grYnhJ16QMjmMv5o53hjNFXOxigkQWYzUO+6w50g0FAeFa8
# 5ugCCB6lXEk21FFB1FdIHpjSQf+LP/W2OV/HfhC3uTPgKbRtXo83TZYEudooyZ/A
# Vu08sibZ3MkGOJORLERNwKm2G7oqdOv4Qj8Z0JrGgMzj46NFKAxkLSpE5oHQYP1H
# tPx1lPfD7iNSbJsP6LiUHXH1MIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGhEwghoNAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAANOtTx6wYRv6ysAAAAAA04wDQYJYIZIAWUDBAIB
# BQCggbIwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIGwh2GKZIzZfJiymiue3EO4B
# 0xI7ngdNBdjrBtHc1LM2MEYGCisGAQQBgjcCAQwxODA2oBiAFgBDAE0AUABpAHYA
# bwB0AC4AcABzADGhGoAYaHR0cDovL3d3dy5taWNyb3NvZnQuY29tMA0GCSqGSIb3
# DQEBAQUABIIBAEvMJXng6I7m9WzC+BGpJuEOp+UOxn98P1Tj8nvFuz18Cl3RoWI9
# mZiw0D36GLPn4oGFck6jITGhivvVjw9SVBQj8g2j3kYx43a/BYS0gOePVInbmwJ8
# QZSB7K4yLaJWdmQYrN682yV0tgytI5B7gzYgElsUeee9V66YAKOkk1cUDSP6P0IM
# m7Rq2VHUvK7JH39ARLc/+MUfbPmEU9BSXTpUP3K9E+C4pZc/QA8kApdnFxvLQoen
# P3oeVJaDvpBWN6SrFM95BaKICU+tjeyUt0Dc6MMZzknSpyS5TeCkoqhVZNRtZ0zP
# Yw8RFBuykE2ILTRtaKE/LcIH56B3P66xAxShgheXMIIXkwYKKwYBBAGCNwMDATGC
# F4Mwghd/BgkqhkiG9w0BBwKgghdwMIIXbAIBAzEPMA0GCWCGSAFlAwQCAQUAMIIB
# UgYLKoZIhvcNAQkQAQSgggFBBIIBPTCCATkCAQEGCisGAQQBhFkKAwEwMTANBglg
# hkgBZQMEAgEFAAQg2JQG0CIjrrKQnPwu+z5XVqQr6Uxx9UjAoNctWoxiPPwCBmUo
# b/P0LxgTMjAyMzEwMjYwODA1NDIuODM5WjAEgAIB9KCB0aSBzjCByzELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0
# IEFtZXJpY2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOkEw
# MDAtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2
# aWNloIIR7TCCByAwggUIoAMCAQICEzMAAAHQdwiq76MXxt0AAQAAAdAwDQYJKoZI
# hvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjMwNTI1
# MTkxMjE0WhcNMjQwMjAxMTkxMjE0WjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0
# aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOkEwMDAtMDVFMC1EOTQ3MSUw
# IwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEA3zJX59+X7zNFwFEpiOaohtFMT4tuR5EsgYM5
# N86WDt9dXdThBBc9EKQCtt7NXSRa4weYA/kjMOc+hMMQuAq11PSmkOFjR6h64Vn7
# aYKNzJCXsfX65jvTJXVH41BuerCFumFRemI1/va09SQ3Qgx26OZ2YmrDIoBimsBm
# 9h6g+/5I0Ueu0b1Ye0OJ2rQFbuOmX+TC74kdMTeXDRttMcAcILbWmBJOV5VC2gR+
# Tp189nlqCMfkowzuwbeQbgAVmPEr5kUHwck9nKaRM047f37NMaeAdXAB1Q8JRsGb
# r/UX3N53XcYBaygPDFh2yRdPmllFGCAUfBctoLhVR6B3js3uyLG8r0a2sf//N4GK
# qPHOWf9f7u5Iy3E4IqYsmfFxEbCxBAieaMdQQS2OgI5m4AMw3TZdi3no/qiG3Qa/
# 0lLyhAvl8OMYxTDk1FVilnprdpIcJ3VHwTUezc7tc/S9Fr+0wGP7/r+qTYQHqITz
# AhSXPmpOrjA/Eyks1hY8OWgA5Jg/ZhrgvOsr0ipCCODGss6FHbHk9J35PGNHz47X
# cNlp3o5esyx7mF8HA2rtjtQzLqInnTVY0xd+1BJmE/qMQvzhV1BjwxELfbc4G0fY
# PBy7VHxHljrDhA+cYG+a8Mn7yLLOx/3HRxXCIiHM80IGJ7C8hBnqaGQ5CoUjEeXg
# geinL/0CAwEAAaOCAUkwggFFMB0GA1UdDgQWBBQz4QGFktKAPpTrSE34ybcpdJJ0
# UTAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSg
# UqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3Nv
# ZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEE
# YDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNy
# dDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB
# /wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEAl4fnJApGWgNOkjVvqsbUvYB0KeMe
# xvoHYpJ4CiLRK/KLZFyK5lj2K2q0VgZWPdZahoopR8iJWd4jQVG2jRJmigBjGeWH
# EuyGVCj2qtY1NJrMpfvKINLfQv2duvmrcd77IR6xULkoMEx2Vac7+5PAmJwWKMXY
# SNbhoah+feZqi77TLMRDf9bKO1Pm91Oiwq8ubsMHM+fo/Do9BlF92/omYPgLNMUz
# ek9EGvATXnPy8HMqmDRGjJFtlQCq5ob1h/Dgg03F4DjZ5wAUBwX1yv3ywGxxRktV
# zTra+tv4mhwRgJKwhpegYvD38LOn7PsPrBPa94V/VYNILETKB0bjGol7KxphrLmJ
# y59wME4LjGrcPUfFObybVkpbtQhTuT9CxL0EIjGddrEErEAJDQ07Pa041TY4yFIK
# GelzzMZXDyA3I8cPG33m+MuMAMTNkUaFnMaZMfuiCH9i/m+4Cx7QcVwlieWzFu1s
# FAti5bW7q1MAb9EoI6Q7WxKsP7g4FgXqwk/mbctzXPeu4hmkI8mEB+h/4fV3PLJp
# tp+lY8kkcdrMJ1t4a+kMet1P8WPRy+hTYaxohRA+2USq58L717zFUFCBJAexlBHj
# eoXmPIBy7dIy1d8sw4kAPEfKeWBoBgFbfTBMIACTWNYh7x//L84SUmRTZB/LL0c7
# Tv4t07yq42/GccIwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0G
# CSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3Jp
# dHkgMjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNV
# BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4w
# HAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29m
# dCBUaW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9
# uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZr
# BxTzxXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk
# 2pg7uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxR
# nOlwaQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uD
# RedGbsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGa
# RnXNxF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fz
# pk03dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG
# 4tG9ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGU
# lNi5UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLE
# hReTwDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0w
# ggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+
# gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNV
# HSAEVTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0l
# BAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0P
# BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9
# lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQu
# Y29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3Js
# MFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3Nv
# ZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJ
# KoZIhvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEG
# k5c9MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2
# LpypglYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7nd
# n/OOPcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSF
# QrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy8
# 7JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8
# x1RtnWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2f
# pCjcZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz
# /gq77EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQ
# KBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAx
# M328y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGby
# oYIDUDCCAjgCAQEwgfmhgdGkgc4wgcsxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
# YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlv
# bnMxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjpBMDAwLTA1RTAtRDk0NzElMCMG
# A1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIa
# AxUAvLfIU/CilF/dZVORakT/Qn7vTImggYMwgYCkfjB8MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1T
# dGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOjkEOEwIhgPMjAyMzEwMjUy
# MjEwNDFaGA8yMDIzMTAyNjIyMTA0MVowdzA9BgorBgEEAYRZCgQBMS8wLTAKAgUA
# 6OQQ4QIBADAKAgEAAgJQ9wIB/zAHAgEAAgITAjAKAgUA6OViYQIBADA2BgorBgEE
# AYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYag
# MA0GCSqGSIb3DQEBCwUAA4IBAQAJHqpEADoACy7yYWNEmmVwtLJq/RU/yAVzbb1o
# e0tVm8IffjeystQT6a2HtjAjrtn11bO/H0fyNkwsZJtZ0204jEzL2KMP15Q3k/Ts
# Wm10ddfm2x2HPYJwYwbzfPRsaj9T8NNbXKdlHljBWJT3l7yqodUcDzE9JjKCOVCd
# Bn/h6GK5gYyKyQtaUV90LugNlU7TMgFmXXKvHUj1jYrGp2yycpou5I3pWpJmbGIS
# S1w0ctTwkN3pWxTPTxaw6GMKy80lmLTR83oKFDsquijZ60ncJXJRs1eDm+n3HfFE
# 19NOvVTJcmlxwuMLmwqmW+aet6M0LCIECUW0EfUTRRCTcJzyMYIEDTCCBAkCAQEw
# gZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHQdwiq76MXxt0A
# AQAAAdAwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0B
# CRABBDAvBgkqhkiG9w0BCQQxIgQg1djvmeeJiM+zRJxqxIVPVS7rxVu/0KJb7srH
# xVBdVAMwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCAIlUAGX7TT/zHdRNmM
# PnwV2vcOn45k2eVgHq600j8J1zCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwAhMzAAAB0HcIqu+jF8bdAAEAAAHQMCIEIPMi+JT2c7iprQStLEwg
# MfRlDFIgY4MCnznkvWpoVxJ0MA0GCSqGSIb3DQEBCwUABIICAKYfKLT9UfGZn4FF
# z9H3mu1Txp9+p9lEk09xJEre4xT5DNklk4ZSNR81DU7mGgNi/GlxcXBqtk0nXwW6
# 8cJVRkyep2MkQ2VYdbHMDvBIROoYcijxe4QsxsqnurdUxu7sFpkkO8MIA0vvclVs
# u1+DUX2hvk72jDCYKE/R64yq38awLNULa5R1z4SxqwOzd6LLyAC+dgel/BaqJw99
# NsA8NGzm8SVicPNN91ceSmY+MKLhkB9q/5v8vRlxmcfKvkdmDlYiXoGPNPiaLh+T
# 9iMpGoXi5kFsMmgq7nU4Y2oV1a9bACyqLo++XeAsg6K36eVq09qXdyjIGEBv5Ocn
# hDNga9/l/J0gxtcPkdgeAaIInRnW8DZLIINoOnuihx5F7D4b6SNMj6Sny8PJfFIf
# iJQHYOum7Kv9jrIMMsllOuk1AzVsgglCundCdUHuCktKpyCiT54fuYQ0iigY9Dgd
# /HIMw1TJ3OiBk38zzBnXit1dS/ZL7/0bWMoz8tacHbxc8GtaMmu5X/CbL0uucbDg
# GGbJic6aLhYvzbZ+mljHgvtS9Fkuzf2ojnRIteNYg+2xbidWZUNfWP/WvcsURZNS
# 2LwlJFcRYS8GHTdKo8YfgX2+elWd/BjU1lDCvqzVviOO9Wpc/+rX5kpxZmKx36OG
# 88ogwW2MVIwlI9DVxCmNqdYoCZKC
# SIG # End signature block
