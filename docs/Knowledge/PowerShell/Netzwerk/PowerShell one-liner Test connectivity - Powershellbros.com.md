In this one-liner series I would like to show you several ways to test connectivity. There are lots of methods and basic commands to check network connection like ping, telnet, tracert etc. However it this post you will find out how to combine other PowerShell commands into one-liner script.

Most common PowerShell command is **Test-Connection** which returns basically the same output as Ping.

[![test-connection](PowerShell%20one-liner%20Test%20connectivity%20-%20Powershellbros.com/test-connection.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/08/test-connection.png)

test-connection

<table><tbody><tr><td><p>1</p><p>2</p></td><td><div><p><code>Test-Connection</code> <code>-ComputerName</code> <code>DC01</code> <code>-Count</code> <code>10</code> <code>-ErrorAction</code> <code>SilentlyContinue |</code></p><p><code>Select-Object</code> <code>Address,ProtocolAddress,ResponseTime</code></p></div></td></tr></tbody></table>

To use it for a bunch of our servers we can first create a list of our servers in txt file and then test connectivity. Additionally I use **Out-GridView** at the end to display results in the real time:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p></td><td><div><p><code>Get-Content</code> <code>-Path</code> <code>"C:\Users\pawel.janowicz\desktop\servers.txt"</code> <code>|</code></p><p><code>% { </code><code>Test-Connection</code> <code>-ComputerName</code> <code>$_</code> <code>-Count</code> <code>1</code> <code>-ErrorAction</code> <code>SilentlyContinue |</code></p><p><code>Select-Object</code> <code>Address,ProtocolAddress,ResponseTime} |</code></p><p><code>Out-GridView</code> <code>-Title</code> <code>"Results"</code></p></div></td></tr></tbody></table>

As you probably saw in previous articles there is also an easy way to get secure channel name remotely using **nltest** command:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>Invoke-Command</code> <code>DC01</code> <code>-ScriptBlock</code><code>{nltest.exe /sc_verify:$((</code><code>Get-ADDomain</code><code>).DNSRoot) |</code></p><p><code>Where-Object</code> <code>{</code><code>$_</code> <code>-match</code> <code>"Trusted DC Name"</code><code>} |</code></p><p><code>ForEach</code> <code>{</code><code>$_</code><code>.trim().Substring(18)} }</code></p></div></td></tr></tbody></table>

Now we can try to test connectivity using above example – Get secure channel name remotely and in the same line check if its “pingable”:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p></td><td><div><p><code>Invoke-Command</code> <code>DC01</code> <code>-ScriptBlock</code><code>{nltest.exe /sc_verify:$((</code><code>Get-ADDomain</code><code>).DNSRoot) |</code></p><p><code>Where-Object</code> <code>{</code><code>$_</code> <code>-match</code> <code>"Trusted DC Name"</code><code>} |</code></p><p><code>ForEach</code> <code>{</code><code>Test-Connection</code> <code>$_</code><code>.trim().Substring(18)</code> <code>-Count</code> <code>4 } }</code> <code>-Credential</code> <code>pawel.janowicz |</code></p><p><code>Format-Table</code> <code>address,buffersize,replysize,responsetime</code></p></div></td></tr></tbody></table>

Another useful command is **Test-NetConnection** where we can specify port number. Below you will see how to get all Domain Controllers in your domain and then check connection on port 636:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p></td><td><div><p><code>$DomainName</code> <code>= (</code><code>Get-ADDomain</code><code>).DNSRoot</code></p><p><code>$AllDCs</code> <code>= </code><code>Get-ADDomainController</code> <code>-Filter</code> <code>*</code> <code>-Server</code> <code>$DomainName</code></p><p><code>(</code><code>Get-ADDomainController</code> <code>-Filter</code> <code>*</code> <code>-Server</code> <code>$((</code><code>Get-ADDomain</code><code>).DNSRoot)).Hostname |</code></p><p><code>Foreach</code><code>{</code><code>Test-NetConnection</code> <code>-ComputerName</code> <code>$_</code> <code>-Port</code> <code>636</code> <code>-InformationLevel</code> <code>Detailed} |</code></p><p><code>Out-GridView</code> <code>-Title</code> <code>"Results"</code></p></div></td></tr></tbody></table>

If you would like to see other articiles about testing connection please check below links:  
[Testing connection to secure channel](http://www.powershellbros.com/testing-connection-to-secure-channel-test-netconnection/)  
[Test connection to servers on several ports](http://www.powershellbros.com/test-connection-to-servers-on-several-ports/)