---
external help file: UniversalDashboard.MaterialUI-help.xml
Module Name: UniversalDashboard
online version: https://go.microsoft.com/fwlink/?LinkId=526726
schema: 2.0.0
---

# New-UDAutocomplete

## SYNOPSIS
Creates an autocomplete textbox.

## SYNTAX

```
New-UDAutocomplete
```

## DESCRIPTION
Creates an autocomplete textbox.
Autocomplete text boxes can be used to allow the user to select from a large list of static or dynamic items.
Typing in the textbox will filter the list.

## EXAMPLES

### BEISPIEL 1
```
Creates a autocomplete with a static list of options.
```

New-UDAutocomplete -Id 'autoComplete' -Options @('Test', 'Test2', 'Test3', 'Test4')

### BEISPIEL 2
```
Creates an autocomplete with a dynamically filtered set of options
```

New-UDAutocomplete -Id 'autoCompleteDynamic' -OnLoadOptions { 
    @('Test', 'Test2', 'Test3', 'Test4') | Where-Object { $_ -match $Body } | ConvertTo-Json
}

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
