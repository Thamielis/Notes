Add-VSBVirtualLab
-----------------

### Synopsis
Creates a VMware virtual lab.

---

### Description

This cmdlet creates a new VMware virtual lab.

A virtual lab is a component of SureBackup technology that allows you to configure a model of your production environment in a fenced-off lab.

One virtual lab can be used by several SureBackup jobs.

With Veeam PowerShell, you can create a basic virtual lab with automatically configured settings. The network settings for the virtual lab will be used the same as configured for the Veeam Backup server.

---

### Examples
> Example 1

```PowerShell
Add-VSBVirtualLab -Name "Exchange VLab 01" -Server $server -Datastore $datastore
This command creates a new virtual lab named "Exchange VLab 01". The server where the virtual lab will be located is obtained with Get-VBRServer and assigned to the $server variable beforehand. The datastore to store the redo files is obtained with Find-VBRViDatastore and assigned to the $datastore variable beforehand.
```

---

### Parameters
#### **Datastore**
Specifies the datastore on which redo logs for tested VMs should be stored.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |2       |False        |

#### **Name**
Specifies the string with the name you want to assign to the virtual lab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |False        |

#### **ProductionNetwork**
Specifies the virtual switch connected to the production network. Accepts VBRViVirtualSwitch object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualSwitch]`|false   |named   |False        |

#### **Server**
Specifies the ESX(i) host where the virtual lab should be created.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |1       |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VSBVirtualLab [[-Name] <String>] [[-Server] <CHost>] [[-Datastore] <CViDatastoreItem>] [-ProductionNetwork <VBRViVirtualSwitch>] [<CommonParameters>]
```
