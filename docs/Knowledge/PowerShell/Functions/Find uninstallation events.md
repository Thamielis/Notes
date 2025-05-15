# How to find events about software uninstallation?

Posted on [September 16, 2017September 16, 2017](https://www.powershellbros.com/find-events-software-uninstallation/) by [Pawel Janowicz](https://www.powershellbros.com/author/pawel-janowicz/)

Recently we noticed that some software has been uninstalled on our machines. To scan all servers I created simple PowerShell function which checks event in application log.

To scan events we can use **Get-EventLog**command and specify event Id – in this case it should be 1034:

```powershell
Get-EventLog -LogName Application -Source MSIInstaller | Where-Object {$_.EventID -eq '1034'}
```

Script will generate output with the following information:

– Server

   – Date

   – User

   – Application

   – Version

   – Manufacturer

   – Source

**Usage:**

```powershell
Get-UninstallEvents -Computername DC01
Get-UninstallEvents -Computername DC01,DCO2 -Event 3| Format-Table
Get-UninstallEvents -Computername DC01,DCO2,DC03 -Event 10 -Verbose | Format-Table
Get-UninstallEvents -Computername (Get-Content "D:\scripts\input.txt") -Verbose | Export-Csv -Path C:\users\$env:username\desktop\results.csv -NoTypeInformation
Get-UninstallEvents -Computername (GC "D:\scripts\\input.txt") -Verbose | Out-GridView -Title "Results"
```

**Output:**

[![Get-UninstallEvents](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/09/Get-UninstallEvents-1024x456.png?resize=690%2C307)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/09/Get-UninstallEvents.png)

Get-UninstallEvents

**Final script:**

```powershell
Function Get-UninstallEvents{
    param
    (
        [Parameter(Position=0, Mandatory = $false, HelpMessage="Provide server names", ValueFromPipeline = $true)]
        $Computername = $env:computername,
        [Parameter(Position=0, Mandatory = $false, HelpMessage="How many first events?", ValueFromPipeline = $true)]
        $Event = 1
    )
    $Results = @()
    ForEach($Server in $Computername)
    {
        Write-Verbose $Server
        Try
        {
            $IDs = Invoke-Command -ComputerName $server -ScriptBlock {param($Event) Get-EventLog -LogName Application -Source MSIInstaller | Where-Object {$_.EventID -eq '1034'} | Select -First $Event} -ArgumentList $Event
        }
        Catch
        {
            $_.Exception.Message
            Continue
        }
        If($IDs)
        {
            ForEach($ID in $IDs)
            {
                $Object = New-Object PSObject -Property ([ordered]@{
                    Server                  = $Server
                    Date                    = $ID.TimeGenerated
                    User                    = $ID.UserName
                    Application             = $ID.ReplacementStrings[0]
                    Version                 = $ID.ReplacementStrings[1]
                    Manufacturer            = $ID.ReplacementStrings[4]
                    Source                  = $id.Source
                })
                $Results += $Object
            }
        }
        Else
        {
            Write-Verbose "No events found"
        }
}
    If($Results)
    {
        Return $Results
    }
}
```
