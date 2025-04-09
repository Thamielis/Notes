https://amirsayes.co.uk/2023/02/25/using-group-managed-service-accounts-gmsas-for-powershell-remoting-a-walk-through/

> Using Group Managed Service Accounts (gMSAs) for PowerShell Remoting se Powershell Remoting with Group Managed Service Accounts for better security and passwordless access

# Using Group Managed Service Accounts (gMSAs) for PowerShell Remoting: A Walk-through - Amir Sayes
![Using Group Managed Service Accounts (gMSAs) for PowerShell Remoting: A Walk-through](https://i0.wp.com/amirsayes.co.uk/wp-content/uploads/2022/08/2022-08-17-14_01_03-Photos.png?resize=750%2C350&ssl=1 "Using Group Managed Service Accounts (gMSAs) for PowerShell Remoting: A Walk-through")

PowerShell remoting is a powerful feature that allows administrators to remotely manage Windows machines using PowerShell commands. However, managing credentials for remote access can be a challenge, especially when working with large environments that require access to many different servers. [Group Managed Service Accounts](https://learn.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/group-managed-service-accounts-overview) (gMSAs) provide a secure and easy way to manage credentials for remote access, especially when using PowerShell remoting.

In this blog post, we will walk through the steps involved in setting up and troubleshooting gMSAs for PowerShell remoting.

-   [What are Group Managed Service Accounts (gMSAs)?](https://amirsayes.co.uk/2023/02/25/using-group-managed-service-accounts-gmsas-for-powershell-remoting-a-walk-through/# "What are Group Managed Service Accounts (gMSAs)?")
-   [Setting up gMSAs for PowerShell Remoting](https://amirsayes.co.uk/2023/02/25/using-group-managed-service-accounts-gmsas-for-powershell-remoting-a-walk-through/# "Setting up gMSAs for PowerShell Remoting")
-   [Troubleshooting gMSAs for PowerShell Remoting](https://amirsayes.co.uk/2023/02/25/using-group-managed-service-accounts-gmsas-for-powershell-remoting-a-walk-through/# "Troubleshooting gMSAs for PowerShell Remoting")
-   [Conclusion](https://amirsayes.co.uk/2023/02/25/using-group-managed-service-accounts-gmsas-for-powershell-remoting-a-walk-through/# "Conclusion")

Group Managed Service Accounts (gMSAs) are a feature of Active Directory that allow managed service accounts to be shared across multiple computers. Unlike regular service accounts, which have a fixed password that needs to be changed periodically, gMSAs have an automatically managed password that is synchronized across all the computers that use the account.

This makes it much easier to manage credentials for remote access, especially when working with large environments that require access to many different servers.

## Setting up gMSAs for PowerShell Remoting

1.  Create the gMSA account in Active Directory:

To create a gMSA account, you can use the following PowerShell command as a domain admin on a host that has Active Directory Module installed

```powershell
New-ADServiceAccount -Name TestgMSA -DNSHostName testgmsa.yourdomain.com -PrincipalsAllowedToRetrieveManagedPassword "ServerFQDN"
```

In this example, a gMSA account named `TestgMSA` is created. The `DNSHostName` parameter specifies the FQDN of the domain that will host the gMSA. The `PrincipalsAllowedToRetrieveManagedPassword` parameter specifies the groups of computers that are allowed to retrieve the password for the gMSA. In this case we allow the server that we intend to remotely connect to via Powershell “ServerFQDN” to retrive the password

1.  Install the gMSA on the server(s) you want to connect to using PowerShell remoting:

To install the gMSA on a server, you need to add it to the local group called `Allowed RODC Password Replication Group`. You can use the following PowerShell command to do this.

```powershell
Add-ADComputerServiceAccount -Identity SERVER1 -ServiceAccount TestgMSA
```

In this example, the `TestgMSA` gMSA is installed on a server named `SERVER1`.

3.  Configure the PowerShell remoting endpoint to use the gMSA:

Now we move to the target server that we intend to remote into and we create a new PSSession Configuration file.

```powershell
#Run as administrator

New-PSSessionConfigurationFile -Path c:\temp\MySessionConfig.pssc -GroupManagedServiceAccount "labs\TestgMSA" -Full -Verbose
```

When creating a PowerShell Session Configuration (PSSC) file using the `New-PSSessionConfigurationFile` cmdlet with the `-Full` parameter, you will be presented with a number of options that you can configure in the generated file to define the behavior of the PSSC file. Initially many of them will be commented out. Here are the some of the options that you will see:

**ModulesToImport**: This option allows you to specify one or more PowerShell modules that will be automatically imported when the PSSC is used. For example, you might specify the `ActiveDirectory` module if your PSSC is designed to manage Active Directory.

**VisibleCmdlets**: This option allows you to specify the cmdlets that will be available to users of the PSSC. You can specify individual cmdlets, or you can use wildcards to specify multiple cmdlets at once. For example, you might allow users to run all `Get-*` cmdlets, but restrict their ability to run `Set-*` cmdlets.

**VisibleFunctions**: This option allows you to specify the functions that will be available to users of the PSSC. As with `VisibleCmdlets`, you can specify individual functions or use wildcards to specify multiple functions. For example, you might allow users to run all functions that start with `New-`, but restrict their ability to run functions that start with `Remove-`.

**VisibleAliases**: This option allows you to specify the aliases that will be available to users of the PSSC. Once again, you can specify individual aliases or use wildcards to specify multiple aliases. For example, you might allow users to use the `ls` alias to run `Get-ChildItem`, but restrict their ability to use the `rm` alias to run `Remove-Item`.

**StartupScript**: This option allows you to specify a script that will be run when the PSSC is started. This can be useful for setting up variables or functions that will be needed by users of the PSSC. For example, you might define a function that all users of the PSSC will need to use, and have it automatically loaded when the PSSC starts.

**RunAsVirtualAccount**: This option allows you to specify whether the PSSC should run as a virtual account. Virtual accounts are designed to provide a secure way to run services, and can be useful in situations where you need to isolate the PSSC from other parts of the system. **Don’t enable this when using gMSA. More on that in the troubleshooting section below.**

**SessionType**: This option allows you to specify the type of session that the PSSC will create. There are three types of sessions: `RestrictedRemoteServer`, `DefaultRemoteShell`, and `Empty`. `RestrictedRemoteServer` is the most restrictive, allowing only a limited set of cmdlets and functions to be run. `DefaultRemoteShell` is less restrictive, and allows more cmdlets and functions to be run. `Empty` is the least restrictive, and allows all cmdlets and functions to be run.

**TranscriptDirectory**: This option allows you to specify the directory where transcripts of sessions created with the PSSC should be stored. Transcripts can be useful for auditing purposes, as they provide a record of all commands run during a session.

**RoleDefinitions**: This option allows you to specify one or more roles that users can be assigned to when connecting to the PSSC. Each role can have its own set of cmdlets, functions, and aliases that are available to users assigned to that role. For example, you might create a `Helpdesk` role that only allows users to run a limited set of cmdlets and functions related to user account management.

**PrivateData**: This option allows you to specify any additional data that should be associated

This will create a new pssc file under c:\\temp that includes all possible configurations. Some of which are created with default values and you need to review each one explained above to suit your needs. For more information about each options and how to secure your configuration, [see about\_Session\_Configuration\_Files](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_session_configuration_files?view=powershell-5.1)

Next, you need to register the session configuration on the target server ensuring that the -RunAsCredential parameter is using the gMSA

![](https://i0.wp.com/amirsayes.co.uk/wp-content/uploads/2023/02/gMSA_PSSC_file.png?resize=750%2C488&ssl=1)

```powershell
Register-PSSessionConfiguration -Path "c:\temp\MySessionConfig.pssc" -Name MySessionConfig -RunAsCredential TestDomain\TestgMSA$ -ShowSecurityDescriptorUI
```

When you execute the above, you might get prompted to enter a password for the gMSA! Don’t panic!

![](https://i0.wp.com/amirsayes.co.uk/wp-content/uploads/2023/02/image.png?resize=332%2C269&ssl=1)

If you click OK on this, you may get the following warning along with pop up permissions window that allows you to specify what permissions

```powershell
WARNING: When RunAs is enabled in a Windows PowerShell session configuration, the Windows security model cannot enforce a security boundary between different user sessions that are created by using this endpoint. Verify that the W

indows PowerShell runspace configuration is restricted to only the necessary set of cmdlets and capabilities.

WARNING: Register-PSSessionConfiguration may need to restart the WinRM service if a configuration using this name has recently been unregistered, certain system data structures may still be cached. In that case, a restart of WinRM

may be required.

All WinRM sessions connected to Windows PowerShell session configurations, such as Microsoft.PowerShell and session configurations that are created with the Register-PSSessionConfiguration cmdlet, are disconnected.

  WSManConfig: Microsoft.WSMan.Management\WSMan::localhost\Plugin

Type            Keys                                Name

----            ----                                ----

Container       {Name=MySessionConfig}              MySessionConfig
```

In this Permissions popup, you set what level of permissions the user (e.g. administrator), initiating the PSSession using the pssc file would have when the session is established. For example, to run Invoke-Command cmdlet using the configuration file pssc created above, you would need at least Execute(Invoke) permissions. For simplicity, I am granting Full Control below.

![](https://i0.wp.com/amirsayes.co.uk/wp-content/uploads/2023/02/image-1.png?resize=369%2C456&ssl=1)

To configure the PowerShell remoting endpoint to use the gMSA, you can use the `Set-PSSessionConfiguration` cmdlet. Here is an example:

```powershell
Set-PSSessionConfiguration -Name Microsoft.PowerShell -RunAsCredential (Get-Credential "DOMAIN\TestgMSA") -Force
```

In this example, the `Microsoft.PowerShell` session configuration is updated to use the gMSA named `TestgMSA`. The `-`RunAsCredential parameter specifies the gMSA credentials. The `-Force` parameter forces the update even if the session configuration is in use.

1.  Test the gMSA configuration:

By default, the WinRM client (i.e., the computer initiating the PowerShell remoting session) will only allow connections to trusted remote hosts. This is a security feature designed to prevent unauthorized connections to remote hosts.

When using PowerShell remoting with a gMSA, the client must trust the remote server’s hostname or IP address in order to connect to it using WinRM. This is why you need to run the `Set-Item WSMan:\localhost\Client\TrustedHosts` command on the client side to add the server’s hostname to the trusted hosts list.

By adding the remote server’s hostname to the trusted hosts list, you are explicitly telling the WinRM client to trust connections to that server. This ensures that the client can securely connect to the remote server using PowerShell remoting with a gMSA.

```powershell
Set-Item WSMan:\localhost\Client\TrustedHosts -Value Server_Name -Force
```

To test the gMSA configuration, you can use the following PowerShell command:

```powershell
#Start a session from the client to the server using the gMSA

$session = New-PSSession -ComputerName Server_Name -ConfigurationName MySessionConfig

#test who is the user running the remote connection

Invoke-Command -Session $session {

     [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

}
```

If the test was successful, the above code should return the gMSA name. This proves that your Posh remote session context is actually using the gMSA.

## Troubleshooting gMSAs for PowerShell Remoting

Even after following the steps above, you may encounter issues when setting up and using gMSAs for PowerShell remoting. Here are some common issues and their solutions:

1.  **Prompted for a password when connecting to a remote server.** Even after passing in the gMSA as the credential parameter to the New-PSSession cmdlet, you may still be prompted for a password. One possible solution is to append a “$” character to the end of the gMSA name to indicate that no password is required.
2.  **Using a virtual account instead of the gMSA.** If the PSSessionConfiguration file has the RunAsVirtualAccount parameter set to $true, the session will run under a virtual account created by WinRM instead of the gMSA account. Setting this parameter to $false should allow the session to use the gMSA account.
3.  **Limiting the use of gMSAs to a specific user or use case.** To limit the use of gMSAs to a specific user or use case, you can configure permissions on the gMSA account itself or on the servers that the gMSA will access. You can also configure auditing to track when the gMSA is used and by whom.

By following these troubleshooting steps and best practices, you should be able to set up and use gMSAs for PowerShell remoting in a secure and efficient manner.

## Conclusion

Group Managed Service Accounts (gMSAs) are a feature of Active Directory that allow managed service accounts to be shared across multiple computers. Unlike regular service accounts, which have a fixed password that needs to be changed periodically, gMSAs have an automatically managed password that is synchronized across all the computers that use the account.
