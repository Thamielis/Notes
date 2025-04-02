# PoShLog.Sinks.Exceptionless

[![psgallery](https://img.shields.io/powershellgallery/v/poshlog.sinks.seq.svg)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Seq) [![PowerShell Gallery](https://img.shields.io/powershellgallery/p/poshlog.sinks.seq?color=blue)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Seq) [![psgallery](https://img.shields.io/powershellgallery/dt/PoShLog.Sinks.Seq.svg)](https://www.powershellgallery.com/packages/PoShLog.Sinks.Exceptionless) [![Discord](https://img.shields.io/discord/693754316305072199?color=orange&label=discord)](https://discord.gg/gGFtbf)

PoShLog.Sinks.Seq is extension module for [PoShLog](https://github.com/PoShLog/PoShLog) logging module. Contains sink that publishes log messages to [Seq](https://datalust.co/seq).

## Getting started

If you are familiar with PowerShell, skip to [Installation](#installation) section. For more detailed installation instructions check out [Getting started](https://github.com/PoShLog/PoShLog/wiki/Getting-started) wiki.

### Installation

To install PoShLog.Sinks.Exceptionless, run following snippet from powershell:

```ps1
Install-Module -Name PoShLog.Sinks.Seq
```

## Usage

```ps1
Import-Module PoShLog
Import-Module PoShLog.Sinks.Seq

New-Logger |
    Add-SinkSeq -ServerUrl 'http://localhost:5341' |
    Start-Logger

Write-InfoLog 'Hurrray, my first log message in seq!'

# Don't forget to close the logger
Close-Logger
```

### Documentation

These examples are just to get you started fast. For more detailed documentation please check [wiki](https://github.com/PoShLog/PoShLog/wiki).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Authors

* [**Tomáš Bouda**](http://tomasbouda.cz/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

* Icon made by [Smashicons](https://smashicons.com/) from [www.flaticon.com](https://www.flaticon.com/).
