---
external help file: PSProjectStatus-help.xml
Module Name: PSProjectStatus
online version: https://bit.ly/4833Pv8
schema: 2.0.0
---

# Get-PSProjectTask

## SYNOPSIS

List project tasks

## SYNTAX

```yaml
Get-PSProjectTask [[-Path] <String>] [-TaskID <Int32>] [<CommonParameters>]
```

## DESCRIPTION

List defined tasks in the PSProject file. You will get a warning if no tasks are defined.

## EXAMPLES

### Example 1

```powershell
PS C:\Scripts\PSWorkItem> Get-PSProjectTask

   Name: PSWorkItem [C:\Scripts\PSWorkItem]

   ● Pester tests [1]
   ● add message localization [2]
   ● fix PDF image location [3]

```

Display tasks. If you run this in the console of VSCode, you should get ANSI formatted output. The number in brackets is the TaskID.

### Example 2

```powershell
PS C:\PSWorkItem> Get-PSProjectTask -TaskID 2

   Name: PSWorkItem [C:\Scripts\PSWorkItem]

   ● add message localization [2]
```

Get a task by ID number.

## PARAMETERS

### -Path

Enter the parent path to the psproject.json file, e.g.
c:\scripts\mymodule.

```yaml
Type: String
Parameter Sets: (All)
Aliases: FullName

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -TaskID

Get a task by its ID number

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: ID

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### psProjectTask

## NOTES

## RELATED LINKS

[New-PSProjectTask](New-PSProjectTask.md)

[Remove-PSProjectTask](Remove-PSProjectTask.md)
