#requires -modules Catesta

# Scaffolds a PowerShell module project for integration with GitHub Actions with the project code stored in GitHub. 
# A full set of GitHub project supporting files is provided. The project is set up for integration with Read the Docs.
$moduleParameters = @{
    ModuleName     = 'ModuleName'
    Description    = 'My awesome module is awesome'
    Version        = '0.0.1'
    FN             = 'user full name'
    CICD           = 'GITHUB'
    GitHubAOptions = 'windows', 'pwshcore', 'linux', 'macos'
    RepoType       = 'GITHUB'
    ReadtheDocs    = 'READTHEDOCS'
    RTDTheme       = 'READTHEDOCSTHEME'
    License        = 'MIT'
    Changelog      = 'CHANGELOG'
    COC            = 'CONDUCT'
    Contribute     = 'CONTRIBUTING'
    Security       = 'SECURITY'
    CodingStyle    = 'Stroustrup'
    Help           = 'Yes'
    Pester         = '5'
    S3Bucket       = 'PSGallery'
    NoLogo         = $true
}

New-ModuleProject -ModuleParameters $moduleParameters -DestinationPath $outPutPath

#######################################################################################

# PSCompany
$OutputPath = 'C:\Users\admmellunigm\GitHub\PSCompany'
$ModuleParameters = @{
    ModuleName     = 'PSCompany'
    Description    = 'Company related Powershell module'
    Version        = '0.0.1'
    FN             = 'Mario Mellunig'
    CICD           = 'GITHUB'
    GitHubAOptions = 'windows', 'pwshcore'
    RepoType       = 'GITHUB'
    ReadtheDocs    = 'READTHEDOCS'
    RTDTheme       = 'READTHEDOCSTHEME'
    License        = 'MIT'
    Changelog      = 'CHANGELOG'
    COC            = 'CONDUCT'
    #Contribute     = 'CONTRIBUTING'
    #Security       = 'SECURITY'
    CodingStyle    = 'Stroustrup'
    Help           = 'Yes'
    Pester         = '5'
    #S3Bucket       = 'PSGallery'
    NoLogo         = $true
}

New-ModuleProject -ModuleParameters $ModuleParameters -DestinationPath $OutPutPath

#######################################################################################

# PSToolbox
$ModuleParameters = @{
    ModuleName     = 'PSToolbox'
    Description    = 'PowerShell Functions for everyday'
    Version        = '0.0.1'
    FN             = 'Mario Mellunig'
    CICD           = 'GITHUB'
    GitHubAOptions = 'windows', 'pwshcore'
    RepoType       = 'GITHUB'
    ReadtheDocs    = 'READTHEDOCS'
    RTDTheme       = 'MATERIALTHEME'
    License        = 'MIT'
    Changelog      = 'CHANGELOG'
    COC            = 'CONDUCT'
    #Contribute     = 'CONTRIBUTING'
    #Security       = 'SECURITY'
    CodingStyle    = 'NONE'
    Help           = 'Yes'
    Pester         = '5'
    #S3Bucket       = 'PSGallery'
    NoLogo         = $true
}
$OutputPath = "C:\Users\admmellunigm\GitHub\$($ModuleParameters.ModuleName)"

New-ModuleProject -ModuleParameters $ModuleParameters -DestinationPath $OutPutPath
