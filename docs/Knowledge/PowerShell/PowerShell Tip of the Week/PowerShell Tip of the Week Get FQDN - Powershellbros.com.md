Today I want to show you how to use `.Net class` to get **FQDN (Fully Qualified Domain Name)**. A fully qualified domain name is the complete domain name for a specific computer. The FQDN consists of two parts: the _hostname_ and the _domain name_ like for example:

**DC01.powershellbros.com**

##### Get FQDN

In this article we will focus on **DNS class** which is a static class that retrieves information about a specific host from the Internet Domain Name System (DNS). For more information about this class please visit [msdn site](https://msdn.microsoft.com/en-us/library/system.net.dns(v=vs.110).aspx).

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p></td><td><div><p><code>[System.Net.Dns]</code><code>::GetHostByName((</code><code>$env:computerName</code><code>))</code></p><p><code>(</code><code>[System.Net.Dns]</code><code>::GetHostByName((</code><code>$env:computerName</code><code>))).Hostname</code></p><p><code>(</code><code>[System.Net.Dns]</code><code>::GetHostByName((</code><code>"ADFS01"</code><code>))).Hostname</code></p></div></td></tr></tbody></table>

[![FQDN examples](PowerShell%20Tip%20of%20the%20Week%20Get%20FQDN%20-%20Powershellbros.com/FQDN-examples.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/12/FQDN-examples.png)

FQDN examples

What if you have list of servers and you want to check them all quickly? You can combine `Get-Content` and `Foreach` commands to query them.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p></td><td><div><p><code>Get-Content</code> <code>-Path</code> <code>"C:\users\$env:username\desktop\servers.txt"</code> <code>|</code></p><p><code>Foreach</code> <code>{ </code><code>"{0} - {1}"</code> <code>-f</code> <code>$_</code><code>, ((</code><code>[System.Net.Dns]</code><code>::GetHostByName((</code><code>"$_"</code><code>))).Hostname) }</code></p><p><code>Get-Content</code> <code>-Path</code> <code>"C:\users\$env:username\desktop\servers.txt"</code> <code>|</code></p><p><code>Foreach</code> <code>{</code><code>$DNSCheck</code> <code>= (</code><code>[System.Net.Dns]</code><code>::GetHostByName((</code><code>"$_"</code><code>)));&nbsp; </code><code>"{0} - {1} - {2}"</code> <code>-f</code> <code>$_</code><code>, </code><code>$DNSCheck</code><code>.hostname, </code><code>$DNSCheck</code><code>.AddressList[0]}</code></p></div></td></tr></tbody></table>

[![FQDN examples 2](PowerShell%20Tip%20of%20the%20Week%20Get%20FQDN%20-%20Powershellbros.com/FQDN-examples-2-1024x176.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2017/12/FQDN-examples-2.png)

FQDN examples 2

Below you can find another way to get this information from remote servers and add it to an `array`. Results can be saved into **CSV file**.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p></td><td><div><p><code>$Servers</code> <code>= </code><code>Get-Content</code> <code>-Path</code> <code>"C:\users\$env:username\desktop\servers.txt"</code></p><p><code>$Array</code> <code>= @()</code></p><p><code>Foreach</code><code>(</code><code>$Server</code> <code>in</code> <code>$Servers</code><code>)</code></p><p><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$DNSCheck</code> <code>= </code><code>$null</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Server</code> <code>= </code><code>$Server</code><code>.trim()</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$DNSCheck</code> <code>= (</code><code>[System.Net.Dns]</code><code>::GetHostByName((</code><code>"$Server"</code><code>)))</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code> <code>= </code><code>New-Object</code> <code>PSObject</code> <code>-Property</code> <code>(</code><code>[ordered]</code><code>@{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"Server name"</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <code>= </code><code>$Server</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"FQDN"</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <code>= </code><code>$DNSCheck</code><code>.hostname</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"IP Address"</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <code>= </code><code>$DNSCheck</code><code>.AddressList[0]</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>})</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Array</code> <code>+= </code><code>$Object</code></p><p><code>}</code></p><p><code>$Array</code></p><p><code>$Array</code> <code>| </code><code>Export-Csv</code> <code>-Path</code> <code>C:\users\</code><code>$env:username</code><code>\desktop\results.csv</code> <code>-NoTypeInformation</code></p></div></td></tr></tbody></table>

Final results will be displayed in console:

[![FQDN](PowerShell%20Tip%20of%20the%20Week%20Get%20FQDN%20-%20Powershellbros.com/FQDN.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/12/FQDN.png)

FQDN