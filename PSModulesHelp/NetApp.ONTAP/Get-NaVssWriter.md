Get-NaVssWriter
---------------

### Synopsis
Get a list of available VSS writers on the current system.

---

### Description

Get a list of available VSS writers on the current system.

---

### Related Links
* [Get-NaVssProvider](Get-NaVssProvider)

* [Get-NaVssSnapshot](Get-NaVssSnapshot)

---

### Examples
> Example 1

Get-NaVssWriter
Get a list of available VSS writers on the current system.

Name                            WriterId                             WriterInstanceId                      State
----                            --------                             ----------------                      -----
Task Scheduler Writer           d61d61c8-d73a-4eee-8cdd-f6f9786b7124 1bddd48e-5052-49db-9b07-b96f96727e6b STABLE
VSS Metadata Store Writer       75dfb225-e2e4-4d39-9ac9-ffaff65ddf06 088e7a7d-09a8-4cc6-a609-ad90e75ddc93 STABLE
Performance Counters Writer     0bada1de-01a9-4625-8278-69e735f39dd2 f0086dda-9efc-47c5-8eb6-a944c3d09381 STABLE
ASR Writer                      be000cbe-11fe-4426-9c58-531aa6355fc4 32457a2b-07fb-4b14-8741-01e35e632060 STABLE
SqlServerWriter                 a65faa63-5ea8-4ebc-9dbd-a0c4db26912a 967e2b4d-c711-496f-be80-0e7c326a31d5 STABLE
WMI Writer                      a6ad56c2-b509-4e6c-bb19-49d8f43532f0 9441b829-3997-477b-924a-d7214e3e0335 STABLE
BITS Writer                     4969d978-be47-48b0-b100-f328f07ac1e0 aaab528d-9f49-434b-b414-0e43a4433089 STABLE
IIS Config Writer               2a40fd15-dfca-4aa8-a654-1f8c654603f6 bb090708-fe61-45dd-90f9-4f6df8425199 STABLE
Registry Writer                 afbab4a2-367d-4d15-a586-71dbb18f8485 4b56ea12-d805-4767-814e-6c4f86905b28 STABLE
COM+ REGDB Writer               542da469-d3e1-473c-9f4f-7847f01fc64f 36dc29f5-6f07-4901-a8e4-2be0d258cf09 STABLE
Shadow Copy Optimization Writer 4dc3bdd4-ab48-4d07-adb0-3bee2926fd7f bff08e91-9a7c-4228-8312-c6ce45cecee2 STABLE

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.Vss.VssWriter

---

### Notes
category: vss

---

### Syntax
```PowerShell
Get-NaVssWriter [<CommonParameters>]
```
