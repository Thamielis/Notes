Start-NcSystemImageInstall
--------------------------

### Synopsis
Start a software image fresh install.

---

### Description

Start a software image fresh install.  For updating an image, use Start-NcSystemImageUpdate.

---

### Related Links
* [Get-NcSystemImageUpdateStatus](Get-NcSystemImageUpdateStatus)

---

### Examples
> Example 1

```PowerShell
Start-NcSystemImageInstall -Node fas3070cluster01-01 -Url http://example.com/packages/image.tgz
Perform a fresh image install with the image located at http://example.com/packages/image.tgz on node fas3070cluster01-01.

LastMessage  : Downloading package. This may take up to 10 minutes.
RunStatus    : Working
ExitStatus   :
ExitMessage  :
Phase        : Download

```

---

### Parameters
#### **Node**
This specifies the node on which the software image is located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Url**
The location from which the software image is to be downloaded. The location can be specified in any of the following ways:
    As an HTTP URL in the form http://[username[:password]@]host_name[:port]/path_to_file. For instance, http://user:pass@example.com/downloads/image.tgz.  NOTE:  The management utility does not check whether the Web server is password protected; if a username and password are not provided in the URL the command will nearly always fail with the error "Confirmation needed"
    As an FTP URL in the form ftp://host_name[:port]/path_to_file. For instance, ftp://example.com/downloads/image.tgz.
    As a TFTP URL in the form tftp://host_name[:port]/path_to_file. For example, tftp://example.com/downloads/image.tgz. TFTP does not require a user name or password.
    As a path to a mounted file system in the form file://localhost/path_to_file. For example, file://localhost/mroot/etc/software/image.tgz.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Package|

#### **NewName**
Use this parameter to enter a package name that is different than the file name in the URL.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |named   |true (ByPropertyName)|RenamePackage|

#### **ReplacePackage**
If specified, the existing package is deleted and replaced with a new package.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemImageUpdateProgress

---

### Notes
Category: system
API: system-image-install
Family: cluster

---

### Syntax
```PowerShell
Start-NcSystemImageInstall [-Node] <String> [-Url] <String> [-NewName <String>] [-ReplacePackage] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
