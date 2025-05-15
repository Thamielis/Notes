In this article you will learn how to use ADSI searcher. Script finds users based on **samaccountnames** and gathers their attributes.

Instead of using AD cmdlets like **Get-ADUser** we can use ADSI search method which is much faster – it can be used when we have to query many users:

```
12$Root = [ADSI]''$Searcher = New-Object System.DirectoryServices.DirectorySearcher($Root)
In $SAMNames variable you have to add your AD users samaccountnames and in object part you can specify which attributes you would like to extract. In this example it will be only samaccountname,mail and mobile attributes:
12345678910$SAMNames = "pawel.janowicz","artur.brodzinski"$User.Properties($User.Properties).samaccountname($User.Properties).mail($User.Properties).mobile
Output:
ADSI
Final script:
        $SAMNames = "pawel.janowicz","artur.brodzinski"
        $Results = @()
        $Root = [ADSI]''

        $Searcher = New-Object System.DirectoryServices.DirectorySearcher($Root)

        # Loop each user
        ForEach($SAMName in $SAMNames){
            $Searcher.filter = (&(objectClass=user)(sAMAccountName= $SAMName))

            $User = $Searcher.findall()
            If($User){
                    # Create PS Object
                    $Object = New-Object PSObject -Property @{ 

                    Samaccountname = (($User.Properties).samaccountname | Out-String)
                    Email  = (($User.Properties).mail | Out-String)
                    Mobile = (($User.Properties).mobile | Out-String)

                   }
                   $Results += $Object
            }
        }
        # Display results
        $Results | Format-Table Samaccountname,Email,Mobile
For other ADSI search examples please refer to technet page – link.


```