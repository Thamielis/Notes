# Run SCCM client actions on remote machines using PowerShell script - Powershellbros.com
![](../Images/Run%20SCCM%20client%20actions%20on%20remote%20machines%20using%20PowerShell%20script%20-%20Powershellbros.com/configuration-manager.png)

It probably takes some time to run SCCM client actions on all machines in your environment. It’s getting more complicated when you have only server core machines. This is why I decided to write a PowerShell function for that.

**SCCM client actions**

**Most common client schedule actions**

*   Hardware Inventory Cycle
*   Software Inventory Cycle
*   Discovery Data Collection Cycle (Send DDR)
*   Machine Policy Retrieval & Evaluation Cycle
*   Software Updates Deployment Evaluation Cycle
*   Software Updates Scan Cycle
*   File Collection Cycle
*   Windows Installer Source List Update Cycle
*   Software Metering Usage Report Cycle
*   Branch Distribution Point Maintenance Task
*   Certificate Maintenance Task

In my script, I was just concentrating only on Machine Policy, Discovery Data, Compliance Evaluation, App Deployment, hardware inventory, Update Deployment, Update Scan, and Software Inventory actions. To run one action on the remote machine you can use below [one-liner](https://www.powershellbros.com/category/one-liner/) scripts:

```powershell
#Software Inventory Cycle
$Server = "DC01"
Invoke-WMIMethod -ComputerName $Server -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000002}"

#or
[void] ([wmiclass] "\\$Server\root\ccm:SMS_Client").TriggerSchedule("{00000000-0000-0000-0000-000000000002}"); 

```

To find available actions you have to go to **System and Security** tab in Control Panel. There you will see the [Configuration Manager](https://docs.microsoft.com/en-us/previous-versions/system-center/system-center-2012-R2/gg682067(v=technet.10)) icon:

![](../Images/Run%20SCCM%20client%20actions%20on%20remote%20machines%20using%20PowerShell%20script%20-%20Powershellbros.com/control-panel.png)

Once you click it the window with **Configuration Manager Properties** will open and then you have to just navigate to Actions tab or just open cmd and run the following [SCCM command](https://www.systemcenterdudes.com/configuration-manager-2012-client-command-list/) **control smscfgrc**. This will open properties straight away.

To run single action you just have to select it and click **Run Now** button:

[![SCCM client actions properties](../Images/Run%20SCCM%20client%20actions%20on%20remote%20machines%20using%20PowerShell%20script%20-%20Powershellbros.com/SCCM-client-actions-1.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/SCCM-client-actions-1.png?ssl=1)

Below you can find [PowerShell function](https://www.powershellbros.com/category/functions/) for that. You can execute this for multiple machines and run multiple actions. Advantage of this script is that it runs in single Invoke-Command scriptblock and give you results at the end. Please ensure that all machine are up and running before trying this function as it may crash.

**Final script:**

```powershell
Function Run-SCCMClientAction {
        [CmdletBinding()]
                
        # Parameters used in this function
        param
        ( 
            [Parameter(Position=0, Mandatory = $True, HelpMessage="Provide server names", ValueFromPipeline = $true)] 
            [string[]]$Computername,
 
           [ValidateSet('MachinePolicy', 
                        'DiscoveryData', 
                        'ComplianceEvaluation', 
                        'AppDeployment',  
                        'HardwareInventory', 
                        'UpdateDeployment', 
                        'UpdateScan', 
                        'SoftwareInventory')] 
            [string[]]$ClientAction
   
        ) 
        $ActionResults = @()
        Try { 
                $ActionResults = Invoke-Command -ComputerName $Computername {param($ClientAction)
 
                        Foreach ($Item in $ClientAction) {
                            $Object = @{} | select "Action name",Status
                            Try{
                                $ScheduleIDMappings = @{ 
                                    'MachinePolicy'        = '{00000000-0000-0000-0000-000000000021}'; 
                                    'DiscoveryData'        = '{00000000-0000-0000-0000-000000000003}'; 
                                    'ComplianceEvaluation' = '{00000000-0000-0000-0000-000000000071}'; 
                                    'AppDeployment'        = '{00000000-0000-0000-0000-000000000121}'; 
                                    'HardwareInventory'    = '{00000000-0000-0000-0000-000000000001}'; 
                                    'UpdateDeployment'     = '{00000000-0000-0000-0000-000000000108}'; 
                                    'UpdateScan'           = '{00000000-0000-0000-0000-000000000113}'; 
                                    'SoftwareInventory'    = '{00000000-0000-0000-0000-000000000002}'; 
                                }
                                $ScheduleID = $ScheduleIDMappings[$item]
                                Write-Verbose "Processing $Item - $ScheduleID"
                                [void]([wmiclass] "root\ccm:SMS_Client").TriggerSchedule($ScheduleID);
                                $Status = "Success"
                                Write-Verbose "Operation status - $status"
                            }
                            Catch{
                                $Status = "Failed"
                                Write-Verbose "Operation status - $status"
                            }
                            $Object."Action name" = $item
                            $Object.Status = $Status
                            $Object
                        }
 
            } -ArgumentList $ClientAction -ErrorAction Stop | Select-Object @{n='ServerName';e={$_.pscomputername}},"Action name",Status
        }  
        Catch{
            Write-Error $_.Exception.Message 
        }   
        Return $ActionResults           
}
```

**How to use this function?**

```powershell
#Single action on 1 computer
Run-SCCMClientAction -Computername DC01 -ClientAction AppDeployment
 
#Single action on multiple servers
Run-SCCMClientAction -Computername (Get-Content .\input.txt) -ClientAction SoftwareInventory
 
#Multiple actions  on multiple servers
Run-SCCMClientAction -Computername (Get-Content .\input.txt) -ClientAction AppDeployment,ComplianceEvaluation,SoftwareInventory
 
#Multiple actions with verbose mode  on multiple servers
Run-SCCMClientAction -Computername (Get-Content .\input.txt) -ClientAction AppDeployment,ComplianceEvaluation,DiscoveryData,SoftwareInventory -Verbose
```

[![client actions](../Images/Run%20SCCM%20client%20actions%20on%20remote%20machines%20using%20PowerShell%20script%20-%20Powershellbros.com/SCCM-client-actions-function.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/SCCM-client-actions-function.png?ssl=1)

I hope that script was useful for you 🙂 See you in next articles.