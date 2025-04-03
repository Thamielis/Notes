Guess most of you are struggling with troubleshooting software update compliance and installing applications in Configuration Manager 2012. What I have found, is that clients in a reboot pending state often is the root cause to the problems. In previous posts I have described how you can use tools like [Coretech Shutdown Utility][1] to automatically restart computers that has been in a reboot pending state for X number of hours/days. 

The information about the reboot pending state is stored in WMI Root\\ccm\\ClientSDK namespace as illustrated here with the [Coretech WMI & PowerShell][2] explorer:

[![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb707.png "image")][3]

## Identify reboot state using PowerShell

Launch PowerShell ISE and type _Invoke-WmiMethod -Namespace "ROOT\\ccm\\ClientSDK" -Class CCM\_ClientUtilities -Name DetermineIfRebootPending_

[![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb708.png "image")][4]

[![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb709.png "image")][5]

Notice RebootPending is True in the first example and False in the second example. Now let’s take the PowerShell command and turn it into a Compliance rule in Configuration Manager 2012.

Create the Compliance rule in Configuration Manager

1.  Launch the Configuration Manager console, navigate to the Assetts and Compliance workspace, Compliance Settings, Configuration Items.
2.  Create a new Configuration Item, Select **Windows** and click **Next**.
    
    [![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb710.png "image")][6]
    
3.  Select all Operating systems, and click **Next**.
4.  On Settings, click New. In Setting type, select **Script** and in Data select **Boolean**.
    
    [![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb711.png "image")][7]
    
5.  On Discovery Script, click **Add Script** and type

_Invoke-WmiMethod -Namespace "ROOT\\ccm\\ClientSDK" -Class CCM\_ClientUtilities -Name DetermineIfRebootPending  | select-object -ExpandProperty "RebootPending"_ and click **OK**_._

[_![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb712.png "image")_][8]

9.  Select the **Compliance Rule** tab, and click **New**. Configure the following values to **False** and click **OK**.
    
    [![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb713.png "image")][9]
    
10.  Finish the wizard. Notice that I’m not creating a remediation script as I do not want to force a reboot.
11.  Create a new Baseline, and add the Reboot Pending Configuration Item.
    
    [![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb714.png "image")][10]
    
12.  Deploy the baseline to a device collection.
13.  Right click the baseline deployment, select **Create New Collection, Non-compliant**.
    
    [![image](https://blog.ctglobalservices.com/wp-content/uploads/old/image_thumb715.png "image")][11]
    

#### Share This Story, Choose Your Platform!

![](https://secure.gravatar.com/avatar/db142b49b35f9879632ff9b77b77fd5a?s=72&d=identicon&r=g)

Microsoft Regional Director, Enterprise Mobility MVP. Microsoft Certified Trainer and Principal consultant. I have been working with Enterprise client management since 1992. Co-founder of System Center User Group Denmark in 2009. Certified MCITP: Enterprise Administrator, MCSA+Messaing, and much more. Member of: Microsoft Denmark System Center Partner Expert Team The Danish Technet Influencers program System Center Influencers Program.

[1]: https://blog.ctglobalservices.com/kea/new-version-of-the-coretech-shutdown-tool/
[2]: https://blog.ctglobalservices.com/kaj/coretech-wmi-and-powershell-browser/
[3]: https://blog.ctglobalservices.com/wp-content/uploads/old/image707.png
[4]: https://blog.ctglobalservices.com/wp-content/uploads/old/image708.png
[5]: https://blog.ctglobalservices.com/wp-content/uploads/old/image709.png
[6]: https://blog.ctglobalservices.com/wp-content/uploads/old/image710.png
[7]: https://blog.ctglobalservices.com/wp-content/uploads/old/image711.png
[8]: https://blog.ctglobalservices.com/wp-content/uploads/old/image712.png
[9]: https://blog.ctglobalservices.com/wp-content/uploads/old/image713.png
[10]: https://blog.ctglobalservices.com/wp-content/uploads/old/image714.png
[11]: https://blog.ctglobalservices.com/wp-content/uploads/old/image715.png