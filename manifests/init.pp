#
# Class: postgrey
#
class postgrey(
  $port                         = $postgrey::params::port,
  $host                         = $postgrey::params::host',
  $enable                       = $postgrey::params::enable,
  $start                        = $postgrey::params::start,
  $default_whitelist_clients    = $postgrey::params::default_whitelist_clients,
  $whitelist_clients            = $postgrey::params::whitelist_clients,
  $default_whitelist_recipients = $postgrey::params::default_whitelist_recipients,
  $whitelist_recipients         = $postgrey::params::whitelist_recipients,
  $delay                        = $postgrey::params::delay,
  $max_age                      = $postgrey::params::max_age,
  $auto_whitelist_clients       = $postgrey::params::auto_whitelist_clients,
  $retry_window                 = $postgrey::params::retry_window,
  $extra_options                = $postgrey::params::extra_options
) inherits postgrey::params {

  case $facts['os']['family'] {
    'RedHat': {
      $options_directory = 'sysconfig'
      $config_directory = 'postfix'
      $wlc_basename = 'postgrey_whitelist_clients'
      $wlr_basebase = 'postgrey_whitelist_recipients'
    }
    default: { # Debian
      $options_directory = 'default'
      $config_directory = 'postgrey'
      $wlc_basename = 'whitelist_clients'
      $wlr_basebase = 'whitelist_recipients.local'
    }
  }

  if $port && $host {
    $oinet = ["--inet=${host}:${port}"]
  }
  else {
    $oinet = []
  }

  if $delay {
    $odelay = ["--delay=${delay}"]
  }
  else {
    $odelay = []
  }

  if $max_age {
    $omax_age = ["--max-age=${$max_age}"]
  }
  else {
    $omax_age = []
  }

  if $auto_whitelist_clients {
    $oauto_whitelist_clients = ["--auto-whitelist-clients=${auto_whitelist_clients}"]
  }
  else {
    $oauto_whitelist_clients = []
  }

  if $retry_window {
    $oretry_window = ["--auto-whitelist-clients=${retry_window}"]
  }
  else {
    $oretry_window = []
  }

  $options = concat($oinet, $odelay, $omax_age, $oauto_whitelist_clients, $oretry_window).join(" ")

  if $extra_options != "" {
    if $options != "" {
      $final_options = "${options} ${extra_options}"
    }
    else {
      $final_options = $options
    }
  }
  else {
    $final_options = $options
  }

  class{'postgrey::install': } ->
  class{'postgrey::config': } ~>
  class{'postgrey::service': } ->
  Class["postgrey"]
}
