# Cybro Edge Toolkit

This app runs the [Cybro Edge Toolkit][cet] by Cybrotech inside Home
Assistant. The toolkit connects Cybro PLCs to other systems:

- **SCGI server** – talks to the controllers over the network (A-bus over UDP)
  and serves controller variables to clients on TCP port 4000.
- **MQTT client** – publishes controller variables to an MQTT broker and writes
  incoming MQTT messages to controller variables.
- **Data logger** – samples variables, events and alarms into a MySQL/MariaDB
  database.

The web SCADA part of the toolkit is included in the image but not started.

## Installation

1. Add the repository `https://github.com/killer0071234/ha-addon-repository`
   to Home Assistant (**Settings → Apps → App store → ⋮ → Repositories**), see
   the [repository readme][addon-repo-install].
2. Install the **Cybro Edge Toolkit** app.
3. If you want to use the MQTT client, install and start the **Mosquitto
   broker** app first.
4. Start the app. On first start it creates default configuration files.
5. Edit the configuration files (see below) and restart the app.

## Configuration files

The toolkit is configured with its own files, as described in the Cybro Edge
Toolkit manual. They are stored in the app's configuration folder, which you
can reach with the File editor, Studio Code Server or Samba apps at:

```text
/addon_configs/<id>_cybroedgetoolkit/config.ini
/addon_configs/<id>_cybroedgetoolkit/data_logger.xml
```

- `config.ini` – settings for all three services (controllers, aliases,
  MQTT publish/subscribe topics, database connection, logging).
- `data_logger.xml` – variables that the data logger stores.

The services watch these files and restart themselves when they change, so
restarting the app is usually not required.

Logs are shown in the app's **Log** tab. To get output, set `enabled = true` in
the `[DEBUGLOG]` section of `config.ini`. Log files (`log_to_file = true`) and
the controller allocation cache are kept in the app's private data folder.

## App options

### Option: `scgi_server`

Run the SCGI server. Leave this enabled unless the MQTT client and data logger
use an SCGI server on another machine (`[SCGI] server_address`).

### Option: `mqtt_client`

Run the MQTT client. Configure the `[PUBLISH]` and `[SUBSCRIBE]` sections in
`config.ini`. The default file contains examples for a controller `c20000`;
replace them with your own variables.

Use `message_format = 1` for JSON payloads that work well with Home Assistant
MQTT sensors.

### Option: `mqtt_auto_config`

When enabled, the app writes the address, port, username and password of the
Home Assistant MQTT broker into the `[MQTT]` section of `config.ini` on every
start. Disable this to use another broker; the values in `config.ini` are then
used as they are.

### Option: `data_logger`

Run the data logger. It needs a MySQL or MariaDB database, for example the
**MariaDB** app. Set the connection in the `[DBASE]` section of `config.ini`.
Because this app uses the host network, connect to the database with
`host = 127.0.0.1` (the MariaDB app publishes port 3306 on the host).

## Network

The app uses the host network so that the SCGI server can:

- autodetect controllers in the local network by UDP broadcast,
- receive push messages and Cybro sockets from controllers. For Cybro sockets
  set `port = 8442` in the `[ETH]` section; by default a dynamic port is used.

The SCGI server listens on TCP port 4000 on the host. It is reachable from your
whole network unless you set `[SCGI] bind_address = 127.0.0.1` in
`config.ini`.

[cet]: https://cybrotech.com
[addon-repo-install]: https://github.com/killer0071234/ha-addon-repository#installation
