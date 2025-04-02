New-HTMLMain
------------

### Synopsis
Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

---

### Description

Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example40-Body.html -Show {
    New-HTMLMain {
        New-HTMLTabStyle -SlimTabs `
            -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none `
            -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize #-FontSize 10pt
New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey
        New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
            New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
                New-HTMLSection -HeaderText 'Default Section Style' {
                    New-HTMLTableStyle -Type Header -TextAlign right -TextColor Blue
                    New-HTMLTableStyle -Type Row -TextAlign left -TextColor Grey
                    New-HTMLTable -DataTable $Test1 {
                        New-HTMLTableHeader -Names 'ID', 'HandleCount'
                    } -Filtering #-HideFooter -FilteringLocation Both
                } -CanCollapse
            }
        }
        New-HTMLTab -Name 'Next' {

        }
    } -BackgroundColor Yellow -Color Red -FontSize 12px #-FontFamily 'Arial'
}
```
> EXAMPLE 2

```PowerShell
New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example34_01.html" {
    New-HTMLHeader {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
    New-HTMLMain {
        New-HTMLTab -TabName 'Test' {
            New-HTMLSection -HeaderText '0 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter -Simplify
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
        New-HTMLTab -TabName 'Test5' {
            New-HTMLSection -HeaderText '1 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                    # New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
    }
    New-HTMLFooter {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
} -Online -ShowHTML
```

---

### Parameters
#### **HTMLContent**
Provides ability to specify one or more elements within HTML. Using New-HTMLMain without it, makes no larger sense, as the content will be empty.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **BackgroundColor**
Define a background color of the body element. You can choose from 800 defined colors or provide your own hex color

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Color**
Choose a color of the body element. You can choose from 800 defined colors or provide your own hex color

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **FontFamily**
Choose a FontFamily for the body content

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **FontSize**
Choose a FontSize for the body content

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLMain [[-HTMLContent] <ScriptBlock>] [[-BackgroundColor] <String>] [[-Color] <String>] [[-FontFamily] <String>] [[-FontSize] <Object>] [<CommonParameters>]
```
