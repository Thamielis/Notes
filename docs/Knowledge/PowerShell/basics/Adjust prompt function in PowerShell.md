Today I want to share with you my experience about how to adjust prompt function in PowerShell.

I’ve created prompt function which display details about current user session.  
It shows details about followind things:  
– Hours – display time of last executed command  
– Computer name – name of the computer on which powershell session is open  
– User name – name of the user which is currently using Powershell session.  
At the beginning of the function I’ve added also if condition which will check if session is run with admin privileges.  
If yes, this infromation will be added to propmpt bar.

**Function:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p></td><td><div><p><code>function</code> <code>prompt</code></p><p><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>if</code><code>(</code><code>[bool]</code><code>((</code><code>[System.Security.Principal.WindowsIdentity]</code><code>::GetCurrent()).groups </code><code>-match</code> <code>"S-1-5-32-544"</code><code>))</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Role</code> <code>= </code><code>"(Admin)"</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Hours</code> <code>= (</code><code>get-date</code><code>).Tostring(</code><code>"HH:mm:ss"</code><code>)</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>$Hours</code> <code>-NoNewline</code> <code>-ForegroundColor</code> <code>Green</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>"|"</code> <code>-NoNewline</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>"PS@$env:COMPUTERNAME"</code> <code>-NoNewline</code> <code>-ForegroundColor</code> <code>Magenta</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>"|"</code> <code>-NoNewline</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>$env:USERNAME</code><code>$Role</code> <code>-NoNewline</code> <code>-ForegroundColor</code> <code>Gray</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>"|"</code> <code>-NoNewline</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Host</code> <code>$(</code><code>get-location</code><code>)</code> <code>-nonewline</code> <code>-ForegroundColor</code> <code>Cyan</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>"`n$('&gt;_') "</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>return</code> <code>" "</code></p><p><code>}</code></p></div></td></tr></tbody></table>

In result you should have prompt like on below screen (of course with your computer and account details).  
[![](Adjust%20prompt%20function%20in%20PowerShell%20-%20Powershellbros.com/Prompt_function.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2017/05/Prompt_function.png)

To have this prompt included in every run of Powershell you should adjust your Powershell profile.  
If you want to do it go to [howtogeek.com](https://www.howtogeek.com/50236/customizing-your-powershell-profile/) blog and use tips from this site.

I hope it will be usefull for some of you 😉  
Enjoy!