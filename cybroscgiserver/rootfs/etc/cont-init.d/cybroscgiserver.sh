#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: CybroScgiServer
# Pre-run checks for CybroScgiServer
# ==============================================================================
# Creates initial CybroScgiServer configuration in case it is non-existing
declare configuration_file

configuration_file=$(bashio::config 'configuration_file')
if ! bashio::fs.file_exists "${configuration_file}"; then
    exec cp "$(bashio::config 'configuration_file')" /usr/local/bin/scgi_server/
    bashio::log.fatal
    bashio::log.fatal "Seems like the configured configuration file does"
    bashio::log.fatal "not exists:"
    bashio::log.fatal
    bashio::log.fatal "${configuration_file}"
    bashio::log.fatal
    bashio::log.fatal "A default configuration file is created!"
    bashio::log.fatal "Please add your controller at the end."
    bashio::log.fatal
    bashio::exit.nok
fi