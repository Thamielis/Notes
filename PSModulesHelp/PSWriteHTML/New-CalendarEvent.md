New-CalendarEvent
-----------------

### Synopsis
Allows adding new calendar events to calendar

---

### Description

Allows adding new calendar events to calendar

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLCalendar {
    New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
    # End date is required for the colors to work...
    New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch' -TextColor DeepSkyBlue -BackgroundColor yellow -BorderColor Red
}
```

---

### Parameters
#### **Title**
The text that will appear on an event.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Description**
The text that will appear on an event when hovering over

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **StartDate**
When your event begins. If your event is explicitly allDay, hour, minutes, seconds and milliseconds will be ignored.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |3       |false        |

#### **EndDate**
hen your event ends. If your event is explicitly allDay, hour, minutes, seconds and milliseconds will be ignored. If omitted, your events will appear to have the default duration.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |4       |false        |

#### **Constraint**
A groupId belonging to other events, "businessHours" or "availableForMeeting"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Color**
An alias for specifying the backgroundColor and borderColor at the same time.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **BackgroundColor**
Sets backround color. Only works if EndDate is provided.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **BorderColor**
Sets border color. Only works if EndDate is provided.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **TextColor**
Sets color of Text. Only works if EndDate is provided.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **Url**
A URL that will be visited when this event is clicked by the user.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |10      |false        |Uri    |

#### **AllDayEvent**
Determines if the event is shown in the “all-day” section of the view, if applicable. Determines if time text is displayed in the event. If this value is not specified, it will be inferred by the start and end properties

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TargetName**
Specifies the name of the target frame or window. Default is _self

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

---

### Notes
Keep in mind that colors like background, border, text work only if there's EndDate. If there's no end date the color "color" is used only

---

### Syntax
```PowerShell
New-CalendarEvent [[-Title] <String>] [[-Description] <String>] [[-StartDate] <DateTime>] [[-EndDate] <Nullable`1>] [[-Constraint] <String>] [[-Color] <String>] [[-BackgroundColor] <String>] [[-BorderColor] <String>] [[-TextColor] <String>] [[-Url] <String>] [-AllDayEvent] [[-TargetName] <String>] [<CommonParameters>]
```
