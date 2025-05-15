Starting from today we will add new series of articles describing one-liner scripts. In this post I would like to show you how to get group names that user is a member of using just one-liner script.

**Get-ADUser** allows you to list all information for Active Directory user account.  
This command is a part of ActiveDirectory module where you can also see other commands.

Check available modules on your PC:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-Module</code> <code>–ListAvailable</code></p></div></td></tr></tbody></table>

If ActiveDirectory module is present you can import it using:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Import-Module</code> <code>-Name</code> <code>ActiveDirectory</code></p></div></td></tr></tbody></table>

To get all commands available in this module run the following command:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-Command</code> <code>-Module</code> <code>ActiveDirectory</code></p></div></td></tr></tbody></table>

If ActiveDirectory module is not present please follow this guide – [link](https://4sysops.com/archives/how-to-install-the-powershell-active-directory-module/).

If AD Module is installed and imported we can start getting user information.  
Get general user information based on user account name:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code></p></div></td></tr></tbody></table>

This command returned only 10 basic user properties:

– DistinguishedName  
– Enabled  
– GivenName  
– Name  
– ObjectClass  
– ObjectGUID  
– SamAccountName  
– SID  
– Surname  
– UserPrincipalName

To display all available attributes just run the following command:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code> <code>-Properties</code> <code>*</code></p></div></td></tr></tbody></table>

If you want to display groups we have to put our command into () and add “.memberof” at the end.

<table><tbody><tr><td><p>1</p></td><td><div><p><code>(</code><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code> <code>-Properties</code> <code>memberof).memberof</code></p></div></td></tr></tbody></table>

This command returns **DistinguishedName** of user’s direct group membership.  
One way of getting names instead of DistinguishedName and sort them in alphabetic order is first creating **$Groups** variable:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>$Groups</code> <code>= (</code><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code> <code>-Properties</code> <code>memberof).memberof</code></p></div></td></tr></tbody></table>

After that for all **DistingushedNames** from $Groups pass it to another commands (Get-ADGroup, Select-Object, Sort-Object) after pipeline. All together should look like this:

<table><tbody><tr><td><p>1</p><p>2</p></td><td><div><p><code>$Groups</code> <code>= (</code><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code> <code>-Properties</code> <code>memberof).memberof</code></p><p><code>$Groups</code> <code>| </code><code>Get-ADGroup</code> <code>| </code><code>Select-Object</code> <code>name | </code><code>Sort-Object</code> <code>name</code></p></div></td></tr></tbody></table>

Or you can do it in one-liner script:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>(</code><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code> <code>-Properties</code> <code>memberof).memberof | </code><code>Get-ADGroup</code> <code>| </code><code>Select-Object</code> <code>name | </code><code>Sort-Object</code> <code>name</code></p></div></td></tr></tbody></table>