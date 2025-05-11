Get-VBRSession
--------------

### Synopsis
Returns jobs sessions.

---

### Description

This cmdlet returns sessions for a selected job.
Important! To get tape backup job sessions, tun the Get-VBRTapeBackupSession cmdlet.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Getting Sessions for Specific Job

$job = Get-VBRJob -Name "Backup Copy Job"
$session = Get-VBRSession -Job $job
This example shows how to get the session for the specified job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet to get the backup job. Save the result to the $job variable.
2. Run the Get-VBRSession cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Id**
Specifies the ID of the session. The cmdlet will return the session with this ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Job**
Specifies the job for which you want to get sessions that have been run.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[VBRJob]`|true    |named   |True (ByPropertyName)|

#### **Last**
Defines that the command returns the last session of the specified job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Result**
Specifies the session result. The cmdlet will return sessions with the specified result:
* None
* Success
* Warning
* Failed
Valid Values:

* None
* Success
* Warning
* Failed

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRSessionResult]`|false   |named   |False        |

#### **Session**
Specifies the job session for which you want to get an updated state.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBRSession]`|true    |named   |True (ByPropertyName, ByValue)|

#### **State**
Specifies the session state. The cmdlet will return sessions with the specified state.
Valid Values:

* Stopped
* Starting
* Stopping
* Working
* Pausing
* Resuming
* WaitingTape
* Idle
* Postprocessing
* WaitingRepository
* Pending
* WaitingSlot
* ActionRequired

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRSessionState]`|false   |named   |False        |

#### **Type**
Specifies the type of the session. The cmdlet will return the session of this ID.
Valid Values:

