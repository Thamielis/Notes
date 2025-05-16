While working in Active Directory based environment you are often dealing with AD user accounts and probably using often **Get-ADUser** command. In this article I want to present several simple examples how to use it.

Normally when we want to display user details we use **\-Identity** :

<table><tbody><tr><td><p>1</p><p>2</p></td><td><div><p><code>Get-ADUser</code> <code>-Identity</code> <code>'S-1-5-21-329123456-141345322-1417344333-41244447'</code> <code>| </code><code>Select-Object</code> <code>name</code></p><p><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code></p></div></td></tr></tbody></table>

To list names of all available user properties we can use **Get-Member** command:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>(</code><code>Get-ADuser</code> <code>-Identity</code> <code>Pawel.Janowicz</code> <code>-Properties</code> <code>* | </code><code>Get-Member</code> <code>-MemberType</code> <code>Property).name</code></p></div></td></tr></tbody></table>

The case will be a little bit different when we have for example only user “mobile” and we want to find out quickly to which user it belongs.

Below you can find several example how to search a user in Active Directory based on other properties and using **filter** option:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p></td><td><div><p><code>Get-ADUser</code> <code>-Filter</code> <code>{ SID </code><code>-eq</code> <code>'S-1-5-21-329123456-141345322-1417344333-41244447'</code> <code>}</code></p><p><code>Get-ADUser</code>&nbsp;<code>-</code><code>Filter</code>&nbsp;<code>{ mobile&nbsp;</code><code>-eq</code>&nbsp;<code>'+48555444333'</code> <code>}</code></p><p><code>Get-ADuser</code> <code>-Filter</code> <code>{ givenname </code><code>-like</code> <code>'Pawel'</code> <code>}</code></p><p><code>Get-ADuser</code> <code>-Filter</code> <code>{ givenname </code><code>-like</code> <code>'Pawel'</code> <code>} | </code><code>Select-Object</code> <code>name | </code><code>Sort-Object</code> <code>name</code></p><p><code>Get-ADuser</code> <code>-Filter</code> <code>{ givenname </code><code>-like</code> <code>'Pawel'</code> <code>}</code> <code>-Properties</code> <code>name,emailaddress,enabled | </code><code>Select-Object</code> <code>name,emailaddress,enabled | </code><code>Sort-Object</code> <code>name</code></p><p><code>Get-ADUser</code> <code>-Filter</code> <code>{ givenname </code><code>-like</code> <code>'P*'</code> <code>-and</code> <code>surname </code><code>-like</code> <code>'J*'</code> <code>} | </code><code>Select-Object</code> <code>name</code></p></div></td></tr></tbody></table>

Find all enabled accounts where givename is like “Pawel” and skip admin accounts if you have one:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>$Pawels</code> <code>= </code><code>Get-ADuser</code> <code>-Filter</code> <code>{givenname </code><code>-like</code> <code>'Pawel'</code><code>}</code> <code>-Properties</code> <code>name,emailaddress,enabled | </code><code>Where-Object</code> <code>{(</code><code>$_</code><code>.enabled </code><code>-eq</code> <code>"True"</code><code>) </code><code>-and</code> <code>(</code><code>$_</code><code>.name </code><code>-notlike</code> <code>"admin.*"</code><code>)} | </code><code>Select-Object</code> <code>name,emailaddress,enabled | </code><code>Sort-Object</code> <code>name | </code><code>Out-GridView</code></p></div></td></tr></tbody></table>

If you are working in large scale environment sometimes it’s better to use **SearchBase**:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-ADUser</code> <code>-Filter</code> <code>{givenname </code><code>-like</code> <code>'Pawel'</code><code>}</code> <code>-SearchBase</code> <code>"OU=PolandUsers,OU=UserAccounts,DC=PowerShellBros,DC=com"</code></p></div></td></tr></tbody></table>

Additionally I want to show you how to use **ADSISearcher** to make searching even quicker:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p></td><td><div><p><code>(</code><code>[adsisearcher]</code><code>"givenname=pawel"</code><code>).FindAll()</code></p><p><code>(</code><code>[adsisearcher]</code><code>"(&amp;(objectClass=User)(surname=janowicz))"</code><code>).FindAll()</code></p><p><code>(</code><code>[adsisearcher]</code><code>"(&amp;(objectClass=User)(city=Warsaw))"</code><code>).FindAll()</code></p><p><code>(</code><code>[adsisearcher]</code><code>"(&amp;(objectClass=User)(mobile=+48555444333))"</code><code>).FindOne()</code></p><p><code>(</code><code>[adsisearcher]</code><code>"(&amp;(objectClass=person)(objectClass=user)(name=pawel.janowicz))"</code><code>).FindAll().properties</code></p></div></td></tr></tbody></table>

I hope that this has been informative and you’ve learned something new 🙂