#
# == Class: postgrey::params
#
class postgrey::params {

  case $facts['os']['family'] {
    'RedHat': {
      $options_directory = '/etc/sysconfig'
      $config_directory = '/etc/postfix'
      $port = undef
      $host = undef
      $enable = true
      $start = true
      $default_whitelist_clients = false
      $whitelist_clients = []
      $default_whitelist_recipients = true
      $whitelist_recipients = []
      $delay = 60
      $max_age = undef
      $auto_whitelist_clients = undef
      $retry_window = undef
      $extra_options = ''
    }
    default: { # Debian
      $port = 10023
      $host = '127.0.0.1'
      $enable = true
      $start = true
      $default_whitelist_clients = false
      $whitelist_clients = []
      $default_whitelist_recipients = false
      $whitelist_recipients = []
      $delay = 300
      $max_age = 35
      $auto_whitelist_clients = 5
      $retry_window = 2
      $extra_options = ''
    }
  }
}
