Import-ParameterConfiguration
-----------------------------

### Synopsis
Loads a metadata file based on the calling command name and combines the values there with the parameter values of the calling function.

---

### Description

This function gives command authors and users an easy way to let the default parameter values of the command be set by a configuration file in the folder you call it from.

Normally, you have three places to get parameter values from. In priority order, they are:
- Parameters passed by the caller always win
- The PowerShell $PSDefaultParameterValues hashtable appears to the function as if the user passed it
- Default parameter values (defined in the function)

If you call this command at the top of a function, it overrides (only) the default parameter values with

- Values from a manifest file in the present working directory ($pwd)

---

### Examples
> EXAMPLE 1

Given that you've written a script like:

```powershell
function New-User {
    [CmdletBinding()]
    param(
        $FirstName,
        $LastName,
        $UserName,
        $Domain,
        $EMail,
        $Department,
        [hashtable]$Permissions
    )
    Import-ParameterConfiguration -Recurse
    # Possibly calculated based on (default) parameter values
    if (-not $UserName) { $UserName = "$FirstName.$LastName" }
    if (-not $EMail)    { $EMail = "$UserName@$Domain" }

    # Lots of work to create the user's AD account, email, set permissions etc.

    # Output an object:
    [PSCustomObject]@{
        PSTypeName  = "MagicUser"
        FirstName   = $FirstName
        LastName    = $LastName
        EMail       = $EMail
        Department  = $Department
        Permissions = $Permissions
    }
}

```

You could create a User.psd1 in a folder with just:

```

@{ Domain = "HuddledMasses.org" }


```

Now the following command would resolve the `User.psd1`
And the user would get an appropriate email address automatically:

PS> New-User Joel Bennett

FirstName   : Joel
LastName    : Bennett
EMail       : Joel.Bennett@HuddledMasses.org

> EXAMPLE 2

```PowerShell
Import-ParameterConfiguration works recursively (up through parent folders)
That means it reads config files in the same way git reads .gitignore,
with settings in the higher level files (up to the root?) being
overridden by those in lower level files down to the WorkingDirectory

Following the previous example to a ridiculous conclusion,
we could automate creating users by creating a tree like:

C:\HuddledMasses\Security\Admins\ with a User.psd1 in each folder:

# C:\HuddledMasses\User.psd1:
@{
    Domain = "HuddledMasses.org"
}

# C:\HuddledMasses\Security\User.psd1:
@{
    Department = "Security"
    Permissions = @{
        Access = "User"
    }
}

# C:\HuddledMasses\Security\Admins\User.psd1
@{
    Permissions = @{
        Access = "Administrator"
    }
}

And then switch to the Admins directory and run:

PS> New-User Joel Bennett

FirstName   : Joel
LastName    : Bennett
EMail       : Joel.Bennett@HuddledMasses.org
Department  : Security
Permissions : { Access = Administrator }
```
> EXAMPLE 3

Following up on our earlier example, let's look at a way to use that -FileName parameter.
If you wanted to use a different configuration files than your Noun, you can pass the file name in.
You could even use one of your parameters to generate the file name. If we modify the function like ...

function New-User {
    [CmdletBinding()]
    param(
        $FirstName,
        $LastName,
        $UserName,
        $Domain,
        $EMail,
        $Department,
        [hashtable]$Permissions
    )
    Import-ParameterConfiguration -FileName "${Department}User.psd1"
    # Possibly calculated based on (default) parameter values
    if (-not $UserName) { $UserName = "$FirstName.$LastName" }
    if (-not $EMail)    { $EMail = "$UserName@$Domain" }

    # Lots of work to create the user's AD account and email etc.
    [PSCustomObject]@{
        PSTypeName = "MagicUser"
        FirstName = $FirstName
        LastName = $LastName
        EMail      = $EMail
        # Passthru for testing
        Permissions = $Permissions
    }
}

Now you could create a `SecurityUser.psd1`

@{
    Domain = "HuddledMasses.org"
    Permissions = @{
        Access = "Administrator"
    }
}

And run:

PS> New-User Joel Bennett -Department Security

---

### Parameters
#### **WorkingDirectory**
The folder the configuration should be read from. Defaults to the current working directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **FileName**
The name of the configuration file.
The default value is your command's Noun, with the ".psd1" extention.
So if you call this from a command named Build-Module, the noun is "Module" and the config $FileName is "Module.psd1"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Recurse**
If set, considers configuration files in the parent, and it's parent recursively

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowedVariables**
Allows extending the valid variables which are allowed to be referenced in configuration
BEWARE: This exposes the value of these variables in the calling context to the configuration file
You are reponsible to only allow variables which you know are safe to share

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

---

### Syntax
```PowerShell
Import-ParameterConfiguration [[-WorkingDirectory] <String>] [[-FileName] <String>] [-Recurse] [[-AllowedVariables] <String[]>] [<CommonParameters>]
```
