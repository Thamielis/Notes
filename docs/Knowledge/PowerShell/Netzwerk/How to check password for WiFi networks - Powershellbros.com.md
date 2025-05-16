In this article I want to show you how to check password for WiFi networks.

In big companies there is often situation that some guest want to connect to network in office but nobody knows what is the password.  
WiFi network profile is always saved on your computer, so there is no problem to gahter all information about it.  
Script using [netsh](https://technet.microsoft.com/en-us/library/bb490939.aspx) command to scan for all WiFi networks cached on your local computer.  
Once netsh command is completed, result is parsed and for each of network netsh command is run once again, but this time with information about WiFi password 🙂

**Script:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p></td><td><div><p><code>$WifiProfiles</code> <code>= netsh.exe wlan show profiles</code></p><p><code>$WifiProfiles</code> <code>= </code><code>$WifiProfiles</code> <code>| </code><code>Select-String</code> <code>"All User Profile"</code></p><p><code>$WiFiArray</code> <code>= @()</code></p><p><code>foreach</code><code>(</code><code>$profile</code> <code>in</code> <code>$WifiProfiles</code><code>)</code></p><p><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$ProfileName</code> <code>= (</code><code>$profile</code> <code>-split</code> <code>": "</code><code>)[1]</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$ProfileSettings</code><code>= netsh.exe wlan show profiles name=</code><code>"$ProfileName"</code> <code>key=clear</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Password</code> <code>= ((</code><code>$ProfileSettings</code> <code>| </code><code>Select-String</code> <code>"Key Content"</code><code>)</code> <code>-split</code> <code>": "</code><code>)[1]</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$AuthenticationType</code> <code>= ((</code><code>$ProfileSettings</code> <code>| </code><code>Select-String</code> <code>"Authentication"</code><code>)</code> <code>-split</code> <code>": "</code><code>)[1]</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$object</code> <code>= </code><code>New-Object</code> <code>PSObject</code> <code>-Property</code>&nbsp; <code>@{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"Wifi Profile Name"</code> <code>= </code><code>$ProfileName</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"Password"</code> <code>= </code><code>$Password</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"Authentication Type"</code> <code>= </code><code>$AuthenticationType</code></p><p><code>&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>&nbsp;&nbsp;&nbsp;</code><code>$WiFiArray</code> <code>+= </code><code>$object</code></p><p><code>}</code></p><p><code>$WiFiArray</code></p></div></td></tr></tbody></table>

In the result you will receive array with 3 columns like on picutre below.  
[![](How%20to%20check%20password%20for%20WiFi%20networks%20-%20Powershellbros.com/WiFiPasswords.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2017/08/WiFiPasswords.png)

If there will be open WiFi network of course there will not be any value in password column.  
Remember to use script only on your laptop 😉

I hope it will be usefull for some of you 🙂  
Enjoy!