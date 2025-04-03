**Taskkill** command can be very useful when it comes to daily operational tasks. I often had situation that several ADFS web servers were not working properly. Recently I’ve been flooded by SCOM alerts about service failure. First recommended step is to restart ADFS service. Unfortunately normal service restart does not solve the issue. Taskkill command comes to rescue – it allows to terminate completely affected process.

##### Taskkill

Ends one or more tasks or processes. Processes can be killed by process ID or image name. To kill process on remote server **ADFS01** we can use the following example:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>TASKKILL /s ADFS01 /f /IM Microsoft.IdentityServer.ServiceHost.exe</code></p></div></td></tr></tbody></table>

Of course you can use this command in other ways. Here are some useful examples from technet site:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p></td><td><div><p><code>taskkill /pid 1230 /pid 1241 /pid 1253</code></p><p><code>taskkill /f /fi </code><code>"USERNAME eq NT AUTHORITY\SYSTEM"</code> <code>/im notepad.exe</code></p><p><code>taskkill /s srvmain /f /im notepad.exe</code></p><p><code>taskkill /s srvmain /u maindom\hiropln /p p</code><code>@ssW23</code> <code>/fi </code><code>"IMAGENAME eq note*"</code> <code>/im *</code></p><p><code>taskkill /s srvmain /u maindom\hiropln /fi </code><code>"USERNAME ne NT*"</code> <code>/im *</code></p><p><code>taskkill /f /fi </code><code>"PID ge 1000"</code> <code>/im *</code></p></div></td></tr></tbody></table>

For more info about Taskkill please visit [technet site](https://technet.microsoft.com/pl-pl/library/bb491009.aspx).

Below you can find simple script for killing ADFS service – `Microsoft.IdentityServer.ServiceHost.exe`. At the beginning you need to provide server list. In foreach loop script will check if server is accessible – `$Check = Test-Path \\$Server\c$`. If this check passed then it will terminate ADFS process:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p></td><td><div><p><code>$Servers</code> <code>= </code><code>Get-Content</code> <code>-Path</code> <code>"C:\users\$env:username\desktop\ADFS_servers.txt"</code></p><p><code>Foreach</code><code>(</code><code>$Server</code> <code>in</code> <code>$Servers</code><code>)</code></p><p><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Server</code> <code>= </code><code>$Server</code><code>.trim()</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>"$Server - "</code> <code>-NoNewLine</code> <code>-ForegroundColor</code> <code>Yellow</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Check</code> <code>= </code><code>Test-Path</code> <code>\\</code><code>$Server</code><code>\c$</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>If</code><code>(</code><code>$Check</code> <code>-match</code> <code>"True"</code><code>)</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>TASKKILL /s </code><code>$Server</code> <code>/f /IM Microsoft.IdentityServer.ServiceHost.exe</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Else</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>"ERROR: Failed to connect"</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>}</code></p></div></td></tr></tbody></table>

Output should look like this:

[![taskkill](PowerShell%20Tip%20of%20the%20Week%20Taskkill%20remotely%20-%20Powershellbros.com/taskkill.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/12/taskkill.png)

taskkill

It can be done in easier way:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-Content</code> <code>-path</code> <code>C:\users\</code><code>$env:username</code><code>\desktop\ADFS_servers.txt | </code><code>foreach</code> <code>{ TASKKILL /s </code><code>$_</code> <code>/f /IM Microsoft.IdentityServer.ServiceHost.exe }</code></p></div></td></tr></tbody></table>

You check also one of the previous articiles about killing process function – [link](http://www.powershellbros.com/kill-process-remotely-using-powershell/).