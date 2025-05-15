Reboot 🙂 I guess that all of the server administrators had this situation when server was not responding. If you don’t have access to iDRAC, iLO .etc the only way to fix the issue will be rebooting server remotely. So today I would like to show you couple of ways to do that.

The easiest way is to run cmd as an administrator and use command:  
**SHUTDOWN /r /f /t 0 /m \\\\servername /c “Emergency reboot”**

For more information about this command please refer to:  
[https://technet.microsoft.com/pl-pl/library/bb491003.aspx](https://technet.microsoft.com/pl-pl/library/bb491003.aspx)

Other way to reboot server is to use PowerShell command `restart-computer` with force parameter and admin account credentials:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p></td><td><div><p><code>Restart-Computer</code> <code>-ComputerName</code> <code>$Server</code> <code>-Force</code> <code>-Credential</code> <code>pawel.janowicz</code></p><p><code>Restart-Computer</code> <code>(</code><code>Get-Content</code> <code>"c:\temp\servers.txt"</code><code>)</code></p></div></td></tr></tbody></table>

Unfortunately, sometimes it doesn’t work properly and we might get following error message:  
**“The RPC server is unavailable”**

**New-PSSession** option comes to our rescue 🙂

To create new session with affected machine **$server** we need to provide our admin account credentials **$cred**. Another line stands for running the same restart command with force parameter but in this case we will pass it into **ScriptBlock**. Last step is to remove existing session to avoid making any mistakes.

**Final script:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p></td><td><div><p><code>$server</code> <code>=</code><code>'DCO1'</code></p><p><code>$cred</code> <code>= </code><code>$Host</code><code>.ui.PromptForCredential(</code><code>"PowerShellBros"</code><code>,</code><code>"Please use admin account to login (ie. pawel.janowicz)"</code><code>,</code><code>"$ENV:Username"</code><code>,"")</code></p><p><code>$session</code> <code>= </code><code>new-pssession</code> <code>-computer</code> <code>$server</code> <code>-credential</code> <code>$cred</code></p><p><code>invoke-command</code>&nbsp; <code>-Session</code> <code>$session</code> <code>-ScriptBlock</code> <code>{ </code><code>restart-computer</code> <code>-Force</code> <code>}</code></p><p><code>Remove-PSSession</code> <code>$session</code></p></div></td></tr></tbody></table>