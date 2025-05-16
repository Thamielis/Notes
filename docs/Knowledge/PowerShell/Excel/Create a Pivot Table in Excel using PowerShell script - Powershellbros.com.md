# Create a Pivot Table in Excel using PowerShell script - Powershellbros.com
![pivot table](../Images/Create%20a%20Pivot%20Table%20in%20Excel%20using%20PowerShell%20script%20-%20Powershellbros.com/pivot-table.jpg)

Find out how to create a **Pivot Table** in Excel using a PowerShell script. In one of the previous articles, I described how to [get computer objects from OUs](https://www.powershellbros.com/get-computer-objects-from-ous/). In this case, I wanted to show you how to export the same results to Excel and create Pivot Table.

**Pivot Table in Excel**

To create something in Excel using PowerShell we need to have **ImportExcel** module installed on our PC. To do that you just have open PowerShell ISE as an admin and run the following command:

```powershell
#Open ISE as an admin and install module if you dont have
Install-Module -Name ImportExcel
```

Apart from this, we need to have [**ActiveDirecotry**](https://docs.microsoft.com/en-us/powershell/module/addsadministration/?view=win10-ps) module as we will use **Get-ADComputer** and **Get-OrganizationalUnit** cmdlets.

The **[Get-ADOrganizationalUnit](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adorganizationalunit?view=win10-ps)** cmdlet gets an organizational unit (OU) object or performs a search to get multiple OUs. In params, you need to specify **SearchBase** from your environment:

```powershell
        #OU Params
        $Params = @{
            Filter       = '*'
            Server       = ($env:LOGONSERVER -replace "\\",'')
            SearchBase   = 'OU=Servers,DC=PowerShellBros,DC=com'
            SearchScope  = 'Subtree'
            Properties   = 'DistinguishedName'
        }
 
        #Get all OUs
        $OUs = Get-ADOrganizationalUnit @Params | Select DistinguishedName
```

The **[Get-ADComputer](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adcomputer?view=win10-ps)** cmdlet gets a computer or performs a search to retrieve multiple computers.

```powershell
$Computers = Get-ADComputer -Filter * -SearchBase $item.DistinguishedName -SearchScope OneLevel

```

Below you can find an example on how to get all the computers from OUs and export results to Excel and [CSV file](https://www.powershellbros.com/tag/csv/).

![](../Images/Create%20a%20Pivot%20Table%20in%20Excel%20using%20PowerShell%20script%20-%20Powershellbros.com/image-2.png)

Final script:

```powershell
    ################################################################################         
    Try{
        #Open ISE as an admin and install module if you dont have
        Install-Module -Name ImportExcel
 
        #Import Modules
        Import-Module ActiveDirectory,ImportExcel -ErrorAction Stop
 
        #Set location where excell will be saved
        Set-Location "$env:userprofile\desktop\"
 
        #Params
        $ReportPath   = "$env:userprofile\desktop\"
        $FileDate     = Get-Date -Format "yyyyMMddHHmmss"
        $OutputCsv    = "$ReportPath\Computers_$FileDate.csv" 
        $AllComputers = @()
 
        #OU Params
        $Params = @{
            Filter       = '*'
            Server       = ($env:LOGONSERVER -replace "\\",'')
            SearchBase   = 'OU=Servers,DC=PowerShellBros,DC=com'
            SearchScope  = 'Subtree'
            Properties   = 'DistinguishedName'
        }
 
        #Get all OUs
        $OUs = Get-ADOrganizationalUnit @Params | Select DistinguishedName 
 
        If($OUs){
            #Get all computers
            $AllComputers = Foreach ($item in $OUs){
                $Computers = Get-ADComputer -Filter * -SearchBase $item.DistinguishedName -SearchScope OneLevel
                If($Computers){
                    Foreach ($i in $Computers){
                        $Object = @{} | Select 'OU Distinguishedname', 'Computername'
                        $Object.Computername           = $i.dnshostname
                        $Object.'OU Distinguishedname' = $item.DistinguishedName
                        $Object
                    }
                }
            }
        }
    }
    Catch{
        Write-Warning $_.Exception.Message
        Read-Host "Script will end. Press enter to close the window"
        Exit
    }
    ################################################################################
 
    If($AllComputers){
        #Create PivotTable in Excel and open it
        $AllComputers | Export-Excel -Path ".\Servers OUs.xlsx" -KillExcel -WorkSheetname "Servers OUs" -ClearSheet -IncludePivotTable -PivotRows 'OU Distinguishedname','Computername' -PivotData @{"Computername"="Count"} -show
 
        #Export CSV
        $AllComputers | Export-CSV $OutputCsv -Force -NoTypeInformation
    }
  
```

I hope this was informative for you 🙂 See you in the next articles.