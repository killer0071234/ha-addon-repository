# Home Assistant Community App: Cybro Scgi Server

Communication gateway between Home Assistant and cybro PLCs.
Based on CybroScgiServer v3.3.1.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "CybroScgiServer" app
1. Check the logs of the "CybroScgiServer" app to see if everything went well.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

### Option: `autodetect_address` (optional)

The `autodetect_address` option is by default empty.
autodetect (broadcast) ip address in network (eg. ip 192.168.1.33 mask 255.255.255.0 -> autodetect address is 192.168.1.255).
Only nessesary if autodetect is not working.See section for manual controller configuration.

### Option: `push_enabled` (optional)

Enables or disables the builtin push server.
Receive and acknowledge push messages sent by controllers

### Option: `verbose_level` (optional)

The `verbose_level` option controls the level of log output by the app and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `DEBUG`: Shows detailed debug information.
- `INFO`: Normal (usually) interesting events.
- `WARNING`: Exceptional occurrences that are not errors.
- `ERROR`: Runtime errors that do not require immediate action.
- `CRITICAL`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `DEBUG` also shows `INFO` messages. By default,
the `verbose_level` is set to `ERROR`, which is the recommended setting unless
you are troubleshooting.
These log level also affects the log levels of cybro scgi server.

### Option: `controllers` (optional)

Controllers that are not found by autodetect can be added manually.
Each entry has these fields:

- `nad` (required): serial number of the controller, e.g. `1000` for controller `c1000`.
- `ip` (required): IP address of the controller.
- `port` (optional): UDP port of the controller, by default `8442`.
- `password` (optional): numeric password of the controller. Omit this field if the controller has no password.

Example configuration for one controller:

```yaml
controllers:
  - nad: 1000
    ip: 192.168.0.10
```

### Option: `configuration_file` (optional)

Older versions of this app used a config file (by default
`/config/cybroscgiserver_config.ini`) for manual controllers. If the `controllers`
option is empty and this file is found on start, its controllers are imported into
the `controllers` option and the file is renamed to `<file>.migrated`. Other settings in that file are
not used anymore.

**Note**: _This option is deprecated and will be removed in a future release._

## Troubleshooting

### Check the log

Open the **Log** tab of the app. After a normal start you should see the
server listening on UDP port 8442 and TCP port 4000.

For more details, set `verbose_level` to `DEBUG`, restart the app and check
the log again. Set it back to `ERROR` when you are done, `DEBUG` creates a lot
of output.

### Check that the server answers

Open this address in a browser (replace the IP with the one of your Home
Assistant):

```text
http://192.168.0.2:4000/?sys.server_version
```

The server replies with a short XML document that contains its version. If
the page does not load, the app is not running or port 4000 is blocked.

To check a controller, replace `c1000` with your controller's
serial number:

```text
http://192.168.0.2:4000/?c1000.sys.plc_status
```

The value is `ok` when the controller is reachable and running. `offline`
means the server can't reach the controller, see [Ports](#ports) and
[No controllers found](#no-controllers-found).

### Ports

The app uses the host network and needs these ports:

- `4000/tcp`: requests from the Home Assistant integration.
- `8442/udp`: communication with the controllers (including push messages).

The controllers must be able to reach your Home Assistant on UDP port 8442. If
they are in another network or behind a firewall, allow this port.

### No controllers found

Autodetect uses a broadcast in your local network. If no controller is found:

1. Set `autodetect_address` to the broadcast address of the network where the
   controllers are (e.g. `192.168.1.255`).
1. If that doesn't help, add the controller manually, see
   [`controllers` option](#option-controllers-optional).

## Known issues and limitations

- This app does not support controller connections via can bus.

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
[releases]: https://github.com/killer0071234/ha-addon-repository/releases
[semver]: http://semver.org/spec/v2.0.0.html
