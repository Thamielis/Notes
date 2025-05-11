Join-Website
------------

### Synopsis

Join-Website [[-RequiredInfo] <hashtable>] [[-OptionalInfo] <hashtable>] [[-StorageAccountSetting] <string>] [[-StorageKeySetting] <string>] [[-SmtpServer] <string>] [[-FromEmail] <string>] [[-FromUser] <string>] [[-EmailPasswordSetting] <string>] [[-TermsOfService] <string>] [[-ExchangeServer] <string>] [[-UserTable] <string>] [[-IntroMessage] <string>] [[-ConfirmationMailSentMessage] <string>] [[-userPartition] <string>] [[-FacebookAppId] <string>] [[-InitialBalance] <double>] [[-LockoutBalance] <double>] [[-BlacklistParition] <string>] [[-WhitelistPartition] <string>] [-WebsiteUrl] <string> [-UseSsl] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BlacklistParition**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |17      |true (ByPropertyName)|

#### **ConfirmationMailSentMessage**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |12      |true (ByPropertyName)|

#### **EmailPasswordSetting**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |7       |true (ByPropertyName)|

#### **ExchangeServer**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |9       |true (ByPropertyName)|

#### **FacebookAppId**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |14      |true (ByPropertyName)|

#### **FromEmail**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |5       |true (ByPropertyName)|

#### **FromUser**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |6       |true (ByPropertyName)|

#### **InitialBalance**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[double]`|false   |15      |true (ByPropertyName)|

#### **IntroMessage**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |11      |true (ByPropertyName)|

#### **LockoutBalance**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[double]`|false   |16      |true (ByPropertyName)|

#### **OptionalInfo**

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[hashtable]`|false   |1       |true (ByPropertyName)|

#### **RequiredInfo**

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[hashtable]`|false   |0       |true (ByPropertyName)|

#### **SmtpServer**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |4       |true (ByPropertyName)|

#### **StorageAccountSetting**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |2       |true (ByPropertyName)|

#### **StorageKeySetting**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |3       |true (ByPropertyName)|

#### **TermsOfService**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |8       |true (ByPropertyName)|

#### **UseSsl**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[switch]`|false   |Named   |true (ByPropertyName)|

#### **UserTable**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |10      |true (ByPropertyName)|

#### **WebsiteUrl**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|true    |19      |true (ByPropertyName)|

#### **WhitelistPartition**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |18      |true (ByPropertyName)|

#### **userPartition**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |13      |true (ByPropertyName)|

---

### Inputs
System.Collections.Hashtable
System.String
System.Management.Automation.SwitchParameter
System.Double

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Join-Website; CommonParameters=True; parameter=System.Object[]}}
```