* Backup
* Replica
* Copy
* DRV
* RestoreVm
* RestoreVmFiles
* RestoreFiles
* Failover
* QuickMigration
* UndoFailover
* FileLevelRestore
* LinuxFileLevelRestore
* InstantRecovery
* RestoreHdd
* Failback
* PermanentFailover
* UndoFailback
* CommitFailback
* ShellRun
* VolumesDiscover
* HvCtpRescan
* CatCleanup
* SanRescan
* CreateSanSnapshot
* FileTapeBackup
* FileTapeRestore
* TapeValidate
* TapeInventory
* VmTapeBackup
* VmTapeRestore
* SanMonitor
* DeleteSanSnapshot
* TapeErase
* TapeEject
* TapeExport
* TapeImport
* TapeCatalog
* TapeLibrariesDiscover
* PowerShellScript
* VmReconfig
* VmStart
* VcdVAppRestore
* VcdVmRestore
* HierarchyScan
* ViVmConsolidation
* ApplicationLevelRestore
* RemoteReplica
* BackupSync
* SqlLogBackup
* LicenseAutoUpdate
* OracleLogBackup
* TapeMarkAsFree
* TapeDeleteFromLibrary
* TapeMoveToMediaPool
* TapeCatalogue
* StorageCopyPolicy
* StorageCopyWorker
* StorageCopyParentWorker
* SimpleBackupCopyWorker
* QuickMigrationCheck
* SimpleBackupCopyPolicy
* SimpleSqlBackupCopyWorker
* SimpleOracleBackupCopyWorker
* SimpleBackupCopyParentWorker
* SimplePostgresBackupCopyWorker
* RepoCopyPolicy
* PostgreSqlLogBackup
* UnarchiveSanSnapshot
* HealthCheck
* StorageCopyLogWorker
* ConfBackup
* ConfRestore
* ConfResynchronize
* WaGlobalDedupFill
* DatabaseMaintenance
* RepositoryMaintenance
* InfrastructureRescan
* DiskInstantRecovery
* DiskInstantPublishingViaNfs
* DiskInstantPublishingViaMount
* MountServiceMount
* InstantFileShareRestore
* CheckRootSecurityInfoForNasBackup
* FileShareMigration
* FirstClassDiskInstantRestore
* FirstClassDiskQuickMigration
* HvLabDeploy
* HvLabDelete
* FailoverPlan
* UndoFailoverPlan
* FailoverPlanTask
* UndoFailoverPlanTask
* PlannedFailover
* ViLabDeploy
* ViLabDelete
* ViLabStart
* Cloud
* CloudApplDeploy
* HardwareQuotasProcessing
* ReconnectVpn
* DisconnectVpn
* OrchestratedTask
* ViReplicaRescan
* ExternalRepositoryMaintenance
* DeleteBackup
* CloudProviderRescan
* CdpReplica
* AzureApplDeploy
* TapeTenantRestore
* TapeCopy
* TapeDeletedObjectsCleanUp
* Unknown
* EndpointBackup
* EndpointRestore
* BackupCacheSync
* EndpointSqlLogBackup
* EndpointOracleLogBackup
* EndpointPostgreSqlLogBackup
* OracleRMANBackup
* SapHanaBackintBackup
* OracleRMANRestore
* SapHanaBackintRestore
* OracleRMANBackupCopyWorker
* SapHanaBackintBackupCopyWorker
* PluginBackupCopyPolicy
* SapOracleBackintBackup
* SapOracleBackintRestore
* SapOracleBackintBackupCopyWorker
* MSSQLPluginBackup
* MSSQLPluginRestore
* MSSQLPluginBackupCopyWorker
* DB2PluginBackup
* DB2PluginRestore
* DB2PluginBackupCopyWorker
* DbPluginMetaUpgradeJob
* CloudBackup
* RestoreVirtualDisks
* RestoreAgentVolumes
* InfraItemSave
* InfraItemUpgrade
* InfraItemDelete
* AzureWinProxySave
* FileServerSave
* CdpClustersDeploy
* CdpVcdDeploy
* VmsLinuxTransportMgmt
* FileLevelRestoreByEnterprise
* RepositoryEvacuate
* LogsExport
* InfraStatistic
* BackgroundOperation
* AzureVmRestore
* AzureInstantRestore
* AzureInstantRestoreMigration
* AzureInstantRestoreSwitchover
* EpAgentManagement
* EpAgentDiscoveryObsolete
* EpAgentPolicy
* EpAgentBackup
* EpAgentTestCreds
* EpAgentDiscovery
* Retention
* EpAgentOperationBackupNow
* EpAgentOperationActiveFull
* EpAgentOperationStopBackup
* EpAgentOperationPurgeCache
* EpPluginPolicy
* EpPluginPolicyLog
* NasBackup
* NasBackupBrowse
* NasRestore
* NasBackupCopy
* NasDownloadMeta
* NasSyncState
* NasRelocateBackup
* NasHealthCheckBackup
* NasBackupDump
* VmbApiPolicyTempJob
* PlatformSnapshotJob
* PlatformBackupJob
* PlatformSnapshotCopyJob
* PlatformServiceJob
* PlatformBackupArchieveJob
* PlatformIndexing
* PlatformExternalRescanBackupAppliance
* PlatformExternalAddBackupAppliance
* PlatformExternalUpdateBackupApplianceSettings
* PlatformExternalUpdateBackupAppliance
* PlatformExternalUpgradeBackupAppliance
* PlatformExternalRestoreConfigurationOnBackupAppliance
* PlatformExternalRemoveBackupAppliance
* PlatformExternalRegisterVirtualizationManager
* PlatformExternalUpdateVirtualizationManagerSettings
* PlatformExternalRemoveVirtualizationManager
* PlatformExternalRescanVirtualizationManager
* PlatformExternalTestingWorker
* PlatformExternalUpdatingWorkerSettings
* PlatformExternalHealthcheck
* AmazonRestore
* StagedRestore
* ArchiveBackup
* ArchiveRehydration
* ArchiveSync
* ArchiveCopy
* ArchiveFreezing
* PublishBackup
* CloudBinArchiveTierDownload
* DirectBackupSync
* HvStagedRestore
* VbkExport
* GuestScriptingConnect
* ForeignTransform
* AuditZip
* CustomPlatformRestoreVm
* CustomPlatformDiskRestore
* CustomPlatformFileLevelRestore
* CustomPlatformBackupDataRetrieval
* CustomPlatformConfigurationRestore
* SwitchReplicaToProduction
* RestAutomation
* GoogleRestore
* PerVmParentBackup
* PerVmBackupUpgradeJob
* PerVmMoveBackup
* PerVmCopyBackup
* RepairDbPluginBackup
* SimpleCopyExternalBackupWatcher
* BestPracticeAnalyzer
* MalwareDetection
* SureBackupLite
* SureBackupLiteAdHoc
* KmsKeyRotation
* ShadowAncillarySession

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[EDbJobType]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSession

