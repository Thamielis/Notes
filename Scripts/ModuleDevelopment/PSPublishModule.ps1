<#
    File         : PSPublishModule.ps1                                         #
    Project      : ModuleDevelopment                                           #
    Created Date : Mon May 19 2025                                             #
    Author       : Mario Mellunig                                              #
    -------------------------------                                            #
    Last Modified: Mon May 19 2025                                             #
    Modified By  : Mario Mellunig                                              #
    -------------------------------                                            #
    Copyright (c) 2025 Kostwein Maschinenbau GmbH                              #
    -------------------------------                                            #
    HISTORY:                                                                   #
    Date      	By	Comments                                                   #
    ----------	---	---------------------------------------------------------  #
#>

$ModuleArgs = @{
    Path = 'C:\Users\admmellunigm\GitHub\KOWModule'
    ModuleName = 'PSConfig'
}

New-PrepareModule @ModuleArgs
