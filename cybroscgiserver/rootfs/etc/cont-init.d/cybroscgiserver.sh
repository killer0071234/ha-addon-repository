#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: CybroScgiServer
# Pre-run checks for CybroScgiServer
# ==============================================================================
declare configuration_file
declare ha_config_file
declare autodetect_address
declare request_period_s
declare valid_period_s
declare cleanup_period_s
declare verbose_level

configuration_file=$(bashio::config 'configuration_file')
# copy config from legacy config folder to addon config folder
ha_config_file="${configuration_file/"/config"/"/homeassistant"}"
if bashio::fs.file_exists "${ha_config_file}"; then
    bashio::log.warning "Found addon config in:"
    bashio::log.warning "${ha_config_file}"
    bashio::log.warning
    bashio::log.warning "move config into addon config folder:"
    bashio::log.warning "${configuration_file}"
    mv "${ha_config_file}" "${configuration_file}"
fi
# Creates initial CybroScgiServer configuration in case it is non-existing
if ! bashio::fs.file_exists "${configuration_file}"; then
    cp /usr/local/bin/scgi_server/config.ini "$(bashio::config 'configuration_file')" 
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
else
    bashio::log.info "Using existing configuration file: ${configuration_file}"
    cp "$(bashio::config 'configuration_file')" /usr/local/bin/scgi_server/config.ini

    if bashio::config.has_value "autodetect_address"; then autodetect_address=$(bashio::config 'autodetect_address'); else autodetect_address=""; fi
    if [ "$autodetect_address" != "" ]; then
        bashio::log.info "configured autodetect address: ${autodetect_address}"
        sed -i "s/^autodetect_enabled.*/autodetect_enabled = true/" /usr/local/bin/scgi_server/config.ini
        sed -i "s/^autodetect_address.*/autodetect_address = $autodetect_address/" /usr/local/bin/scgi_server/config.ini
    else
        bashio::log.warning "Found no autodetect address in config.ini!"
        bashio::log.warning "Controller autodetect is not available!"
        bashio::log.warning "To use autodetect you need to setup controllers"
        bashio::log.warning "manually in config.ini file!"
        sed -i "s/^autodetect_enabled.*/autodetect_enabled = false/" /usr/local/bin/scgi_server/config.ini
    fi

    if bashio::config.has_value "request_period_s"; then request_period_s=$(bashio::config 'request_period_s'); else request_period_s="0"; fi
    bashio::log.info "configured request_period_s: ${request_period_s}"
    sed -i "s/^request_period_s.*/request_period_s = $request_period_s/" /usr/local/bin/scgi_server/config.ini
    if bashio::config.has_value "valid_period_s"; then valid_period_s=$(bashio::config 'valid_period_s'); else valid_period_s="0"; fi
    bashio::log.info "configured valid_period_s: ${valid_period_s}"
    sed -i "s/^valid_period_s.*/valid_period_s = $valid_period_s/" /usr/local/bin/scgi_server/config.ini
    if bashio::config.has_value "cleanup_period_s"; then cleanup_period_s=$(bashio::config 'cleanup_period_s'); else cleanup_period_s="0"; fi
    bashio::log.info "configured cleanup_period_s: ${cleanup_period_s}"
    sed -i "s/^cleanup_period_s.*/cleanup_period_s = $cleanup_period_s/" /usr/local/bin/scgi_server/config.ini
    if bashio::config.has_value "verbose_level"; then verbose_level=$(bashio::config 'verbose_level'); else verbose_level="ERROR"; fi
    bashio::log.info "configured verbose_level: ${verbose_level}"
    sed -i "s/^verbose_level.*/verbose_level = $verbose_level/" /usr/local/bin/scgi_server/config.ini

    cp /usr/local/bin/scgi_server/config.ini "$(bashio::config 'configuration_file')"
    bashio::exit.ok
fi
