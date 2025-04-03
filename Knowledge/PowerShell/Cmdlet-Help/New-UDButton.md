---
external help file: UniversalDashboard.MaterialUI-help.xml
Module Name: UniversalDashboard
online version: https://go.microsoft.com/fwlink/?LinkId=526726
schema: 2.0.0
---

# New-UDButton

## SYNOPSIS
Creates a new button.

## SYNTAX

```
New-UDButton
```

## DESCRIPTION
Creates a new button.
Buttons are used to allow the user to take action.

## EXAMPLES

### BEISPIEL 1
```
Creates a button with the GitHub logo and redirects the user to GitHub when clicked.
```

$Icon = New-UDIcon -Icon 'github'
New-UDButton -Text "Submit" -Id "btnClick" -Icon $Icon -OnClick {
    Invoke-UDRedirect https://github.com
}

### BEISPIEL 2
```
Creates a button with a blue background.
```

New-UDButton -Text "Submit" -Style @{ backgroundColor = "blue"}  -OnClick {
    Invoke-UDRedirect https://github.com
}

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
