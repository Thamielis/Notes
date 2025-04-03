---
created: 2022-03-17T18:00:52 (UTC +01:00)
tags: []
source: https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/
author: 
---

# PowerShell functions for Windows - Dennis Span

> ## Excerpt
> This page contains an overview and detailed description of all Windows functions included in the Dennis Span PowerShell function library. You can download the PowerShell module file on the main page PowerShell function library. Table of Contents Certificates Bind a certificate … Continue reading →

---
This page contains an overview and detailed description of all **Windows functions** included in the Dennis Span PowerShell function library. You can download the PowerShell module file on the main page [PowerShell function library](https://dennisspan.com/powershell-function-library/).

### **Table of Contents**

-   [Certificates](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Certificates)
    -   [Bind a certificate to an IIS port (DS\_BindCertificateToIISPort)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_BindCertificateToIISPort)
    -   [Install a certificate (DS\_InstallCertificate)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_InstallCertificate)
-   [Files and folders](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#FilesAndFolders)
    -   [Cleanup a directory (DS\_CleanupDirectory)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CleanupDirectory)
    -   [Compact a directory (DS\_CompactDirectory)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CompactDirectory)
    -   [Copy a file (DS\_CopyFile)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CopyFile)
    -   [Create a directory (DS\_CreateDirectory)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CreateDirectory)
    -   [Delete a directory (DS\_DeleteDirectory)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteDirectory)
    -   [Delete a file (DS\_DeleteFile)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteFile)
    -   [Rename a file or folder (DS\_RenameItem)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_RenameItem)
-   [Firewall](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Firewall)
    -   [Create a firewall rule (DS\_CreateFirewallRule)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CreateFirewallRule)
-   [Installations and executables](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#InstallationsAndExecutions)
    -   [Execute a process (DS\_ExecuteProcess)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_ExecuteProcess)
    -   [Install or uninstall software (DS\_InstallOrUninstallSoftware)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_InstallOrUninstallSoftware)
-   [Logging](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Logging)
    -   [Clear all main event logs (DS\_ClearAllMainEventLogs)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_ClearAllMainEventLogs)
    -   [Write log file (DS\_WriteLog)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_WriteLog)
    -   [Write an entry in the event log (DS\_WriteToEventLog)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_WriteToEventLog)
-   [Miscellaneous](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Miscellaneous)
    -   [Send an e-mail (DS\_SendMail)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_SendMail)
-   [Printing](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Printing)
    -   [Install a printer driver (DS\_InstallPrinterDriver)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_InstallPrinterDriver)
-   [Registry](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Registry)
    -   [Create a registry key (DS\_CreateRegistryKey)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CreateRegistryKey)
    -   [Delete a registry key (DS\_DeleteRegistryKey)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteRegistryKey)
    -   [Delete a registry value (DS\_DeleteRegistryValue)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteRegistryValue)
    -   [Import a registry file (DS\_ImportRegistryFile)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_ImportRegistryFile)
    -   [Rename a registry key (DS\_RenameRegistryKey)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_RenameRegistryKey)
    -   [Rename a registry value (DS\_RenameRegistryValue)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_RenameRegistryValue)
    -   [Set a registry value (DS\_SetRegistryValue)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_SetRegistryValue)
-   [Services](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#Services)
    -   [Change the startup type of a service (DS\_ChangeServiceStartupType)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_ChangeServiceStartupType)
    -   [Stop a service (DS\_StopService)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_StopService)
    -   [Stat a service (DS\_StartService)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_StartService)
-   [System](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#System)
    -   [Delete a scheduled task (DS\_DeleteScheduledTask)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteScheduledTask)
    -   [Get all schedules tasks in all subfolders (DS\_GetAllScheduledTaskSubFolders)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_GetAllScheduledTaskSubFolders)
    -   [Re-assign a drive letter (DS\_ReassignDriveLetter)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_ReassignDriveLetter)
    -   [Rename a volume label (DS\_RenameVolumeLabel)](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_RenameVolumeLabel)

### Certificates

#### DS\_BindCertificateToIISPort

Use this function to bind an SSL certification so an IIS port.

-   **Description:**  
    Bind a certificate to an IIS port.
-   **Parameters:**
    -   **URL**  
        \[Mandatory\] This parameter contains the URL (e.g. _apps.myurl.com_) of the certificate.  
        If this parameter contains the prefix _http://_ or _https://_ or any suffixes, these are automatically deleted.
    -   **Port**  
        \[Optional\] This parameter contains the port of the IIS site to which the certificate should be bound (e.g. _443_).  
        If this parameter is omitted, the value _443_ is used.
-   **Example 1:**  
    **DS\_BindCertificateToIISSite -URL "myurl.com" -Port 443**  
    Binds the certificate containing the URL 'myurl.com' to port _443_. The function automatically determines the hash value of the certificate.
-   **Example 2:**  
    **DS\_BindCertificateToIISSite -URL "anotherurl.com" -Port 12345**  
    Binds the certificate containing the URL _anotherurl.com_ to port _12345_. The function automatically determines the hash value of the certificate.

#### DS\_InstallCertificate

Use this function to install a certificate in one of the local stores. This function supports all stores (in both local machine and current user context) as well as all main certificate types, for example:

-   Certificates with private key (e.g. \*.PFX)
-   Certificates with private key and password protection
-   Root and intermediate certificates (e.g. \*.CER)
-   Wildcard certificates
-   Subject Alternative Name (SAN) certificates

Please be aware that the abbreviation of some certificate stores are different from their display name, for example:

-   CA = Intermediate Certificates Authorities
-   My = Personal
-   Root = Trusted Root Certificates Authorities
-   TrustedPublisher = Trusted Publishers

Note: use the following PowerShell command to find the names of all existing local machine certificate stores: **Get-Childitem cert:\\localmachine**.

**Description:**  
Install a certificate. This can be any type of certificate, such as root certificates, intermediate certificates and personal certificates. Also, most formats are supported, such as CER and PFX as well as certificates that include a password.

-   **Parameters:**
    -   **StoreScope**  
        This parameter determines whether the local machine or the current user store is to be used (possible values are: CurrentUser | LocalMachine).
    -   **StoreName**  
        This parameter contains the name of the store (possible values are: CA | My, Root | TrustedPublisher and more).
    -   **CertFile**  
        This parameter contains the name, including path and file extension, of the certificate file (e.g. _C:\\MyCert.cer_).
    -   **CertPassword**  
        This parameter is optional and is required in case the exported certificate is password protected. The password has to be parsed as a secure-string  
        For more information see the article [Encrypting passwords in a PowerShell script](https://dennisspan.com/encrypting-passwords-in-a-powershell-script/).
-   **Example 1:**  
    **DS\_InstallCertificate -StoreScope "LocalMachine" -StoreName "Root" -CertFile "C:\\Temp\\MyRootCert.cer"**  
    Installs the root certificate _MyRootCert.cer_ in the Trusted Root Certificates Authorities store of the local machine.
-   **Example 2:**  
    **DS\_InstallCertificate -StoreScope "LocalMachine" -StoreName "CA" -CertFile "C:\\Temp\\MyIntermediateCert.cer"**  
    Installs the intermediate certificate _MyIntermediateCert.cer_ in the Intermediate Certificates Authorities store of the local machine.
-   **Example 3:  
    ****$Password = "mypassword" | ConvertTo-SecureString -AsPlainText -Force  
    DS\_InstallCertificate -StoreScope "LocalMachine" -StoreName "My" -CertFile "C:\\Temp\\MyServerCert.pfx" -CertPassword $Password**  
    Installs the password protected certificate _MyServerCert.pfx_ in the Personal store of the local machine. The password has to be parsed as a secure-string. See my article [Encrypting passwords in a PowerShell script](https://dennisspan.com/encrypting-passwords-in-a-powershell-script/) for more information.
-   **Example 4:  
    ****$Password = "mypassword" | ConvertTo-SecureString -AsPlainText -Force**  
    **DS\_InstallCertificate -StoreScope "CurrentUser" -StoreName "My" -CertFile "C:\\Temp\\MyUserCert.pfx" -CertPassword $Password**  
    Installs the password protected certificate _MyUserCert.pfx_ in the Personal store of the current user. The password has to be parsed as a secure-string. See my article [Encrypting passwords in a PowerShell script](https://dennisspan.com/encrypting-passwords-in-a-powershell-script/) for more information.

### Files and folders

#### DS\_CleanupDirectory

Use this function to delete all files and subfolders within a give directory without deleting the main directory itself.

-   **Description:**  
    Delete all files and subfolders in one specific directory, but do not delete the main folder itself.
-   **Parameter:**
    -   **Directory**  
        This parameter contains the full path to the directory that needs to cleaned (for example _C:\\Temp_).
-   **Example:**  
    **DS\_CleanupDirectory -Directory "C:\\Temp"**  
    Deletes all files and subfolders in the directory _C:\\Temp_. The directory _C:\\Temp_ itself is NOT deleted.

Related functions:

-   [DS\_DeleteFile](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteFile)
-   [DS\_DeleteDirectory](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteDirectory)

#### DS\_CompactDirectory

Use this function to compact a directory in order to save space. This function uses the _compact.exe_ in the directory _%WinDir%\\System32_.

-   **Description:**  
    Execute a process
-   **Parameter:**
    -   **Directory**  
        This parameter contains the full path to the directory that needs to be compacted (for example _C:\\Windows\\WinSxS_).
-   **Example:**  
    **DS\_CompactDirectory -Directory "C:\\Windows\\WinSxS"**  
    Compacts the directory _C:\\Windows\\WinSxS._

#### DS\_CopyFile

Use this function to copy one or more files.

-   **Description:**  
    Copy one or more files
-   **Parameters:**
    -   **SourceFiles**  
        This parameter can contain multiple file and folder combinations including wildcards. UNC paths can be used as well. Please see the examples for more information.  
        To see the examples, please enter the following PowerShell command: _Get-Help DS\_CopyFile -examples_
    -   **Destination**  
        This parameter contains the destination path (for example _C:\\Temp2_ or _C:\\MyPath\\MyApp_). This path may also include a file name.  
        This situation occurs when a single file is copied to another directory and renamed in the process (for example _$Destination = C:\\Temp2\\MyNewFile.txt_).  
        UNC paths can be used as well. The destination directory is automatically created if it does not exist (in this case the function [DS\_CreateDirectory](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CreateDirectory) is called).  
        This works both with local and network (UNC) directories. In case the variable $Destination contains a path and a file name, the parent folder is  
        automatically extracted, checked and created if needed.  
        Please see the examples for more information.To see the examples, please enter the following PowerShell command: _Get-Help DS\_CopyFile -examples_
-   **Example 1:**  
    **DS\_CopyFile -SourceFiles "C:\\Temp\\MyFile.txt" -Destination "C:\\Temp2"**  
    Copies the file _C:\\Temp\\MyFile.txt_ to the directory _C:\\Temp2_.
-   **Example 2:**  
    **DS\_CopyFile -SourceFiles "C:\\Temp\\MyFile.txt" -Destination "C:\\Temp2\\MyNewFileName.txt"**  
    Copies the file _C:\\Temp\\MyFile.txt_ to the directory _C:\\Temp2_ and renames the file to _MyNewFileName.txt_.
-   **Example 3:**  
    **DS\_CopyFile -SourceFiles "C:\\Temp\\\*.txt" -Destination "C:\\Temp2"**  
    Copies all files with the file extension _\*.txt_ in the directory _C:\\Temp_ to the destination directory _C:\\Temp2_.
-   **Example 4:**  
    **DS\_CopyFile -SourceFiles "C:\\Temp\\\*.\*" -Destination "C:\\Temp2"**  
    Copies all files within the root directory _C:\\Temp_ to the destination directory _C:\\Temp2_. Subfolders (including files within these subfolders) are NOT copied.
-   **Example 5:**  
    **DS\_CopyFile -SourceFiles "C:\\Temp\\\*" -Destination "C:\\Temp2"**  
    Copies all files in the directory _C:\\Temp_ to the destination directory _C:\\Temp2_. Subfolders as well as files within these subfolders are also copied.
-   **Example 6:**  
    **DS\_CopyFile -SourceFiles "C:\\Temp\\\*.txt" -Destination "\\\\localhost\\Temp2"**  
    Copies all files with the file extension _\*.txt_ in the directory _C:\\Temp_ to the destination directory _\\\\localhost\\Temp2_. The directory in this example is a network directory (UNC path).

#### DS\_CreateDirectory

Use this function to create a new directory.

-   **Description:**  
    Create a new directory.
-   **Parameter:**
    -   **Directory**  
        This parameter contains the name of the new directory including the full path (for example _C:\\Temp\\MyNewFolder_).
-   **Example:**  
    **DS\_CreateDirectory -Directory "C:\\Temp\\MyNewFolder"**  
    Creates the new directory _C:\\Temp\\MyNewFolder_.

#### DS\_DeleteDirectory

Use this function to delete a directory including all files, subfolders and files within subfolders.

-   **Description:**  
    Delete a directory.
-   **Parameter:**
    -   **Directory**  
        This parameter contains the full path to the directory which needs to be deleted (for example _C:\\Temp\\MyFolder_).
-   **Example:**  
    **DS\_DeleteDirectory -Directory "C:\\Temp\\MyFolder"**  
    Deletes the directory _C:\\Temp\\MyFolder_ including all subfolders and files contained within those subfolders.

Related functions:

-   [DS\_DeleteFile](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteFile)
-   [DS\_CleanupDirectory](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CleanupDirectory)

#### DS\_DeleteFile

Use this function to delete a single file or multiple files within one directory.

-   **Description:**  
    Delete a file.
-   **Parameter:**
    -   **File**  
        This parameter contains the full path to the file (including the file name and file extension) that needs to be deleted (for example _C:\\Temp\\MyFile.txt_).
-   **Example 1:**  
    **DS\_DeleteFile -File "C:\\Temp\\MyFile.txt"**  
    Deletes the file "C:\\Temp\\MyFile.txt".
-   **Example 2:**  
    **DS\_DeleteFile -File "C:\\Temp\\\*.txt"**  
    Deletes all files in the directory _C:\\Temp_ that have the file extension _\*.txt_. _\*.txt_ files stored within subfolders of _C:\\Temp_ are NOT deleted.
-   **Example 3:**  
    **DS\_DeleteFile -File "C:\\Temp\\\*.\*"**  
    Deletes all files in the directory _C:\\Temp_. This function does NOT remove any subfolders nor files within a subfolder (use the function [DS\_CleanupDirectory](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CleanupDirectory) instead).

Related functions:

-   [DS\_DeleteDirectory](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteDirectory)
-   [DS\_CleanupDirectory](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_CleanupDirectory)

#### DS\_RenameItem

Use this function to rename files and folders. Regarding files, not only the name, but also the file extension can be renamed.

-   **Description:**  
    Rename files and folders.
-   **Parameter:**
    -   **ItemPath**  
        This parameter contains the full path to the file or folder that needs to be renamed (for example _C:\\Temp\\MyOldFileName.txt_ or _C:\\Temp\\MyOldFolderName_).
    -   **NewName**  
        This parameter contains the new name of the file or folder (for example _MyNewFileName.txt_ or _MyNewFolderName_).
-   **Example 1:**  
    **DS\_RenameItem -ItemPath "C:\\Temp\\MyOldFileName.txt" -NewName "MyNewFileName.txt"**  
    Renames the file _C:\\Temp\\MyOldFileName.txt_ to _MyNewFileName.txt_. The parameter _NewName_ only requires the new file name without specifying the path to the file.
-   **Example 2:**  
    **DS\_RenameItem -ItemPath "C:\\Temp\\MyOldFileName.txt" -NewName "MyNewFileName.rtf"**  
    Renames the file _C:\\Temp\\MyOldFileName.txt_ to _MyNewFileName.rtf_. Besides changing the name of the file, the file extension is modified as well. Please make sure that the new file format is compatible with the original file format and can actually be opened after being renamed! The parameter _NewName_ only requires the new file name without specifying the path to the file.
-   **Example 3:**  
    **DS\_RenameItem -ItemPath "C:\\Temp\\MyOldFolderName" -NewName "MyNewFolderName"**  
    Renames the folder _C:\\Temp\\MyOldFolderName_ to _C:\\Temp\\MyNewFolderName_. The parameter _NewName_ only requires the new folder name without specifying the path to the folder.

### Firewall

#### DS\_CreateFirewallRule

Use this function to create a firewall rule on the local machine. This function uses the _NetSh_ command when the operating system Windows Server 2008 (R2) or Windows 7 is detected. For operating systems from Windows Server 2012 and later, the PowerShell cmdlet _New-NetFirewallRule_ is used. The firewall profile is automatically set to _any_.

-   **Description:**  
    Create a firewall rule on the local machine.
-   **Parameters:**
    -   **Name**  
        This parameter contains the name of the firewall rule (the name must be unique and cannot be _All_). The parameter name is used for both the _name_ as well as the _display name_.
    -   **Description**  
        This parameter contains the description of the firewall rule. The description can be an empty string.
    -   **Ports**  
        This parameter contains the port or ports which should be allowed or denied. Possible notations are:
        -   Example 1: 80,81,82,90,93
        -   Example 2: 80-82,90,93
    -   **Protocol**  
        This parameter contains the name of the protocol. The most used options are _TCP_ or _UDP_, but more options are available.
    -   **Direction**  
        This parameter contains the direction. Possible options are _Inbound_ or _Outbound_.
    -   **Action**  
        This parameter contains the action. Possible options are _Allow_ or _Block_.
-   **Example:**  
    **DS\_CreateFirewallRule -Name "Citrix example firewall rules" -Description "Examples firewall rules for Citrix" -Ports "80-82,99" -Protocol "UDP" -Direction "Inbound" -Action "Allow"**  
    Creates an inbound firewall rule for the UDP protocol.

### Installations and executables

#### DS\_ExecuteProcess

Use this function to execute a process. To install or uninstall an executable or MSI package use the function [DS\_InstallOrUninstallSoftware](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_InstallOrUninstallSoftware).

-   **Description:**  
    Execute a process.
-   **Parameters:**
    -   **FileName**  
        This parameter contains the full path including the file name and file extension of the executable (for example _C:\\Temp\\MyApp.exe_).
    -   **Arguments**  
        This parameter contains the list of arguments to be executed together with the executable.
-   **Example:**  
    **DS\_ExecuteProcess -FileName "C:\\Temp\\MyApp.exe" -Arguments "-silent"**  
    Executes the file _MyApp.exe_ with arguments _\-silent_.

#### DS\_InstallOrUninstallSoftware

Install or uninstall an executable file (setup.exe) or MSI package.

-   **Description:**  
    Install or uninstall software (MSI or SETUP.exe)
-   **Parameters:**
    -   **File**  
        This parameter contains the file name including the path and file extension, for example _C:\\Temp\\MyApp\\Files\\MyApp.msi_ or _C:\\Temp\\MyApp\\Files\\MyApp.exe_.
    -   **Installationtype**  
        This parameter contains the installation type, which is either _Install_ or _Uninstall_.
    -   **Arguments**  
        This parameter contains the command line arguments. The arguments list can remain empty. In case of an MSI, the following parameters are automatically included in the function and do not have  
        to be specified in the _Arguments_ parameter:
        -   For installations: **/i /qn /norestart /l\*v "c:\\Logs\\MyLogFile.log"**
        -   For uninstallations: **/x /qn /norestart /l\*v "c:\\Logs\\MyLogFile.log"**
-   **Example 1:**  
    **DS\_InstallOrUninstallSoftware -File "C:\\Temp\\MyApp\\Files\\MyApp.msi" -InstallationType "Install" -Arguments ""**  
    Installs the MSI package _MyApp.msi_ with no arguments (the function already includes the following default arguments: _/i /qn /norestart /l\*v $LogFile_).
-   **Example 2:**  
    **DS\_InstallOrUninstallSoftware -File "C:\\Temp\\MyApp\\Files\\MyApp.msi" -InstallationType "Uninstall" -Arguments ""**  
    Uninstalls the MSI package _MyApp.msi_ (the function already includes the following default arguments: _/x /qn /norestart /l\*v $LogFile_).
-   **Example 3:**  
    **DS\_InstallOrUninstallSoftware -File "C:\\Temp\\MyApp\\Files\\MyApp.exe" -InstallationType "Install" -Arguments "/silent /logfile:C:\\Logs\\MyApp\\log.log"**  
    Installs the SETUP file _MyApp.exe_.

### Logging

#### DS\_ClearAllMainEventLogs

Use this function to clear all events logs found on the local operating system. One instance where you may use this function is when you are preparing a new master image. Execute this function as one of the last tasks.

-   **Description:**  
    Clear all main event logs.
-   **Example:**  
    **DS\_ClearAllMainEventLogs**  
    Loops through all event logs on the local system and clears (deletes) all entries in each of the logs founds.

#### DS\_WriteLog

Use this function to write lines to the main log file. This function is also used by all other functions. If no log file is specified, a default log file _C.\\Logs\\DefaultLogFile\_%Date%\_%Time%.log_ is created. Also the directory _C:\\Logs_ is created if it does not exist.

-   **Description:**  
    Write text to this script's log file.
-   **Parameters:**
    -   **InformationType**  
        This parameter contains the information type prefix. Possible prefixes and information types are:  
        I = Information  
        S = Success  
        W = Warning  
        E = Error  
        \- = No status
    -   **Text**  
        This parameter contains the text (the line) you want to write to the log file. If text in the parameter is omitted, an empty line is written.
    -   **LogFile**  
        This parameter contains the full path, the file name and file extension to the log file (e.g. _C:\\Logs\\MyApps\\MylogFile.log_)
-   **Example 1:**  
    **DS\_WriteLog -InformationType "I" -Text "Copy files to C:\\Temp" -LogFile "C:\\Logs\\MylogFile.log"**  
    Writes a line containing information to the log file.
-   **Example 2:**  
    **DS\_WriteLog -InformationType "E" -Text "An error occurred trying to copy files to C:\\Temp (error: $($Error\[0\]))" -LogFile "C:\\Logs\\MylogFile.log"**  
    Writes a line containing error information to the log file.
-   **Example 3:**  
    **DS\_WriteLog -InformationType "-" -Text "" -LogFile "C:\\Logs\\MylogFile.log"**  
    Writes an empty line to the log file.

#### DS\_WriteToEventLog

Use this function to write an entry to a specific event log. An entry can be of the type _Information_, _Warning_ or _Error_. This function also automatically creates new event logs in case a non-existing event log has been defined. The same goes for unknown event sources; these are also automatically created in case they do not exist.

-   **Description:**  
    Write an entry into the Windows event log. New event logs as well as new event sources are automatically created.
-   **Parameters:**
    -   **EventLog**  
        This parameter contains the name of the event log the entry should be written to (e.g. Application, Security, System or a custom one).
    -   **Source**  
        This parameter contains the source (e.g. _MyScript_).
    -   **EventID**  
        This parameter contains the event ID number (e.g. 3000).
    -   **Type**  
        This parameter contains the type of message. Possible values are: Information | Warning | Error
    -   **Message**  
        This parameter contains the event log description explaining the issue.
-   **Example 1:**  
    **DS\_WriteToEventLog -EventLog "System" -Source "MyScript" -EventID "3000" -Type "Error" -Message "An error occurred"**  
    Write an error message to the _System_ event log with the source _MyScript_ and event ID 3000. The unknown source _MyScript_ is automatically created.
-   **Example 2:**  
    **DS\_WriteToEventLog -EventLog "Application" -Source "Something" -EventID "250" -Type "Information" -Message "Information: action completed successfully"**  
    Write an information message to the _Application_ event log with the source _Something_ and event ID 250. The unknown source _Something_ is automatically created.
-   **Example 3:**  
    **DS\_WriteToEventLog -EventLog "MyNewEventLog" -Source "MyScript" -EventID "1000" -Type "Warning" -Message "Warning. There seems to be an issue"**  
    Write an warning message to the event log called _MyNewEventLog_ with the source _MyScript_ and event ID 1000. The unknown event log _MyNewEventLog and_ source _MyScript_ are automatically created.

### Miscellaneous

#### DS\_SendMail

Use this function to send an e-mail to one or more recipients. This function does not include the option to attach a file.

-   **Description:**  
    Send an e-mail
-   **Parameters:**
    -   **Sender**  
        This parameter contains the e-mail address of the sender (e.g. _mymail@mydomain.com_).
    -   **Recipients**  
        This parameter contains the e-mail address or addresses of the recipients, for example:
        -   One recipient: <name>@mycompany.com"
        -   Multiple recipients: "<name>@mycompany.com", "<name>@mycompany.com")
    -   **Subject**  
        This parameter contains the subject of the e-mail.
    -   **Text**  
        This parameter contains the body (= content / text) of the e-mail.
    -   **SMTPServer**  
        This parameter contains the name or the IP-address of the SMTP server (e.g. _smtp.mycompany.com_ or _192.168.0.110_).
-   **Example 1:**  
    **DS\_SendMail -Sender "me@mycompany.com" -Recipients "someone@mycompany.com" -Subject "Something important" -Text "This is the text for the e-mail" -SMTPServer "smtp.mycompany.com"**  
    Sends an e-mail to one recipient.
-   **Example 2:**  
    **DS\_SendMail -Sender "me@mycompany.com" -Recipients "someone@mycompany.com","someoneelse@mycompany.com" -Subject "Something important" -Text "This is the text for the e-mail" -SMTPServer "smtp.mycompany.com"**  
    Sends an e-mail to two recipients.
-   **Example 3:**  
    **DS\_SendMail -Sender "Dennis Span <me@mycompany.com>" -Recipients "someone@mycompany.com","someoneelse@mycompany.com" -Subject "Something important" -Text "This is the text for the e-mail" -SMTPServer "smtp.mycompany.com"**  
    Sends an e-mail to two recipients with the sender's name included in the sender's e-mail address.
-   **Example 4:**  
    **DS\_SendMail -Sender "Error report <me@mycompany.com>" -Recipients "someone@mycompany.com","someoneelse@mycompany.com" -Subject "Something important" -Text "This is the text for the e-mail" -SMTPServer "smtp.mycompany.com"**  
    Sends an e-mail to two recipients with a description included in the sender's e-mail address.

### Printing

#### DS\_InstallPrinterDriver

Use this function to install a printer driver. For a better understanding of printer drivers, please see my article [Printer Drivers Installation and Troubleshooting Guide](https://dennisspan.com/printer-drivers-installation-and-troubleshooting-guide/).

-   **Description:**  
    Install a Windows printer driver.
-   **Parameters:**
    -   **Name**  
        This parameter contains the name of the printer driver as found in the accompanying INF file, for example _HP Universal Printing PCL 6 (v5.5.0)_.
    -   **Path**  
        This parameter contains the path to the printer driver, for example _C:\\Temp\\PrinterDrivers\\HP\\UP\_PCL6_.
    -   **INF\_Name**  
        This parameter contains the name of the INF file located within the directory defined in the variable _Path_, for example _hpcu130u.INF_.
-   **Example:**  
    **DS\_InstallPrinterDriver -Name "HP Universal Printing PCL 6 (v5.5.0)" -Path "C:\\Temp\\PrinterDrivers\\HP\\UP\_PCL6" -INF\_Name "hpcu130u.INF"**  
    Installs the printer driver _HP Universal Printing PCL 6 (v5.5.0)_ using the file in the directory _C:\\Temp\\PrinterDrivers\\HP\\UP\_PCL6_.

### Registry

#### DS\_CreateRegistryKey

Use this function to create a new registry key. This function is also used by the function [DS\_SetRegistryValue](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_SetRegistryValue) in case the specified registry key does not exist.

-   **Description:**  
    Create a registry key.
-   **Parameter:**
    -   **RegKeyPath**  
        This parameter contains the registry path, for example _hklm:\\Software\\MyApp_.
-   **Example:**  
    **DS\_CreateRegistryKey -RegKeyPath "hklm:\\Software\\MyApp"**  
    Creates the new registry key _hklm:\\Software\\MyApp_.

#### DS\_DeleteRegistryKey

Use this function to delete a registry key.

-   **Description:**  
    Delete a registry key.
-   **Parameter:**
    -   **RegKeyPath**  
        This parameter contains the registry path, for example _hklm:\\Software\\MyApp_.
-   **Example:**  
    **DS\_DeleteRegistryKey -RegKeyPath "hklm:\\Software\\MyApp"**  
    Deletes the registry key _hklm:\\Software\\MyApp_.

#### DS\_DeleteRegistryValue

Use this function to delete a registry value. This can be a value of any type such as _REG\_SZ_ (= string), _DWORD_, _binary_, etc.

-   **Description:**  
    Delete a registry value. This can be a value of any type (e.g. _REG\_SZ_, _DWORD_, etc.).
-   **Parameters:**
    -   **RegKeyPath**  
        This parameter contains the registry path (for example _hklm:\\SOFTWARE\\MyApp_)
    -   **RegValueName**  
        This parameter contains the name of the registry value that is to be deleted (for example _MyValue_).
-   **Example:**  
    **DS\_DeleteRegistryValue -RegKeyPath "hklm:\\SOFTWARE\\MyApp" -RegValueName "MyValue"**  
    Deletes the registry value _MyValue_ from the registry key _hklm:\\SOFTWARE\\MyApp_.

#### DS\_ImportRegistryFile

Use this function to import a registry file (\*.reg).

-   **Description:**  
    Import a registry (\*.reg) file into the registry.
-   **Parameter:**
    -   **FileName**  
        This parameter contains the full path, file name and file extension of the registry file, for example _C:\\Temp\\MyRegFile.reg_.
-   **Example:**  
    **DS\_ImportRegistryFile -FileName "C:\\Temp\\MyRegFile.reg"**  
    Imports registry settings from the file _C:\\Temp\\MyRegFile.reg_.

#### DS\_RenameRegistryKey

Use this function to rename a registry key.

-   **Description:**  
    Rename a registry key.
-   **Parameters:**
    -   **RegKeyPath**  
        This parameter contains the registry path that needs to be renamed (for example _hklm:\\Software\\MyRegKey_).
    -   **NewName**  
        This parameter contains the new name of the last part of the registry path that is to be renamed (for example _MyRegKeyNew_).
-   **Example:**  
    **DS\_RenameRegistryKey -RegKeyPath "hklm:\\Software\\MyRegKey" -NewName "MyRegKeyNew"**  
    Renames the registry path _hklm:\\Software\\MyRegKey_ to _hklm:\\Software\\MyRegKeyNew_. The parameter _NewName_ only requires the last part of the registry path without specifying the entire registry path.

#### DS\_RenameRegistryValue

Use this function to rename a registry value (any data type).

-   **Description:**  
    Rename a registry value (all data types).
-   **Parameters:**
    -   **RegKeyPath**  
        This parameter contains the full registry path (for example _hklm:\\SOFTWARE\\MyApp_).
    -   **RegValueName**  
        This parameter contains the name of the registry value that needs to be renamed (for example _MyRegistryValue_).
    -   **NewName**  
        This parameter contains the new name of the registry value that is to be renamed (for example _MyRegistryValueNewName_)
-   **Example:**  
    **DS\_RenameRegistryValue -RegKeyPath "hklm:\\Software\\MyRegKey" -RegValueName "MyRegistryValue" -NewName "MyRegistryValueNewName"**  
    Renames the registry value _MyRegistryValue_ in the registry key _hklm:\\Software\\MyRegKey_ to _MyRegistryValueNewName_.

#### DS\_SetRegistryValue

Use this function to create a registry value. All, or at least almost all, data types are supported, such as _String_, _Binary_, _DWORD_, _QWORD_, _MultiString_ and _ExpandString_.

-   **Description:**  
    Set a registry value.
-   **Parameters:**
    -   **RegKeyPath**  
        This parameter contains the registry path, for example _hklm:\\Software\\MyApp_.
    -   **RegValueName**  
        This parameter contains the name of the new registry value, for example _MyValue_.
    -   **RegValue**  
        This parameter contains the value of the new registry entry, for example _1_.
    -   **Type**  
        This parameter contains the type. Possible options are:  
        String | Binary | DWORD | QWORD | MultiString | ExpandString.
-   **Example 1:**  
    **DS\_SetRegistryValue -RegKeyPath "hklm:\\Software\\MyApp" -RegValueName "MyStringValue" -RegValue "Enabled" -Type "String"**  
    Creates a new string value called _MyStringValue_ with the value of _Enabled_
-   **Example 2:**  
    **DS\_SetRegistryValue -RegKeyPath "hklm:\\Software\\MyApp" -RegValueName "MyBinaryValue" -RegValue "01" -Type "Binary"**  
    Creates a new binary value called _MyBinaryValue_ with the value of _01_
-   **Example 3:**  
    **DS\_SetRegistryValue -RegKeyPath "hklm:\\Software\\MyApp" -RegValueName "MyDWORDValue" -RegValue "1" -Type "DWORD"**  
    Creates a new DWORD value called _MyDWORDValue_ with the value of _00000001_ (or simply _1_).
-   **Example 4:**  
    **DS\_SetRegistryValue -RegKeyPath "hklm:\\Software\\MyApp" -RegValueName "MyQWORDValue" -RegValue "1" -Type "QWORD"**  
    Creates a new QWORD value called _MyQWORDValue_ with the value of _1_.
-   **Example 5:**  
    **DS\_SetRegistryValue -RegKeyPath "hklm:\\Software\\MyApp" -RegValueName "MyMultiStringValue" -RegValue "Value1","Value2","Value3" -Type "MultiString"**  
    Creates a new multistring value called _MyMultiStringValue_ with the value of _Value1 Value2 Value3_.
-   **Example 6:**  
    **DS\_SetRegistryValue -RegKeyPath "hklm:\\Software\\MyApp" -RegValueName "MyExpandStringValue" -RegValue "MyValue" -Type "ExpandString"**  
    Creates a new expandstring value called _MyExpandStringValue_ with the value of _MyValue_.

### Services

#### DS\_ChangeServiceStartupType

Use this function to change the startup type of a service.

-   **Description:**  
    Change the startup type of a service.
-   **Parameters:**
    -   **ServiceName**  
        This parameter contains the name of the service (not the display name!) to stop, for example _Spooler_ or _TermService_. Depend services are stopped automatically as well.
    -   **StartupType**  
        This parameter contains the required startup type of the service (possible values are: Boot | System | Automatic | Manual | Disabled.
-   **Example 1:**  
    **DS\_ChangeServiceStartupType -ServiceName "Spooler" -StartupType "Disabled"**  
    Disables the service _Spooler_ (display name: _Print Spooler_).
-   **Example 2:**  
    **DS\_ChangeServiceStartupType -ServiceName "Spooler" -StartupType "Manual"**  
    Sets the startup type of the service _Spooler_ to _manual_ (display name: _Print Spooler_).

#### DS\_StopService

Use this function to stop a service. This function also automatically stops all depend services.

-   **Description:**  
    Stop a service (including depend services).
-   **Parameter:**
    -   **ServiceName**  
        This parameter contains the name of the service (not the display name!) to stop, for example _Spooler_ or _TermService_. Depend services are stopped automatically as well. Depend services do not need to be specified separately. The function will retrieve them automatically.
-   **Example:**  
    **DS\_StopService -ServiceName "Spooler"**  
    Stops the service _Spooler_ (display name: _Print Spooler_).

#### DS\_StartService

Use this function to start a service. This function also automatically starts all depend services.

-   **Description:**  
    Starts a service (including depend services).
-   **Parameter:**
    -   **ServiceName:**  
        This parameter contains the name of the service (not the display name!) to start, for example _Spooler_ or _TermService_. Depend services are started automatically as well. Depend services do not need to be specified separately. The function will retrieve them automatically.
-   **Example:**  
    **DS\_StartService -ServiceName "Spooler"**  
    Starts the service _Spooler_ (display name: _Print Spooler_).

### System

#### DS\_DeleteScheduledTask

Use this function to delete a scheduled tasks on the local machine. Only the name of the tasks needs to be specified. The function, or rather, a second function called [DS\_GetAllScheduledTaskSubFolders](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_GetAllScheduledTaskSubFolders), scans all scheduled tasks on the local system (including those residing in subfolders). So there is no need for you to indicate a subfolder.  
This function is based on a PowerShell script I found in the Microsoft Script Center repository ([Get scheduled tasks from remote computer](https://gallery.technet.microsoft.com/scriptcenter/Get-Scheduled-tasks-from-3a377294)) by Microsoft MVP [Jaap Brasser](https://twitter.com/Jaap_Brasser).

-   **Description:**  
    Delete a scheduled task.
-   **Parameter:**
    -   **Name**  
        This parameter contains the name of the scheduled task that is to be deleted.
-   **Example:**  
    **DS\_DeleteScheduledTask -Name "GoogleUpdateTaskMachineCore"**  
    Deletes the scheduled task _GoogleUpdateTaskMachineCore_.

#### DS\_GetAllScheduledTaskSubFolders

This function enumerates all schedules tasks on the local system (including tasks residing in subfolders). It is not to be used as a stand-alone function. This function is called by the function [DS\_DeleteScheduledTask](https://dennisspan.com/powershell-function-library/powershell-functions-for-windows/#DS_DeleteScheduledTask).  
This function is based on a PowerShell script I found in the Microsoft Script Center repository ([Get scheduled tasks from remote computer](https://gallery.technet.microsoft.com/scriptcenter/Get-Scheduled-tasks-from-3a377294)) by Microsoft MVP [Jaap Brasser](https://twitter.com/Jaap_Brasser).

#### DS\_ReassignDriveLetter

Use this function to re-assign an existing drive letter to a new drive letter.

-   **Description:**  
    Re-assign an existing drive letter to a new drive letter.
-   **Parameters:**
    -   **CurrentDriveLetter**  
        This parameter contains the drive letter that needs to be re-assigned.
    -   **NewDriveLetter**  
        This parameter contains the new drive letter that needs to be assigned to the current drive letter.
-   **Example:**  
    **DS\_ReassignDriveLetter -CurrentDriveLetter "D:" -NewDriveLetter "Z:"**  
    Re-assigns drive letter D: to drive letter Z:.

#### DS\_RenameVolumeLabel

Use this function to rename the label of an existing volume.

-   **Description:**  
    Rename the volume label of an existing volume.
-   **Parameters:**
    -   **DriveLetter**  
        This parameter contains the drive letter of the volume that needs to be renamed.
    -   **NewVolumeLabel**  
        This parameter contains the new name for the volume.
-   **Example:**  
    **DS\_RenameVolumeLabel -DriveLetter "C:" -NewVolumeLabel "SYSTEM"**  
    Renames the volume connected to drive _C:_ to _SYSTEM_.