Veeam.Backup.PowerShell.Infos.VBRJob

Veeam.Backup.Model.EDbJobType

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRSession -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRSession -Job <VBRJob> [-Last] [<CommonParameters>]
```
```PowerShell
Get-VBRSession -Job <VBRJob> [-Result {None | Success | Warning | Failed}] [<CommonParameters>]
```
```PowerShell
Get-VBRSession -Job <VBRJob> [-State {Stopped | Starting | Stopping | Working | Pausing | Resuming | WaitingTape | Idle | Postprocessing | WaitingRepository | Pending | WaitingSlot | ActionRequired}] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-VBRSession -Session <VBRSession> [<CommonParameters>]
```
```PowerShell
Get-VBRSession -Type {Backup | Replica | Copy | DRV | RestoreVm | RestoreVmFiles | RestoreFiles | Failover | QuickMigration | UndoFailover | FileLevelRestore | LinuxFileLevelRestore | InstantRecovery | 
```
```PowerShell
RestoreHdd | Failback | PermanentFailover | UndoFailback | CommitFailback | ShellRun | VolumesDiscover | HvCtpRescan | CatCleanup | SanRescan | CreateSanSnapshot | FileTapeBackup | FileTapeRestore | 
```
```PowerShell
TapeValidate | TapeInventory | VmTapeBackup | VmTapeRestore | SanMonitor | DeleteSanSnapshot | TapeErase | TapeEject | TapeExport | TapeImport | TapeCatalog | TapeLibrariesDiscover | PowerShellScript | 
```
```PowerShell
VmReconfig | VmStart | VcdVAppRestore | VcdVmRestore | HierarchyScan | ViVmConsolidation | ApplicationLevelRestore | RemoteReplica | BackupSync | SqlLogBackup | LicenseAutoUpdate | OracleLogBackup | 
```
```PowerShell
TapeMarkAsFree | TapeDeleteFromLibrary | TapeMoveToMediaPool | TapeCatalogue | StorageCopyPolicy | StorageCopyWorker | StorageCopyParentWorker | SimpleBackupCopyWorker | QuickMigrationCheck | 
```
```PowerShell
SimpleBackupCopyPolicy | SimpleSqlBackupCopyWorker | SimpleOracleBackupCopyWorker | SimpleBackupCopyParentWorker | SimplePostgresBackupCopyWorker | RepoCopyPolicy | PostgreSqlLogBackup | UnarchiveSanSnapshot | 
```
```PowerShell
HealthCheck | StorageCopyLogWorker | ConfBackup | ConfRestore | ConfResynchronize | WaGlobalDedupFill | DatabaseMaintenance | RepositoryMaintenance | InfrastructureRescan | DiskInstantRecovery | 
```
```PowerShell
DiskInstantPublishingViaNfs | DiskInstantPublishingViaMount | MountServiceMount | InstantFileShareRestore | CheckRootSecurityInfoForNasBackup | FileShareMigration | FirstClassDiskInstantRestore | 
```
```PowerShell
FirstClassDiskQuickMigration | HvLabDeploy | HvLabDelete | FailoverPlan | UndoFailoverPlan | FailoverPlanTask | UndoFailoverPlanTask | PlannedFailover | ViLabDeploy | ViLabDelete | ViLabStart | Cloud | 
```
```PowerShell
CloudApplDeploy | HardwareQuotasProcessing | ReconnectVpn | DisconnectVpn | OrchestratedTask | ViReplicaRescan | ExternalRepositoryMaintenance | DeleteBackup | CloudProviderRescan | CdpReplica | AzureApplDeploy 
```
```PowerShell
| TapeTenantRestore | TapeCopy | TapeDeletedObjectsCleanUp | Unknown | EndpointBackup | EndpointRestore | BackupCacheSync | EndpointSqlLogBackup | EndpointOracleLogBackup | EndpointPostgreSqlLogBackup | 
```
```PowerShell
OracleRMANBackup | SapHanaBackintBackup | OracleRMANRestore | SapHanaBackintRestore | OracleRMANBackupCopyWorker | SapHanaBackintBackupCopyWorker | PluginBackupCopyPolicy | SapOracleBackintBackup | 
```
```PowerShell
SapOracleBackintRestore | SapOracleBackintBackupCopyWorker | MSSQLPluginBackup | MSSQLPluginRestore | MSSQLPluginBackupCopyWorker | DB2PluginBackup | DB2PluginRestore | DB2PluginBackupCopyWorker | 
```
```PowerShell
DbPluginMetaUpgradeJob | CloudBackup | RestoreVirtualDisks | RestoreAgentVolumes | InfraItemSave | InfraItemUpgrade | InfraItemDelete | AzureWinProxySave | FileServerSave | CdpClustersDeploy | CdpVcdDeploy | 
```
```PowerShell
VmsLinuxTransportMgmt | FileLevelRestoreByEnterprise | RepositoryEvacuate | LogsExport | InfraStatistic | BackgroundOperation | AzureVmRestore | AzureInstantRestore | AzureInstantRestoreMigration | 
```
```PowerShell
AzureInstantRestoreSwitchover | EpAgentManagement | EpAgentDiscoveryObsolete | EpAgentPolicy | EpAgentBackup | EpAgentTestCreds | EpAgentDiscovery | Retention | EpAgentOperationBackupNow | 
```
```PowerShell
EpAgentOperationActiveFull | EpAgentOperationStopBackup | EpAgentOperationPurgeCache | EpPluginPolicy | EpPluginPolicyLog | NasBackup | NasBackupBrowse | NasRestore | NasBackupCopy | NasDownloadMeta | 
```
```PowerShell
NasSyncState | NasRelocateBackup | NasHealthCheckBackup | NasBackupDump | VmbApiPolicyTempJob | PlatformSnapshotJob | PlatformBackupJob | PlatformSnapshotCopyJob | PlatformServiceJob | PlatformBackupArchieveJob 
```
```PowerShell
| PlatformIndexing | PlatformExternalRescanBackupAppliance | PlatformExternalAddBackupAppliance | PlatformExternalUpdateBackupApplianceSettings | PlatformExternalUpdateBackupAppliance | 
```
```PowerShell
PlatformExternalUpgradeBackupAppliance | PlatformExternalRestoreConfigurationOnBackupAppliance | PlatformExternalRemoveBackupAppliance | PlatformExternalRegisterVirtualizationManager | 
```
```PowerShell
PlatformExternalUpdateVirtualizationManagerSettings | PlatformExternalRemoveVirtualizationManager | PlatformExternalRescanVirtualizationManager | PlatformExternalTestingWorker | 
```
```PowerShell
PlatformExternalUpdatingWorkerSettings | AmazonRestore | StagedRestore | ArchiveBackup | ArchiveRehydration | ArchiveSync | ArchiveCopy | ArchiveFreezing | PublishBackup | CloudBinArchiveTierDownload | 
```
```PowerShell
DirectBackupSync | HvStagedRestore | VbkExport | GuestScriptingConnect | ForeignTransform | AuditZip | CustomPlatformRestoreVm | CustomPlatformDiskRestore | CustomPlatformFileLevelRestore | 
```
```PowerShell
CustomPlatformBackupDataRetrieval | CustomPlatformConfigurationRestore | SwitchReplicaToProduction | RestAutomation | GoogleRestore | PerVmParentBackup | PerVmBackupUpgradeJob | PerVmMoveBackup | 
```
```PowerShell
PerVmCopyBackup | RepairDbPluginBackup | SimpleCopyExternalBackupWatcher | BestPracticeAnalyzer | MalwareDetection | SureBackupLite | SureBackupLiteAdHoc | KmsKeyRotation | ShadowAncillarySession} 
```
```PowerShell
[<CommonParameters>]
```
