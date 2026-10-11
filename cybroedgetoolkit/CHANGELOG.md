## Changes

First release of the Cybro Edge Toolkit app for Home Assistant.

Ships the Cybro Edge Toolkit from 2026-10-09:

- scgi_server 3.4.0 – communicates with the controllers. Each controller now has its own allocation cache file, which removes the limit on the number of controllers.
- mqtt_client 1.0.4 – publishes controller variables to an MQTT broker. Broker settings can be taken from the Home Assistant MQTT service.
- data_logger 3.2.4 – stores controller variables in a MySQL / MariaDB database.

See the [documentation](https://github.com/killer0071234/hassio-cybroedgetoolkit/blob/main/cybroedgetoolkit/DOCS.md) for installation and configuration.

**Merged pull requests**

- Add default ports (#1)
- Fix mqtt startup fault (#2)
- Update Cybro Edge Toolkit to 2026-10-09 (#4)
- Fold toolkit update into 1.0.0 changelog (#5)