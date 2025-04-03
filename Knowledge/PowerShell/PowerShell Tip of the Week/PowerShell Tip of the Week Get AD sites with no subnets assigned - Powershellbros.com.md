![](PowerShell%20Tip%20of%20the%20Week%20Get%20AD%20sites%20with%20no%20subnets%20assigned%20-%20Powershellbros.com/site-subnet.png)

In this short article, you will find out how to get all AD sites where there are no subnets. Recently I had to find all the sites in my environment that are not used anymore and have no subnets assigned. To do this I wrote a simple script that I wanted to share with you.

**Active Directory sites**

To gather information about subnets we can use commands from the [ActiveDirectory](https://docs.microsoft.com/en-us/powershell/module/addsadministration/?view=win10-ps) module or using .Net classes:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>Get-ADReplicationSite</code> <code>-Filter</code> <code>*</code> <code>-Server</code> <code>DC01</code> <code>-Properties</code> <code>Name,Subnets</code></p><p><code>[System.DirectoryServices.ActiveDirectory.Forest]</code><code>::GetCurrentForest().Sites</code></p></div></td></tr></tbody></table>

_The_ **[_Get-ADReplicationSite_](https://docs.microsoft.com/en-us/powershell/module/addsadministration/Get-ADReplicationSite?view=win10-ps)** _cmdlet returns a specific Active Directory replication site or a set of replication site objects based on a specified filter. Sites are used in Active Directory to either enable clients to discover network resources (published shares, domain controllers) close to the physical location of a client computer or to reduce network traffic over wide area network (WAN) links. Sites can also be used to optimize replication between domain controllers._

I prefer [AD](https://www.powershellbros.com/tag/active-directory/) commands as they give us the opportunity to display more information. In my case I wanted to have the following output:

*   Site name
*   Number of subnets
*   When it was created
*   Canonical name
*   Short description

[![site](PowerShell%20Tip%20of%20the%20Week%20Get%20AD%20sites%20with%20no%20subnets%20assigned%20-%20Powershellbros.com/sites.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2019/07/sites.png?ssl=1)

**Final script:**

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p><p>28</p><p>29</p><p>30</p><p>31</p></td><td><div><p><code>$ADSites</code> <code>= </code><code>Get-ADReplicationSite</code> <code>-Filter</code> <code>*</code> <code>-Server</code> <code>DC01</code> <code>-Properties</code> <code>Name,CanonicalName,Created,Description,Subnets</code></p><p><code>$SiteArray</code> <code>= @()</code></p><p><code>$SiteArray</code> <code>= </code><code>Foreach</code> <code>(</code><code>$Site</code> <code>in</code> <code>$ADSites</code><code>) {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>If</code><code>((</code><code>$Site</code><code>.Subnets).count </code><code>-eq</code> <code>0){</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code> <code>= @{} | select Name,Subnets,Created,CanonicalName,Description</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code><code>.Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = </code><code>$Site</code><code>.Name</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code><code>.Subnets&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = (</code><code>$Site</code><code>.Subnets).count</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code><code>.Created&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = </code><code>$Site</code><code>.created</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code><code>.CanonicalName = </code><code>$Site</code><code>.canonicalname</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$OBject</code><code>.Description&nbsp;&nbsp; = </code><code>$Site</code><code>.description</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$Object</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p><p><code>}</code></p><p><code>$SiteArray</code> <code>| </code><code>Out-GridView</code> <code>-Title</code> <code>"Empty sites"</code></p><p><code>$SiteArray</code> <code>| </code><code>Export-Csv</code> <code>$env:USERPROFILE</code><code>\desktop\results.csv</code> <code>-Force</code> <code>-NoTypeInformation</code></p></div></td></tr></tbody></table>