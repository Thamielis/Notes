Get-CimData
-----------

### Synopsis
Helper function for retreiving CIM data from local and remote computers

---

### Description

Helper function for retreiving CIM data from local and remote computers

---

### Examples
> EXAMPLE 1

```PowerShell
Get-CimData -Class 'win32_bios' -ComputerName AD1,EVOWIN
```
> EXAMPLE 2

```PowerShell
Get-CimData -Class 'win32_bios'
```
> EXAMPLE 3

```PowerShell
Get-CimClass to get all classes
```

---

### Parameters
#### **Class**
Specifies the name of the CIM class for which to retrieve the CIM instances. You can use tab completion to browse the list of classes, because PowerShell gets a list of classes from the local WMI server to provide a list of class names.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **NameSpace**
Specifies the namespace for the CIM operation. The default namespace is root\cimv2. You can use tab completion to browse the list of namespaces, because PowerShell gets a list of namespaces from the local WMI server to provide a list of namespaces.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ComputerName**
Specifies computer on which you want to run the CIM operation. You can specify a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. If you do not specify this parameter, the cmdlet performs the operation on the local computer using Component Object Model (COM).

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **Protocol**
Specifies the protocol to use. The acceptable values for this parametDer are: DCOM, Default, or Wsman.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Credential**
Specifies a user account that has permission to perform this action. The default is the current user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |5       |false        |

#### **Properties**
Specifies a set of instance properties to retrieve. Use this parameter when you need to reduce the size of the object returned, either in memory or over the network. The object returned also contains the key properties even if you have not listed them using the Property parameter. Other properties of the class are present but they are not populated.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-CimData [-Class] <String> [[-NameSpace] <String>] [[-ComputerName] <String[]>] [[-Protocol] <String>] [[-Credential] <PSCredential>] [[-Properties] <String[]>] [<CommonParameters>]
```
