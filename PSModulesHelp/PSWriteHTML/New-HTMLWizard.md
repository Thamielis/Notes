New-HTMLWizard
--------------

### Synopsis
Provides a simple way to build wizard

---

### Description

Provides a simple way to build wizard

---

### Examples
> EXAMPLE 1

```PowerShell
An example
```

---

### Parameters
#### **WizardSteps**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Theme**
Choose a theme to display wizard in
Valid Values:

* basic
* arrows
* square
* round
* dots

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **DisableCycleSteps**
Disables the navigation cycle through

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToolbarPosition**
Position of the toolbar (none, top, bottom, both)
Valid Values:

* bottom
* top
* both
* none

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ToolbarButtonPosition**
Button alignment of the toolbar (left, right, center)
Valid Values:

* right
* left
* center

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **HideNextButton**
Hide next button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HidePreviousButton**
Hide previous button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DiableAnchorClickable**
Disable anchor navigation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableAllAnchors**
Activates all anchors clickable all times

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableMarkDoneStep**
Disable done state on navigation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableMarkAllPreviousStepsAsDone**
Disable when a step selected by url hash, all previous steps are marked done

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveDoneStepOnNavigateBack**
While navigate back done step after active step will be cleared

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableAnchorOnDoneStep**
Disable the done steps navigation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableJustification**
Disable navigation menu justification

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableBackButtonSupport**
Disable the back button support

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableURLhash**
Disable selection of the tab based on url hash

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TransitionAnimation**
Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
Valid Values:

* none
* fade
* slide-horizontal
* slide-vertical
* slide-swing

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **TransitionSpeed**
Transion animation speed. Default 400

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

---

### Notes
Implementation based on: http://techlaboratory.net/jquery-smartwizard
License: MIT

---

### Syntax
```PowerShell
New-HTMLWizard [[-WizardSteps] <ScriptBlock>] [[-Theme] <String>] [-DisableCycleSteps] [[-ToolbarPosition] <String>] [[-ToolbarButtonPosition] <String>] [-HideNextButton] [-HidePreviousButton] [-DiableAnchorClickable] [-EnableAllAnchors] [-DisableMarkDoneStep] [-DisableMarkAllPreviousStepsAsDone] [-RemoveDoneStepOnNavigateBack] [-DisableAnchorOnDoneStep] [-DisableJustification] [-DisableBackButtonSupport] [-DisableURLhash] [[-TransitionAnimation] <String>] [[-TransitionSpeed] <Int32>] [<CommonParameters>]
```
