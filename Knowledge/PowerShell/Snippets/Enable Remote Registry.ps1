$ComputerName = @('DC2', 'SRVSUBCA', 'SRVRDP')
foreach ($Computer in $ComputerName) {
    if ($Status = Get-Service -ComputerName $Computer -Name RemoteRegistry -EA SilentlyContinue |
      Select -ExpandProperty Status) {
        if ($Status -ne 'Running') {
            sc.exe "\\$Computer" config remoteregistry start= auto | Out-Null
            if ($?) {
                Write-Output "${Computer}: Successfully set RemoteRegistry service to automatic startup."
            }
            else {
                Write-Warning "${Computer}: Failed to set RemoteRegistry service to automatic startup. Aborting processing of this computer."
                continue
            }
            Start-Sleep -Milliseconds 250
            sc.exe "\\$Computer" start remoteregistry | Out-Null
            Write-Output "${Computer}: Fired off a start signal for the RemoteRegistry service."
            Start-Sleep -Milliseconds 500
            if ($Status = Get-Service -ComputerName $Computer -Name RemoteRegistry -EA SilentlyContinue |
              Select -ExpandProperty Status) {
                Write-Output "${Computer}: Current state of RemoteRegistry service is: $Status. It might need some more time."
            }
            else {
                Write-Warning "${Computer}: Unable to determine if service is running after starting it and sleeping a little."
            }
        }
        else {
            Write-Output "${Computer}: The RemoteRegistry service is already running."
        }
    }
    else {
        Write-Warning "${Computer}: Unable to determine if service is running. Aborting processing of this computer."
    }
}