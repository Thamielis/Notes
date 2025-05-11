New-HTMLCalendar
----------------

### Synopsis
Creates a new HTML calendar using FullCalendar library.

---

### Description

This function creates a new HTML calendar using the FullCalendar library. It allows customization of various calendar settings such as header elements, initial view, default date, event handling, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLCalendar -CalendarSettings {
    # Define calendar settings here
}
Creates a new HTML calendar with default settings.
```
> EXAMPLE 2

```PowerShell
New-HTMLCalendar -CalendarSettings {
    # Define calendar settings here
} -HeaderLeft 'prev', 'next' -HeaderCenter 'title' -HeaderRight 'dayGridMonth', 'timeGridWeek' -DefaultDate (Get-Date) -NavigationLinks $true -NowIndicator $true -EventLimit $true -WeekNumbers $true -Selectable $true -SelectMirror $true -BusinessHours -Editable -InitialView 'dayGridMonth' -UrlTarget 'https://example.com' -EventTimeFormat @{
    hour           = '2-digit'
    minute         = '2-digit'
    omitZeroMinute = $false
    meridiem       = $false
    hour12         = $false
} -SlotLabelFormat @{
    hour           = '2-digit'
    minute         = '2-digit'
    omitZeroMinute = $false
    meridiem       = $false
    hour12         = $false
}
Creates a new HTML calendar with custom settings.
```

---

### Parameters
#### **CalendarSettings**
Specifies the script block containing settings for the calendar.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **HeaderLeft**
Specifies the elements to display on the left side of the calendar header.
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
|`[String[]]`|false   |2       |false        |

#### **HeaderCenter**
Specifies the element to display in the center of the calendar header.
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
|`[String[]]`|false   |3       |false        |

#### **HeaderRight**
Specifies the elements to display on the right side of the calendar header.
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
|`[String[]]`|false   |4       |false        |

#### **DefaultDate**
Specifies the default date to display on the calendar.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |5       |false        |

#### **NavigationLinks**
Indicates whether navigation links are enabled on the calendar.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |6       |false        |

#### **NowIndicator**
Indicates whether the current time indicator is displayed on the calendar.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |7       |false        |

#### **EventLimit**
Indicates whether to limit the number of events displayed on a day.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |8       |false        |

#### **WeekNumbers**
Indicates whether week numbers are displayed on the calendar.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |9       |false        |

#### **Selectable**
Indicates whether events can be selected on the calendar.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |10      |false        |

#### **SelectMirror**
Indicates whether a mirror effect is applied when selecting events.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |11      |false        |

#### **BusinessHours**
Indicates whether business hours are displayed on the calendar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Editable**
Indicates whether events are editable on the calendar.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InitialView**
Specifies the initial view of the calendar.
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
|`[String]`|false   |12      |false        |

#### **UrlTarget**
Specifies the target URL for calendar events.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **EventTimeFormat**
Specifies the format for displaying event times.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |14      |false        |

#### **SlotLabelFormat**
Specifies the format for displaying slot labels.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |15      |false        |

---

### Syntax
```PowerShell
New-HTMLCalendar [[-CalendarSettings] <ScriptBlock>] [[-HeaderLeft] <String[]>] [[-HeaderCenter] <String[]>] [[-HeaderRight] <String[]>] [[-DefaultDate] <DateTime>] [[-NavigationLinks] <Boolean>] [[-NowIndicator] <Boolean>] [[-EventLimit] <Boolean>] [[-WeekNumbers] <Boolean>] [[-Selectable] <Boolean>] [[-SelectMirror] <Boolean>] [-BusinessHours] [-Editable] [[-InitialView] <String>] [[-UrlTarget] <String>] [[-EventTimeFormat] <IDictionary>] [[-SlotLabelFormat] <IDictionary>] [<CommonParameters>]
```
