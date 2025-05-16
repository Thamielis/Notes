Earlier this year, I wrote about how to [**manage Dell BIOS settings**][1] using PowerShell. The method described in that post uses the [**DellBIOSProvider**][2] PowerShell module. This method works, but I was not completely satisfied with it, as the PowerShell module needs to be downloaded and installed on every system the script runs on.

Thankfully, Dell recently released a [**technical whitepaper**][3] documenting WMI classes that can be used to directly modify BIOS settings without needing an outside program or PowerShell module. This allowed me to create a new version of the Dell BIOS Settings Management script that does not require any additional content to function.

One caveat for this new method is the WMI classes are only supported on Dell hardware released to market after calendar year 2018. Because of this, older Dell hardware will still require the use of the DellBIOSProvider PowerShell module.

The script can be downloaded from my GitHub: [**https://github.com/ConfigJon/Firmware-Management/blob/master/Dell/Manage-DellBiosSettings-WMI.ps1**][4]

## Dell, WMI, and PowerShell

Dell provides a WMI interface that can be used for querying and modifying BIOS settings on their hardware models (only applies to models released after calendar year 2018). This means that we can use PowerShell to directly view and edit BIOS settings without the need for a vendor specific program. This script uses 7 of the Dell provided WMI classes.

The first WMI class is **EnumerationAttribute**. It is located in the **root\\dcim\\sysman\\biosattributes** namespace. This class is used to return a list of all BIOS settings with a set of predefined values. This list includes the majority of the configurable BIOS settings.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p></td><td><div><p><code>$Enumeration</code> <code>= </code><code>Get-CimInstance</code> <code>-Namespace</code> <code>root\dcim\sysman\biosattributes</code> <code>-ClassName</code> <code>EnumerationAttribute</code></p><p><code>$Enumeration</code> <code>| </code><code>Select-Object</code> <code>AttributeName,CurrentValue,PossibleValue</code></p><p><code>$Enumeration</code> <code>| </code><code>Where-Object</code> <code>AttributeName </code><code>-eq</code> <code>"WakeOnLan"</code> <code>| </code><code>Select-Object</code> <code>AttributeName,CurrentValue,PossibleValue</code></p></div></td></tr></tbody></table>

The second WMI class is **IntegerAttribute**. It is located in the **root\\dcim\\sysman\\biosattributes** namespace. This class is used to return a list of all BIOS settings with an integer value. This list includes things like the power on hours and password length requirements.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p></td><td><div><p><code>$Integer</code> <code>= </code><code>Get-CimInstance</code> <code>-Namespace</code> <code>root\dcim\sysman\biosattributes</code> <code>-ClassName</code> <code>IntegerAttribute</code></p><p><code>$Integer</code> <code>| </code><code>Select-Object</code> <code>AttributeName,CurrentValue,PossibleValue</code></p><p><code>$Integer</code> <code>| </code><code>Where-Object</code> <code>AttributeName </code><code>-eq</code> <code>"AutoOnHr"</code> <code>| </code><code>Select-Object</code> <code>AttributeName,CurrentValue,PossibleValue</code></p></div></td></tr></tbody></table>

The third WMI class is **StringAttribute**. It is located in the **root\\dcim\\sysman\\biosattributes** namespace. This class is used to return a list of all BIOS settings with a string value. This list includes things like the service tag and asset tag.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p></td><td><div><p><code>$String</code> <code>= </code><code>Get-CimInstance</code> <code>-Namespace</code> <code>root\dcim\sysman\biosattributes</code> <code>-ClassName</code> <code>StringAttribute</code></p><p><code>$String</code> <code>| </code><code>Select-Object</code> <code>AttributeName,CurrentValue,PossibleValue</code></p><p><code>$String</code> <code>| </code><code>Where-Object</code> <code>AttributeName </code><code>-eq</code> <code>"SvcTag"</code> <code>| </code><code>Select-Object</code> <code>AttributeName,CurrentValue,PossibleValue</code></p></div></td></tr></tbody></table>

The fourth WMI class is **BIOSAttributeInterface**. It is located in the **root\\dcim\\sysman\\biosattributes** namespace. This class contains a method called **SetAttribute** which is used to modify BIOS settings. This class also contains a method called **SetBIOSDefaults** which can be used to set all BIOS settings to default values.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p></td><td><div><p><code>$AttributeInterface</code> <code>= </code><code>Get-WmiObject</code> <code>-Namespace</code> <code>root\dcim\sysman\biosattributes</code> <code>-Class</code> <code>BIOSAttributeInterface</code></p><p><code>$AttributeInterface</code><code>.SetAttribute(0,0,0,</code><code>"SettingName"</code><code>,</code><code>"SettingValue"</code><code>)</code></p><p><code>$AttributeInterface</code><code>.SetAttribute(1,</code><code>$Bytes</code><code>.Length,</code><code>$Bytes</code><code>,</code><code>"SettingName"</code><code>,</code><code>"SettingValue"</code><code>)</code></p><p><code>$AttributeInterface</code><code>.SetBIOSDefaults(0,0,0,2)</code></p></div></td></tr></tbody></table>

The fifth WMI class is **BootOrder**. It is located in the **root\\dcim\\sysman\\biosattributes** namespace. This class is used to return the boot order settings.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>$BootOrder</code> <code>= </code><code>Get-CimInstance</code> <code>-Namespace</code> <code>root\dcim\sysman\biosattributes</code> <code>-ClassName</code> <code>BootOrder</code></p><p><code>$BootOrder</code> <code>| </code><code>Select-Object</code> <code>BootListType,BootOrder</code></p></div></td></tr></tbody></table>

The sixth WMI class is **BootOrderInterface**. It is located in the **root\\dcim\\sysman\\biosattributes** namespace. This class contains a method called **Set** which is used to modify the boot order settings.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p></td><td><div><p><code>$BootOrderInterface</code> <code>= </code><code>Get-WmiObject</code> <code>-Namespace</code> <code>root\dcim\sysman\biosattributes</code> <code>-Class</code> <code>BootOrderInterface</code></p><p><code>$NewBootOrder</code> <code>= </code><code>"Windows Boot Manager"</code><code>,</code><code>"Onboard NIC(IPV4)"</code><code>,</code><code>"Onboard NIC(IPV6)"</code></p><p><code>$BootOrderInterface</code><code>.Set(0,0,0,</code><code>"UEFI"</code><code>,</code><code>$NewBootOrder</code><code>.Count,</code><code>$NewBootOrder</code><code>)</code></p><p><code>$BootOrderInterface</code><code>.Set(1,</code><code>$Bytes</code><code>.Length,</code><code>$Bytes</code><code>,</code><code>"UEFI"</code><code>,</code><code>$NewBootOrder</code><code>.Count,</code><code>$NewBootOrder</code><code>)</code></p></div></td></tr></tbody></table>

The seventh WMI class is **SecurityInterface**. It is located in the **root\\dcim\\sysman\\wmisecurity namespace**. This class contains a method called **SetNewPassword**. In this script this method is used to test the existing BIOS password. For more information about this class, see this post **[Dell BIOS Password Management – WMI][5]**.

### BIOS Password Encoding

The above information contains examples for modifying the BIOS with and without an existing BIOS password. When a BIOS password is set, it must first be encoded before it can be passed to a method.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>$Password</code> <code>= </code><code>"ExamplePass"</code></p><p><code>$Encoder</code> <code>= </code><code>New-Object</code> <code>System.Text.UTF8Encoding</code></p><p><code>$Bytes</code> <code>= </code><code>$Encoder</code><code>.GetBytes(</code><code>$Password</code><code>)</code></p></div></td></tr></tbody></table>

Each of the methods used to modify BIOS settings starts with 3 arguments. The 3 arguments are:

-   **The type of text**
-   **The length of the byte array**
-   **The byte array containing the encoded password**

When no password is set, these arguments are set to **0,0,0**. The type of text is 0 (None), the length of the byte array is 0, and the byte array itself is 0.

When a password is set, these arguments are set to **1,$Bytes.Length,$Bytes**. The type of text is 1 (plain text), the length of the byte array is set to $Bytes.Length, and the byte array is $Bytes.

### Status Codes

For reference, when calling the **Set** or **SetAttribute** or **SetBIOSDefaults** methods, the possible status codes are:

-   **0 – Success**
-   **1 – Failed**
-   **2 – Invalid Parameter**
-   **3 – Access Denied**
-   **4 – Not Supported**
-   **5 – Memory Error**
-   **6 – Protocol Error**

For more detailed information on the Dell WMI interface, refer to the official documentation. [**http://downloads.dell.com/manuals/common/dell-agentless-client-manageability.pdf**][6]

## Manage-DellBiosSettings-WMI.ps1

This script takes the basic commands and adds logic to allow for a more automated settings management process. The script has 7 parameters.

-   **GetSettings** – Use this parameter to instruct the script to generate a list of all current BIOS settings. The settings will be displayed on the screen by default.
-   **SetSettings** – Use this parameter to instruct the script to set specific BIOS settings. Settings can be specified either in the body of the script or from a CSV file.
-   **CsvPath** – Use this parameter to specify the location of a CSV file. If used with the GetSettings switch, this acts as the location where a list of current BIOS settings will be saved. If used with the SetSettings switch, this acts as the location where the script will read BIOS settings to be set from. Using this switch with the SetSettings switch will also cause the script to ignore any settings specified in the body of the script.
-   **AdminPassword** – Used to specify the BIOS password.
-   **SetDefaults** – Use this parameter to instruct the script to set all BIOS settings to default values. Acceptable values for this parameter are (BuiltInSafeDefaults, LastKnownGood, Factory, UserConf1, UserConf2)
-   **SetBootOrder** – Used to specify the desired boot order to be set on the system. Values should be specified in a comma separated list.
-   **BootMode** – Used to specify which boot mode the boot order should be applied to. Acceptable values for this parameter are (UEFI, Legacy)

When using the script to set settings, the list of settings can either be specified in the script itself or in a CSV file. To specify settings in the script, look for the **$Settings** array near the top of the script. The settings should be in the format of **“Setting Name,Setting Value”**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p></td><td><div><p><code>$Settings</code> <code>= (</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"FingerprintReader,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"FnLock,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"IntegratedAudio,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"NumLock,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"SecureBoot,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"TpmActivation,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"TpmClear,Disabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"TpmPpiClearOverride,Disabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"TpmPpiDpo,Disabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"TpmPpiPo,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"TpmSecurity,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"UefiNwStack,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"Virtualization,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"VtForDirectIo,Enabled"</code><code>,</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"WakeOnLan,Disabled"</code></p><p><code>)</code></p></div></td></tr></tbody></table>

A full list of configurable settings can be exported from a device by calling the script with the **GetSettings** parameter. The **CsvPath** parameter can also be specified to output the list of settings to a CSV file.

When the script runs, it will write to a log file. By default, this log file will be named **Manage-DellBiosSettings-WMI.Log**. If the script is being run during a task sequence, the log file will be located in the **\_SMSTSLogPath**. Otherwise, the log file will be located in **ProgramData\\ConfigJonScripts\\Dell**. The log file name and path can be changed using the **LogFile** parameter. Note that the log file path will always be set to **\_SMSTSLogPath** when run during a task sequence.

The script has logic built-in to detect if settings were already set correctly, were successfully set, failed to set, or were not found on the device. The script will output these counts to the screen at the end. More detailed information about the settings will be written to the log file.

![](https://www.configjon.com/wp-content/uploads/2020/02/Dell-Settings-1.png)

![](https://www.configjon.com/wp-content/uploads/2020/02/Dell-Settings-Log.png)

I have included a few example settings files in my **[GitHub][7]**. These settings files contain commonly configured Dell BIOS settings.

-   **Settings\_CSV\_SecureBoot.csv** – Contains settings for enabling UEFI and SecureBoot
-   **Settings\_CSV\_TPM.csv** – Contains settings for enabling and activating TPM
-   **Settings\_CSV\_General.csv** – Contains other common settings
-   **Settings\_In-Script\_All.txt** – Contains common settings formatted for use in the body of the script

## Examples

The script can be run as a standalone script in Windows, or as part of a Configuration Manager task sequence. It can also be run in the full Windows OS or in WinPE.

Here are a few examples of calling the script from a PowerShell prompt.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p></td><td><div><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-SetSettings</code> <code>-AdminPassword</code> <code>ExamplePassword</code></p><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-SetSettings</code> <code>-CsvPath</code> <code>C:\Temp\Settings.csv</code> <code>-AdminPassword</code> <code>ExamplePassword</code></p><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-SetDefaults</code> <code>Factory</code> <code>-AdminPassword</code> <code>ExamplePassword</code></p><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-SetBootOrder</code> <code>"Windows Boot Manager"</code><code>,</code><code>"Onboard NIC(IPV4)"</code><code>,</code><code>"Onboard NIC(IPV6)"</code> <code>-BootMode</code> <code>UEFI</code> <code>-AdminPassword</code> <code>ExamplePassword</code></p><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-SetSettings</code> <code>-SetBootOrder</code> <code>"Windows Boot Manager"</code><code>,</code><code>"Onboard NIC(IPV4)"</code><code>,</code><code>"Onboard NIC(IPV6)"</code> <code>-BootMode</code> <code>UEFI</code> <code>-AdminPassword</code> <code>ExamplePassword</code></p><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-GetSettings</code></p><p><code>Manage-DellBiosSettings-WMI.ps1</code> <code>-GetSettings</code> <code>-CsvPath</code> <code>C:\Temp\Settings.csv</code></p></div></td></tr></tbody></table>

Here is an example of calling the script during a task sequence. In this example the settings are specified in the body of the script, so the script can be stored directly in the task sequence step. Also the admin password is set, so the **AdminPassword** parameter is specified.

![](https://www.configjon.com/wp-content/uploads/2020/02/Dell-Settings-2.png)

![](https://www.configjon.com/wp-content/uploads/2020/02/Dell-Settings-3.png)

![](https://www.configjon.com/wp-content/uploads/2020/02/Dell-Settings-4.png)

In this second example, the script is being called from a package and the settings are being supplied from a CSV file.

![](https://www.configjon.com/wp-content/uploads/2020/02/Dell-Settings-5.png)

## Notes and Additional Reading

-   When booting into WinPE, the Dell WMI classes take a couple of minutes to install or initialize. Because of this, if the script fails to connect to a WMI class, it will retry every 30 seconds for 3 minutes before failing.
-   The GetSettings parameter does not write the current Boot Order to the screen or to the CSV. This information is recorded in the log file. I’m hoping to improve this functionality in the future.

For information on configuring Dell BIOS passwords using PowerShell and WMI, see my post **[Dell BIOS Password Management – WMI][8]**. If you need to support older dell hardware that does not support the WMI classes, see my other Dell posts **[Dell BIOS Password Management – PSModule][9]** and **[Dell BIOS Settings Management – PSModule][10]**. If you’re looking for other options for managing Dell BIOS settings, check out the **[Dell Command Configure][11]** utility.

[1]: https://www.configjon.com/dell-bios-settings-management/
[2]: https://www.configjon.com/working-with-the-dell-command-powershell-provider/
[3]: https://downloads.dell.com/manuals/common/dell-agentless-client-manageability.pdf
[4]: https://github.com/ConfigJon/Firmware-Management/blob/master/Dell/Manage-DellBiosSettings-WMI.ps1
[5]: https://www.configjon.com/dell-bios-password-management-wmi/
[6]: http://downloads.dell.com/manuals/common/dell-agentless-client-manageability.pdf
[7]: https://github.com/ConfigJon/Firmware-Management/tree/master/Dell
[8]: https://www.configjon.com/dell-bios-password-management-wmi/
[9]: https://www.configjon.com/dell-bios-password-management/
[10]: https://www.configjon.com/dell-bios-settings-management/
[11]: https://www.dell.com/support/article/us/en/04/sln311302/dell-command-configure?lang=en