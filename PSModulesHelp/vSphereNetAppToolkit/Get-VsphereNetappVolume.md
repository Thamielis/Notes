Get-VsphereNetappVolume
-----------------------

### Synopsis

---

### Description

Get vSphere Datastore to NetApp Volume mapping

---

### Related Links
* [https://mycloudrevolution.com/](https://mycloudrevolution.com/)

---

### Examples
> BEISPIEL 1

```PowerShell
Get-VsphereNetappVolume -vSphereDatastore $myDatastore
```

---

### Parameters
#### **Datastore**
vSphere Datastore Object

|Type             |Required|Position|PipelineInput |
|-----------------|--------|--------|--------------|
|`[DatastoreImpl]`|true    |1       |true (ByValue)|

---

### Notes
File Name  : Get-VsphereNetappVolume.psm1
Author     : Markus Kraus
Version    : 1.0
State      : Ready

---

### Syntax
```PowerShell
Get-VsphereNetappVolume [-Datastore] <DatastoreImpl> [<CommonParameters>]
```
