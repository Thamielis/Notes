#requires -modules PSArchTools

$Journey = New-ArchDataJourney -Title "Sync-Sage2AD"

$SageData = $Journey | Add-ArchDataLayer -Key 'Sage' -Title 'Process Sage Export' -PassThru

$PrepareSageData = $SageData | Add-ArchDataLayer -Key 'Prepare' -Title 'Prepare Sage Data' -PassThru
$PrepareSageData | Add-ArchDataModel -Key "EmployeeCSV" -Title "Mitarbeiterdaten aus CSV" -Description "CSV-Import aus HR-System" -Class "original"

$CleanSageData = $PrepareSageData | Add-ArchDataLayer -Key 'CleanData' -Title 'Clean CSV Data' -PassThru
$CleanSageData | Add-ArchDataModel -Key 'NameExtraction' -Title 'Extract Header NAME' -Description "Extrahiert Vor-, Nachname (LeihFirma) aus Spalte NAME" -Class "exchange"
$CleanSageData | Add-ArchDataModel -Key 'GetSamAccountName' -Title 'Generate SamAccountName' -Description 'Generate SamAccountName from Given- and Surname' -Class 'exchange'
$CleanSageData | Add-ArchDataModel -Key 'GenSageADGroup' -Title 'Generate SageADGroupName' -Description 'Generate ADGroupname from Pattern Sage_<Abteilung>_<Kostenstelle>' -Class 'exchange'
$CleanSageData | Add-ArchDataModel -Key 'GetManager' -Title 'Extract Manager' -Description 'Extrahiert Vor- und Nachname des Vorgesetzten aus Spalte "Vorgesetzter Name"'

$CleanedSageData = $PrepareSageData | Add-ArchDataLayer -Key 'CleanedData' -Title 'Cleaned Employee Data' -PassThru
$CleanedSageData | Add-ArchDataModel -Key 'GivenName'
$CleanedSageData | Add-ArchDataModel -Key 'Surname'
$CleanedSageData | Add-ArchDataModel -Key 'SamAccountName'
$CleanedSageData | Add-ArchDataModel -Key 'SageADGroup'
$CleanedSageData | Add-ArchDataModel -Key 'Manager'

$PrepareSageData | Add-ArchDataFlow -Key 'Extract Given- and Surname' -Source 'NameExtraction' -Sink 'GivenName', 'Surname'
$PrepareSageData | Add-ArchDataFlow -Key 'SamAccountName' -Source 'GetSamAccountName' -Sink 'SamAccountName'
$PrepareSageData | Add-ArchDataFlow -Key 'SageADGroup' -Source 'GenSageADGroup' -Sink 'SageADGroup'
$PrepareSageData | Add-ArchDataFlow -Key 'Manager' -Source 'GetManager' -Sink 'Manager'


exit

##################################################################################################
$Journey = New-ArchDataJourney 'Diagram Title'
$Diner = $Journey | Add-ArchDataLayer diner -PassThru

$Bronze = $Diner | Add-ArchDataLayer bronze -PassThru
$Bronze | Add-ArchDataModel milk exchange
$Bronze | Add-ArchDataModel yeast exchange
$Bronze | Add-ArchDataModel flour exchange
$Bronze | Add-ArchDataModel beef exchange-original

$Silver = $Diner | Add-ArchDataLayer silver -PassThru
$Silver | Add-ArchDataModel cheese retention-original
$Diner | Add-ArchDataFlow making-cheese 'making cheese' -Sink cheese -Source milk, yeast
$Silver | Add-ArchDataModel bun retention-original
$Diner | Add-ArchDataFlow bake -Sink bun -Source flour, yeast
$Silver | Add-ArchDataModel patty retention
$Diner | Add-ArchDataFlow form -Sink patty -Source beef

$Gold = $Diner | Add-ArchDataLayer gold -PassThru
$Gold | Add-ArchDataModel burger analysis -Description 'very delicious'
$Diner | Add-ArchDataFlow fry -Description 'roast the bun a little and add the cheese to patty before the end' -Sink burger -Source bun, patty, cheese
