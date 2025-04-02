# PoShLog.Sinks.Splunk

[![psgallery](https://img.shields.io/powershellgallery/v/PoShLog.Sinks.Splunk.svg)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Splunk)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/p/poshlog.sinks.Splunk?color=blue)](https://www.powershellgallery.com/packages/poshlog.sinks.Splunk)
[![psgallery](https://img.shields.io/powershellgallery/dt/PoShLog.Sinks.Splunk.svg)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Splunk)

**PoShLog.Sinks.Splunk** is extension module for the [PoShLog](https://github.com/PoShLog/PoShLog) logging module.
It contains a sink that publishes log messages to a
[Splunk HTTP Event Collector](https://docs.splunk.com/Documentation/Splunk/9.1.3/Data/UsetheHTTPEventCollector).

Core functionality is provided by the [Serilog.Sinks.Splunk](https://github.com/serilog-contrib/serilog-sinks-splunk) package.

## Getting started

If you are familiar with PowerShell, skip to [Installation](#installation) section. For more detailed installation instructions check out [Getting started](https://github.com/PoShLog/PoShLog/wiki/Getting-started) wiki.

### Installation

To install PoShLog.Sinks.Splunk, run following snippet from PowerShell

```ps1
Install-Module -Name PoShLog.Sinks.Splunk
```

## Usage

```ps1
Import-Module PoShLog
Import-Module PoShLog.Sinks.Splunk

New-Logger |
  Add-SinkSplunk -Uri 'https://your-splunkhost:8088' -Token '00000000-0000-0000-0000-000000000000' |
  Start-Logger

Write-InfoLog 'Hurray, my first log message in Splunk!'

# Don't forget to close the logger
Close-Logger
```

### Documentation

These examples are just to get you started fast. For more detailed documentation please check [wiki](https://github.com/PoShLog/PoShLog/wiki).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Authors

[Mike Powell](https://github.com/mikepowell)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

* Icon made by [Smashicons](https://smashicons.com/) from [www.flaticon.com](https://www.flaticon.com/).
