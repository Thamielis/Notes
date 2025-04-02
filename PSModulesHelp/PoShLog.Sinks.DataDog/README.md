# PoShLog.Sinks.Datadog


PoShLog.Sinks.Datadog is extension module for [PoShLog](https://github.com/PoShLog/PoShLog) logging module. Contains sink that publishes log messages to DataDog.

## Getting started

If you are familiar with PowerShell, skip to [Installation](#installation) section. For more detailed installation instructions check out [Getting started](https://github.com/PoShLog/PoShLog/wiki/Getting-started) wiki.

### Installation

To install PoShLog.Sinks.Datadog, run following snippet from Powershell

```ps1
Install-Module -Name PoShLog.Sinks.Datadog
```

## Usage

```ps1
Import-Module PoShLog
Import-Module PoShLog.Sinks.Datadog

$conf = New-SinkDataDogConfiguration -Url "https://http-intake.logs.us3.datadoghq.com"

New-Logger |
Add-SinkPowerShell -RestrictedToMinimumLevel Information |
Add-SinkDataDog -ApiKey 123ABC -Environment local -Configuration $conf -Service MyServiceName -Source PoShLog -RestrictedToMinimumLevel Debug |
Start-Logger

# Don't forget to close the logger
Close-Logger
```

### Documentation

These examples are just to get you started fast. For more detailed documentation please check [wiki](https://github.com/PoShLog/PoShLog/wiki).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Authors

Chris Hunt

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

* Icon made by [Smashicons](https://smashicons.com/) from [www.flaticon.com](https://www.flaticon.com/).
