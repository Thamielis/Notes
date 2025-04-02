Get-Parameter
-------------

### Synopsis
Gets parameter info from a member.

---

### Description

The Get-Parameter cmdlet gets parameter info from a member.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/ClassExplorer/blob/master/docs/en-US/Get-Parameter.md)

* [Find-Type](Find-Type)

* [Find-Member](Find-Member)

* [Get-Assembly](Get-Assembly)

* [Format-MemberSignature](Format-MemberSignature)

---

### Examples
> EXAMPLE 1

```PowerShell
[powershell] | Find-Member Create | Get-Parameter

#    Member: public static PowerShell Create(RunspaceMode runspace);
#
# # Type                   Name                       Default      In  Out Opt
# - ----                   ----                       -------      --  --- ---
# 0 RunspaceMode           runspace                                 x   x   x
#
#    Member: public static PowerShell Create(InitialSessionState initialSessionState);
#
# # Type                   Name                       Default      In  Out Opt
# - ----                   ----                       -------      --  --- ---
# 0 InitialSessionState    initialSessionState                      x   x   x
#
#    Member: public static PowerShell Create(Runspace runspace);
#
# # Type                   Name                       Default      In  Out Opt
# - ----                   ----                       -------      --  --- ---
# 0 Runspace               runspace                                 x   x   x
Get parameters for all overloads of the PowerShell.Create method.
```

---

### Parameters
#### **Method**
Specifies the method to get parameters from.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[MethodBase]`|false   |named   |True (ByValue)|

---

### Inputs
System.Reflection.MethodBase

You can base methods and constructors to this cmdlet.

---

### Outputs
* [Reflection.ParameterInfo](https://learn.microsoft.com/en-us/dotnet/api/System.Reflection.ParameterInfo)

---

### Notes

---

### Syntax
```PowerShell
Get-Parameter [-Method <MethodBase>] [<CommonParameters>]
```
