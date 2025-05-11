In this post, I want to show you how to create and use Group managed service accounts (gMSA). Before starting, I would like to identify the basic concepts and requirements.

#### **Basic concepts** [#][1]

-   They can be used only on Servers running Windows Server 2012 or later.
-   You can use the same Managed service account across multiple servers.
-   Managed group service accounts are stored in the managed service account container of the active directory.

#### **Requirements** [#][2]

-   Microsoft Active Directory must be present.
-   Extend your Active Directory schema to Windows Server 2008 R2.
-   Microsoft .Net framework 3.5 or above.
-   [_PowerShell Active Directory module_.][3]
-   At least one domain controller in the domain must be running Windows Server 2012.
-   _[Microsoft Key Distribution Service up and running][4]_.
-   Only members of Domain Admins or Account Operators groups can create a group managed service account objects.

All cleared. Now we can start.

#### **Create the Managed Service Account in Active Directory** [#][5]

To create a gMSA with PowerShell, use the **New-ADServiceAccount** cmdlet with the following syntax:

```powershell
New-ADServiceAccount ` -Name <String> ` -Description <String> ` -DNSHostName <String> ` -ManagedPasswordIntervalInDays <Int32> ` -PrincipalsAllowedToRetrieveManagedPassword <ADPrincipal[]> ` -Enabled $True | $False ` -PassThru
```

Run the following PowerShell command as administrator. The correct execution of the command returns the active directory object.

![new-adserviceaccount](How%20to%20create%20a%20Group%20Managed%20Service%20Accounts%20(gMSA)/new-adserviceaccount.PS_-e1539868499924_huf349a6856845c639ea14e0022060dd47_52705_850x0_resize_box_3.png)

As mentioned above, The new gMSA is located in the Managed Service Accounts container.

![mmc](How%20to%20create%20a%20Group%20Managed%20Service%20Accounts%20(gMSA)/ADgMSA.mmc__hu662203b1fb84ad0144c3d4478980c590_30508_850x0_resize_box_3.png)

#### **Parameters** [#][6]

-   **_\-DNSHostName_** Defines the DNS hostname of service.
-   **_\-ManagedPasswordIntervalInDays_** Specifies the number of days for the password change interval.
-   **_\-PrincipalsAllowedToRetrieveManagedPassword_** Specifies the group of servers that can use a group managed service account. If the group defined in this parameter has been created by you, it is important to restart the host before installing the gMSA.

#### **Install the** gMSA **on the host** [#][7]

The Install-ADServiceAccount cmdlet installs an existing gMSA on the server on which the cmdlet is run. Use the cmdlet with the following syntax:

```powershell
Install-ADServiceAccount ` -Identity <ADServiceAccount>
```

Run the following PowerShell commands as administrator.

![install-adserviceaccount](How%20to%20create%20a%20Group%20Managed%20Service%20Accounts%20(gMSA)/install-adserviceaccount.PS_-e1539978497786_hube868959d80c0e89c48e9c245bfabeca_13854_850x0_resize_box_3.png)

The Test-ADServiceAccount cmdlet tests that the specified service account is ready for use.

```powershell
Test-AdServiceAccount ` -Identity <ADServiceAccount>
```

You can now use the gMSA for a service, a group of IIS applications, or a scheduled task. To do this, you must use the name of the account with $ at the end and leave the password blank.

![Group Managed Service Accounts](How%20to%20create%20a%20Group%20Managed%20Service%20Accounts%20(gMSA)/Services01-e1539988163988_hu85c721d446ccef35339e818b6b6aa599_25116_850x0_resize_box_3.png)

![Group Managed Service Accounts](How%20to%20create%20a%20Group%20Managed%20Service%20Accounts%20(gMSA)/Services02_hu56f0d97717f1bdf10d79c1e074adbece_7081_850x0_resize_box_3.png)

If you want to know more about Group managed service accounts, check out this _[link][8]_.

[1]: https://www.jorgebernhardt.com/how-to-create-a-group-managed-service-accounts-gmsa/#basic-concepts
[2]: https://www.jorgebernhardt.com/how-to-create-a-group-managed-service-accounts-gmsa/#requirements
[3]: https://www.jorgebernhardt.com/how-to-install-powershell-active-directory-module/
[4]: https://www.jorgebernhardt.com/how-to-create-kds-root-key-using-powershell/
[5]: https://www.jorgebernhardt.com/how-to-create-a-group-managed-service-accounts-gmsa/#create-the-managed-service-account-in-active-directory
[6]: https://www.jorgebernhardt.com/how-to-create-a-group-managed-service-accounts-gmsa/#parameters
[7]: https://www.jorgebernhardt.com/how-to-create-a-group-managed-service-accounts-gmsa/#install-the-gmsa-on-the-host
[8]: https://docs.microsoft.com/en-us/windows-server/security/group-managed-service-accounts/group-managed-service-accounts-overview