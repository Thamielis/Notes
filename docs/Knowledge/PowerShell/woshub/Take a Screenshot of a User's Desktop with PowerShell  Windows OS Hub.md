A HelpDesk support team asked me to write a PowerShell script to quickly get a screenshot of a user desktop from a remote computer. The main condition is that the HelpDesk employee should not connect to the user’s computer through graphical remote support tools (SCCM, Remote Assistance, [Remote Desktop Session Shadowing](https://woshub.com/rdp-session-shadow-to-windows-10-user/), etc.).

Contents:

*   [Capturing Screenshots Using PowerShell](https://woshub.com/take-user-desktop-screenshot-with-powershell/#h2_1)
*   [How to Take a Desktop Screenshot from a Remote Computer Using PowerShell?](https://woshub.com/take-user-desktop-screenshot-with-powershell/#h2_2)

Capturing Screenshots Using PowerShell
--------------------------------------

First of all, let’s learn how to take a screenshot on a local computer with PowerShell. To capture a current desktop image, you can use the built-in .NET class **System.Windows.Forms**. I got this PowerShell script:

`$Path = "C:\ScreenCapture"   # Make sure that the directory to keep screenshots has been created, otherwise create it   If (!(test-path $path)) {   New-Item -ItemType Directory -Force -Path $path   }   Add-Type -AssemblyName System.Windows.Forms   $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds   # Get the current screen resolution   $image = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)   # Create a graphic object   $graphic = [System.Drawing.Graphics]::FromImage($image)   $point = New-Object System.Drawing.Point(0, 0)   $graphic.CopyFromScreen($point, $point, $image.Size);   $cursorBounds = New-Object System.Drawing.Rectangle([System.Windows.Forms.Cursor]::Position, [System.Windows.Forms.Cursor]::Current.Size)   # Get a screenshot   [System.Windows.Forms.Cursors]::Default.Draw($graphic, $cursorBounds)   $screen_file = "$Path\" + $env:computername + "_" + $env:username + "_" + "$((get-date).tostring('yyyy.MM.dd-HH.mm.ss')).png"   # Save the screenshot as a PNG file   $image.Save($screen_file, [System.Drawing.Imaging.ImageFormat]::Png)`

This PowerShell script creates a directory to store screenshots, gets the current screen resolution, captures an image of the current workspace and saves it as a PNG file. Run the PowerShell script and check that a png file appears in the specified directory (you can specify the UNC path to the shared network folder) with a screenshot of your desktop. For convenience, the name of the PNG file contains a computer name, a user name, a current date and time.

If you want to call the PS script from a batch file, use this command (in this case, you don’t need to change the [PowerShell Execution Policy settings](https://woshub.com/configure-powershell-script-execution-policy/)):

`powershell.exe -executionpolicy bypass -file c:\ps\CaptureLocalScreen.ps1`

![[images/capturelocalscreen-powershell-screen-take-deskto.png.webp]]

To edit PowerShell scripts, I prefer using Visual Studio Code instead of Powershell ISE.

You can [create a GPO to place a shortcut](https://woshub.com/create-desktop-shortcuts-group-policy/) for the PowerShell script on the desktops of all domain users and assign hot keys to call it. Now, when a problem or error appears in any app, a user can just press the assigned hot keys. Then a user desktop screenshot appears in the HelpDesk shared folder.

How to Take a Desktop Screenshot from a Remote Computer Using PowerShell?
-------------------------------------------------------------------------

The next task is to get a screenshot of the user’s desktop on the remote computer via PowerShell. It may be either a standalone computer running Windows 10 or an RDS server.

A preferred way to connect to a user desktop on an RDS server using a graphic tool is the [Shadow RDP Session](https://woshub.com/rds-shadow-how-to-connect-to-a-user-session-in-windows-server-2012-r2/).

If you want to get a desktop screenshot from an RDS server (or a desktop Windows, in which [multiple concurrent RDP connections](https://woshub.com/how-to-allow-multiple-rdp-sessions-in-windows-10/) are allowed), you must first get a user session ID on the remote computer. Specify the name of a remote computer/server and a user account in the following PowerShell script:  
`$ComputerName = "nld-rds1"   $RDUserName = "h.jansen"   $quser = (((query user /server:$ComputerName) -replace '^>', '') -replace '\s{2,}', ',' | ConvertFrom-Csv)   $usersess=$quser | where {$_.USERNAME -like $RDUserName -and $_.STATE -eq "Active"}   $usersessID=$usersess.ID`

If you use the script to get screenshots from remote computers with a single user, the session number will always be 1. Replace the previous RDS server query block with `$usersessID = 1`.

To make it more convenient, save the PowerShell script file to a shared network folder. Then edit the **CaptureLocalScreen.ps1** file and change the path to:

`$Path = \\nld-fs01\Screen\Log`

User screenshots will be saved to this folder. Grant write permissions to the folder for the **Authenticated Users** domain group.

After you have got a user session ID, you can connect to the user session remotely using `PsExec` tool and run the script:

`.\PsExec.exe -s -i $usersessID \\$ComputerName powershell.exe -executionpolicy bypass -WindowStyle Hidden -file "\\nld-fs01\Screen\CaptureLocalScreen.ps1"`

Then a HelpDesk team member can run the script from his computer, and a screenshot of the current desktop of the remote computer will appear in the specified directory.