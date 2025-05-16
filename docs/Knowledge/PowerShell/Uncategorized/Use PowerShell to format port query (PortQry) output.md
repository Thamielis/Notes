Recently I had to check connectivity to several servers on some specific ports using **PortQry**. As some of you already know this command will return some kind of the connectivity test report. I wanted to convert this into nice formatted table.

##### Port Query

Port Query – Display the status of TCP and UDP ports, troubleshoot TCP/IP connectivity and security, return LDAP base query info, SMTP, POP3, IMAP4 status, enumerate SQL Server instances (UDP port 1434), Local ports, local services running (and the DLL modules loaded by each).

Description of the Portqry.exe command-line utility – [link](https://support.microsoft.com/en-us/help/310099/description-of-the-portqry-exe-command-line-utility).

If you run normal `portqry` command you will get the following result:

```
1cmd.exe /c "Portqry.exe -n SCCM03 -o 80,443,445,8530,8531,10123"
PortQry
After using below script you can get formatted output from remote machine:
PortQry check
On the beginning you have to specify which servers do you want to check:
12345$SCCMServ = "SCCM01",            "SCCM02",            "SCCM03",            "SCCM04",            "SCCM05"
Also you can add different port numbers in the ScriptBlock:
1$PortQuery = Invoke-Command $RemoteServer -ScriptBlock{param($Server) cmd.exe /c "Portqry.exe -n $Server -o 80,443,445,8530,8531,10123" } -ArgumentList $Server
Final script:
12345678910111213141516171819202122232425262728293031323334353637383940414243444546474849505152535455$RemoteServer = Read-Host "Please provide server name"$SCCMServ = "SCCM01",            "SCCM02",            "SCCM03",            "SCCM04",            "SCCM05"$PortArray  = @() If(!$RemoteServer){    Write-Warning "Something went wrong"    Break}Else{    $TestPath = Test-Path "\\$RemoteServer\c$\windows\system32\Portqry.exe"    If($TestPath -match "False" -or $null){        Write-Warning "Portqry not found"        Break    }    Else{        Foreach ($Server in $SCCMServ){            Write-Host "Checking $Server" -ForegroundColor Yellow            $Array = @()            $PortQuery = $Ports = $Object = $PortObject = $Null            $PortQuery = Invoke-Command $RemoteServer -ScriptBlock{param($Server)cmd.exe /c "Portqry.exe -n $Server -o 80,443,445,8530,8531,10123"} -ArgumentList $Server            $Ports = $PortQuery | Where-Object {$_.StartsWith("TCP port")}            Foreach ($Line in $Ports){                $PortNumber = ($Line -split "TCP port ")[1].Trim()                $PortNumber = ($PortNumber -split " ")[0].Trim()                $Status = ($Line -split ": ")[1].Trim()                $Object = New-Object PSObject -Property ([ordered]@{                     PortNumber           = $PortNumber                    Status               = $Status                })                $Array += $Object            }            If($Array){                $PortObject = New-Object PSCustomObject                $PortObject | Add-Member -MemberType NoteProperty -Name "Server" -Value $Server                Foreach($item in $Array){                    $PortNr = $Null                    $PortNr = $Item.portnumber                    $PortObject | Add-Member -MemberType NoteProperty -Name $PortNr -Value $item.status                }                $PortArray += $PortObject            }        }    }}    $PortArray | Format-Table -AutoSize -Wrap
For testing ports you can use also one of the PowerShell commands called Test-NetConnection – example.
I hope this was informative for you 🙂 See you in next articles.


```