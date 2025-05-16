Have you ever wonder how to store script credentials securely ? If no, in todays article I want to explain you how to do it.

Frequent tenedency of PowerShell programmers is storing plain text password inside one of the variable of the script.  
Of course it’s **HUGE MISTAKE!**  
Even if credentials are provided via prompt from Get-Credential command, password is not very secure.  
[![](How%20to%20store%20script%20credentials%20securely%20-%20Powershellbros.com/get-Credential.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/06/get-Credential.png)

To ensure that is not safe check below command.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>$Credential</code> <code>= </code><code>Get-Credential</code></p><p><code>$CredentialPassword</code> <code>= </code><code>$Credential</code><code>.GEtNEtworkCredential().Password</code></p><p><code>Write-Host</code> <code>"Isn't your password? $CredentialPassword"</code></p></div></td></tr></tbody></table>

Recommended solution which should be used in the script is to export secure string to readable format into file.  
Below script export password to file.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p></td><td><div><p><code>$password</code> <code>= </code><code>"MySuperSecretPassword"</code></p><p><code>$secureStringPwd</code> <code>= </code><code>$password</code> <code>| </code><code>ConvertTo-SecureString</code> <code>-AsPlainText</code> <code>-Force</code></p><p><code>$secureStringText</code> <code>= </code><code>$secureStringPwd</code> <code>| </code><code>ConvertFrom-SecureString</code></p><p><code>Set-Content</code> <code>"C:\temp\MySuperSecretPassword.txt"</code> <code>$secureStringText</code></p></div></td></tr></tbody></table>

These cmdlets use the Windows Data Protection API (DPAPI) to generate an AES key based-on the current user’s password (ie. the user context you’re running Powershell under) and use this to encrypt the password in the file.

There is also an option to provide a specific AES Key for it to use to perform the encryption instead

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>$AESKey</code> <code>= </code><code>New-Object</code> <code>Byte[] 32</code></p><p><code>[Security.Cryptography.RNGCryptoServiceProvider]</code><code>::Create().GetBytes(</code><code>$AESKey</code><code>)</code></p><p><code>Set-Content</code> <code>"C:\temp\MySuperSecretAESKey.txt"</code> <code>$AESKey</code>&nbsp;&nbsp;</p><p><code>$password</code> <code>= </code><code>$passwordSecureString</code> <code>| </code><code>ConvertFrom-SecureString</code> <code>-Key</code> <code>$AESKey</code></p><p><code>Add-Content</code> <code>$credentialFilePath</code> <code>$password</code></p></div></td></tr></tbody></table>

If password will be encrypted by another AES Key like on example below, remember to decrypt password using below method

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>$AESKey</code> <code>= </code><code>Get-Content</code> <code>C:\temp\MySuperSecretAESKey.txt</code></p><p><code>$Password</code> <code>= </code><code>Get-Content</code> <code>C:\temp\MySuperSecretPassword.txt</code></p><p><code>$SecurePassword</code> <code>= </code><code>$pwdTxt</code> <code>| </code><code>ConvertTo-SecureString</code> <code>-Key</code> <code>$AESKey</code></p></div></td></tr></tbody></table>

I hope it will be usefull for some of you 🙂  
Enjoy!