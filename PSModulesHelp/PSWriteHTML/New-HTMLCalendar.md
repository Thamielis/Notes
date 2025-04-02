New-HTMLCalendar
----------------

### Synopsis

New-HTMLCalendar [[-CalendarSettings] <scriptblock>] [[-HeaderLeft] <string[]>] [[-HeaderCenter] <string[]>] [[-HeaderRight] <string[]>] [[-DefaultDate] <datetime>] [[-NavigationLinks] <bool>] [[-NowIndicator] <bool>] [[-EventLimit] <bool>] [[-WeekNumbers] <bool>] [[-Selectable] <bool>] [[-SelectMirror] <bool>] [[-InitialView] <string>] [[-UrlTarget] <string>] [-BusinessHours] [-Editable] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BusinessHours**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **CalendarSettings**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[scriptblock]`|false   |0       |false        |

#### **DefaultDate**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[datetime]`|false   |4       |false        |

#### **Editable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **EventLimit**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |7       |false        |

#### **HeaderCenter**

Valid Values:

* prev
* next
* today
* prevYear
* nextYear
* dayGridDay
* dayGridWeek
* dayGridMonth
* timeGridWeek
* timeGridDay
* listDay
* listWeek
* listMonth
* title
* listYear

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |2       |false        |

#### **HeaderLeft**

Valid Values:

* prev
* next
* today
* prevYear
* nextYear
* dayGridDay
* dayGridWeek
* dayGridMonth
* timeGridWeek
* timeGridDay
* listDay
* listWeek
* listMonth
* title
* listYear

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |1       |false        |

#### **HeaderRight**

Valid Values:

* prev
* next
* today
* prevYear
* nextYear
* dayGridDay
* dayGridWeek
* dayGridMonth
* timeGridWeek
* timeGridDay
* listDay
* listWeek
* listMonth
* title
* listYear

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |3       |false        |

#### **InitialView**

Valid Values:

* dayGridDay
* dayGridWeek
* dayGridMonth
* timeGridDay
* timeGridWeek
* listDay
* listWeek
* listMonth
* listYear

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |11      |false        |

#### **NavigationLinks**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |5       |false        |

#### **NowIndicator**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |6       |false        |

#### **SelectMirror**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |10      |false        |

#### **Selectable**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |9       |false        |

#### **UrlTarget**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |12      |false        |

#### **WeekNumbers**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |8       |false        |

---

### Inputs
None

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
{@{name=New-HTMLCalendar; CommonParameters=True; parameter=System.Object[]}}
```
