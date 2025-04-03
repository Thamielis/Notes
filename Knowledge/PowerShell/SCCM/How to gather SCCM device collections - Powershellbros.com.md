# How to gather SCCM device collections - Powershellbros.com
If you was working with System Center family, you know purpose of SCCM device collections from SCCM.  
For those who didn’t have a chance to deal with this I strongly reccomend to read article [https://technet.microsoft.com/en-us/library/gg682177.aspx](https://technet.microsoft.com/en-us/library/gg682177.aspx).

System Center Configuration Manager console allows user to check all collections to which specific device belongs.  
What in case that customer want to have a list of collections for some reports?  
Of course you can do the snapshot from Configuration Manager GUI console, but it will not be usefull in any report.  
SCCM have it’s own Powershell module which is copied to SCCM folder during installation:  
**Drive:\\Program Files (x86)\\Microsoft Configuration Manager\\AdminConsole\\bin\\ConfigurationManager.psd1**  
It can be very usefull in many cases that we want to automate repetitive tasks.  
Below I paste script for gathering collections for scpeific device, which of course can be adjusted to your needs.  
For instance, you can prepare list of servers for which you want to have a report of collections and provide it as an input.

```powershell
Import-Module 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1' -ErrorAction SilentlyContinue
 
$ClientName = "ServerName"
$SiteName = "SCCMSiteName"
 
$Location = "$SiteName"+":"
Set-Location $Location
$CollectionArray = @()
$DeviceResID = (Get-CMDevice -Name $ClientName -WarningAction Ignore).ResourceID 
$Collections = (Get-WmiObject -Class sms_fullcollectionmembership -Namespace root\sms\site_$SiteName -Filter "ResourceID = '$($DeviceResID)'").CollectionID
     
foreach($col in $Collections)
{
        $Coll = Get-CMDeviceCollection -CollectionId $col -WarningAction Ignore | select Name, CollectionID
        $result = New-Object PSObject
        $result  | add-member Noteproperty ServerName $ClientName
        $result  | add-member Noteproperty MaintenanceWindow $coll.Name
        $CollectionArray += $result
}
```

I hope that it will be useful for some of you.  
Please comment if you found any bug or want any advice regarding SCCM automation.  
Enjoy!