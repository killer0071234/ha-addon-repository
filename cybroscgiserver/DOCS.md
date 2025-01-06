# Home Assistant Community Add-on: Cybro Scgi Server

Communication gateway between Home Assistant and cybro PLCs.
Based on CybroScgiSerer v3.1.3.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "CybroScgiServer" add-on
1. Check the logs of the "CybroScgiServer" add-on to see if everything went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

### Option: `configuration_file` (required)

This option allows you to specify the a specific name for the scgi server config file.
If this file does not exist, it will be created during the first startup of that integration.
The default name of that file is `cybroscgiserver_config.ini`.

### Option: `autodetect_address` (optional)

The `autodetect_address` option is by default empty.
autodetect (broadcast) ip address in network (eg. ip 192.168.1.33 mask 255.255.255.0 -> autodetect address is 192.168.1.255).
Only nessesary if autodetect is not working.See section for manual controller configuration.

### Option: `push_enabled` (optional)

Enables or disables the builtin push server.
Receive and acknowledge push messages sent by controllers

### Option: `verbose_level` (optional)

The `verbose_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `DEBUG`: Shows detailed debug information.
- `INFO`: Normal (usually) interesting events.
- `WARNING`: Exceptional occurrences that are not errors.
- `ERROR`: Runtime errors that do not require immediate action.
- `CRITICAL`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `DEBUG` also shows `INFO` messages. By default,
the `verbose_level` is set to `ERROR`, which is the recommended setting unless
you are troubleshooting.
These log level also affects the log levels of cybro scgi server.

### Manual controller configuration (optional)

To add a manual controller, edit the `cybroscgiserver_config.ini` file in your addon config folder.

Example controller configuration entry for one controller (at the end of the file):

```ini
[c1000]
ip = 192.168.0.10
port = 8442
password =
```

**Note**: _Even if you don't use password on the controller you need the empty entry `password =`._

## Known issues and limitations

- This add-on does not support controller connections via can bus.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You could [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Daniel Gangl][killer0071234].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2017-2023 Daniel Gangl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=85493909_cybroscgiserver&repository_url=https%3A%2F%2Fgithub.com%2Fkiller0071234%2Fha-addon-repository
[killer0071234]: https://github.com/killer0071234
[issue]: https://github.com/killer0071234/ha-addon-repository/issues
[releases]: hhttps://github.com/killer0071234/ha-addon-repository/releases
[semver]: http://semver.org/spec/v2.0.0.htm
