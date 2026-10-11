# Home Assistant Community App: Cybro Edge Toolkit

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

Cybro Edge Toolkit from [Cybrotech][cybrotech].

## About

The Cybro Edge Toolkit connects PLCs from Cybrotech / Robotina to other
systems. This app runs the Cybro Edge Toolkit from [Cybrotech][cybrotech]
(scgi_server v3.4.0, mqtt_client v1.0.4, data_logger v3.2.4):

- **SCGI server** – communicates with the controllers
- **MQTT client** – publishes controller variables to an MQTT broker
- **Data logger** – stores controller variables in a MySQL / MariaDB database

See [repository readme][addon-repo-install] on how to install the cybro app in Home Assistant.

[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v1.0.0-blue.svg
[release]: https://github.com/killer0071234/hassio-cybroedgetoolkit/tree/v1.0.0
[addon-repo-install]: https://github.com/killer0071234/ha-addon-repository#installation
[cybrotech]: https://cybrotech.com/