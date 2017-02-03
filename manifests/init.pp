class postgrey(
  $port = 10023,
  $host = '127.0.0.1',
  $enable = true,
  $start = true,
  $default_whitelist_clients = false,
  $whitelist_clients = [],
  $default_whitelist_recipients = false,
  $whitelist_recipients = [],
  $delay = 300,
  $max_age = 35,
  $auto_whitelist_clients = 5,
  $retry_window = 2,
  $extra_options = ''
) {
  class{'postgrey::install': } ->
  class{'postgrey::config': } ~>
  class{'postgrey::service': } ->
  Class["postgrey"]
}

