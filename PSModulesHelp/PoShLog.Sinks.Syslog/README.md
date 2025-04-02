# PoShLog.Sinks.Syslog

[![psgallery](https://img.shields.io/powershellgallery/v/poshlog.sinks.syslog.svg)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Syslog) [![PowerShell Gallery](https://img.shields.io/powershellgallery/p/poshlog.sinks.eventLog?color=blue)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Syslog) [![psgallery](https://img.shields.io/powershellgallery/dt/PoShLog.Sinks.Syslog.svg)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Syslog) [![Discord](https://img.shields.io/discord/693754316305072199?color=orange&label=discord)](https://discord.gg/FVdVxuw)

PoShLog.Sinks.Syslog is an extension module for [PoShLog](https://github.com/PoShLog/PoShLog) logging module. It contains a sink that publishes log messages to syslog servers.

## Getting started

If you are familiar with PowerShell, skip to [Installation](#installation) section. For more detailed installation instructions check out [Getting started](https://github.com/PoShLog/PoShLog/wiki/Getting-started) wiki.

### Installation

To install PoShLog.Sinks.Syslog, run following snippet from powershell:

```ps1
Install-Module PoShLog.Sinks.Syslog
```

## Usage

This starts UPD syslog logger. You can change the RFC format, port number or other things trough the optional parameters:

```ps1
Import-Module PoShLog
Import-Module PoShLog.Sinks.Syslog

New-Logger |
	Add-SinkSyslogUdp -Hostname '192.168.0.48' |
	Start-Logger

Write-InformationLog 'My message in UDP syslog'

Close-Logger
```
The TCP syslog logger is automatically configured to use TLS 1.2. If you want no TLS or another protocol you got to change it:

```ps1
Import-Module PoShLog
Import-Module PoShLog.Sinks.Syslog

New-Logger |
	Add-SinkSyslogTcp -Hostname '192.168.0.48' -SecureProtocols None |
	Start-Logger

Write-InformationLog 'My message in insecure TCP syslog'

Close-Logger
```

The Local syslog logger writes messages to the local syslog service. **This is only available on Linux systems.**

```ps1
Import-Module PoShLog
Import-Module PoShLog.Sinks.Syslog

New-Logger |
	Add-SinkSyslogLocal |
	Start-Logger

Write-InformationLog 'My message in local syslog'

Close-Logger
```

### Documentation

These examples are just to get you started fast. For more detailed documentation please check [wiki](https://github.com/PoShLog/PoShLog/wiki).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Authors

* [**Michael Zimmerli**](https://github.com/gitbute)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

* Thanks to [**Tomáš Bouda**](http://tomasbouda.cz/) for making PoShLog.
* Icon made by [Smashicons](https://smashicons.com/) from [www.flaticon.com](https://www.flaticon.com/).
