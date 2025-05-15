# Importing/Exporting Photos to/from Active Directory

[October 7, 2019October 7, 2019](https://www.kjctech.net/importing-exporting-photos-to-from-active-directory/) [Kent Chen](https://www.kjctech.net/author/admin/)[Microsoft](https://www.kjctech.net/category/information-technology/)[![PowerShell](https://i0.wp.com/www.kjctech.net/wp-content/uploads/2017/09/powershell-cim_1.jpg?fit=700%2C393&ssl=1 "powershell-cim_1")](https://www.kjctech.net/importing-exporting-photos-to-from-active-directory/ "Importing/Exporting Photos to/from Active Directory")

There are free tools like [CodeTwo Active Directory Photos](https://www.codetwo.com/freeware/active-directory-photos/) that lets you upload photos to Active Directory and manage them with a GUI interface. But it’s not as sleek and flexible as using a scripting tool like PowerShell.

In order to use PowerShell to communicate with Active Directory, you will need the Active Directory module installed for PowerShell. The easiest way is to install [RAST](https://docs.microsoft.com/en-us/windows-server/remote/remote-server-administration-tools) (Remote Server Administration Tools) on your Windows 10 computer.

## Import photos to Active Directory

To save a photo for a specific user, **Get-Content** of the picture in a sequence of bytes and then use **Set-ADUser** to replace the ThumbnailPhoto property.

```powershell
$photo = [byte[]](Get-Content $photopath -Encoding byte)
Set-ADUser $username -Replace @{thumbnailPhoto=$photo}
```

You can name all the photos to match usernames in Active Directory’s and use the combination of **Get-ADUser** and **Set-ADUser** to import a bunch of photos at once.

```powershell
$users = Get-AdUser -Filter * -SearchBase "OU=users, DC=domain, DC=local" -properties thumbnailphoto
foreach ($user in $users) {
    $photopath = "path\" + $user.samaccountname + '.jpg'
    $photo = [byte[]](Get-Content $photopath -Encoding byte)
    Set-ADUser $user -Replace @{thumbnailPhoto=$photo}
    }
```

## Export photos from Active Directory

To export the photo from a specific user, use **Get-ADDUser** to locate the user with a particular property named **ThumbnailPhoto**. Then extract the ThumbnailPhoto property and encode it to a sequence of bytes.

```powershell
$user = Get-ADUser $username -Properties thumbnailPhoto
$user.thumbnailPhoto | Set-Content $photopath -Encoding byte
```


To export all photos attached to all users from a specific OU, you can do something similar like below:

```powershell
$users = Get-AdUser -Filter * -SearchBase "OU=User, DC=domain, DC=local" -properties thumbnailphoto
foreach ($user in $users) {
    $photo = "\\sharepoint\c$\inetpub\wwwroot\cisco\" + $user.samaccountname + '.jpg'
    $user.thumbnailphoto | set-content $photo -encoding byte
}
```

And that’s about it. It works like a charm in my case. Enjoy.

## [KC's Blog](https://www.kjctech.net/)