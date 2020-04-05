#
# Class: postgrey::config
#
class postgrey::config () {
  file {
    "/etc/${postgrey::options_directory}/postgrey":
      content => template('postgrey/default.erb');
  }

  concat {
    "/etc/${postgrey::config_directory}/${postgrey::wlc_basename}.local":
  }

  concat::fragment { 'postgrey/whitelist_clients.local/header':
    target => "/etc/${postgrey::config_directory}/${postgrey::wlc_basename}.local",
    order  => 0,
    source => 'puppet:///modules/postgrey/whitelist_clients.header';
  }

  # RedHat will always get package default unless specifying alternate whitelist files so should be false for RedHat
  if ($postgrey::default_whitelist_clients == true) {
    concat::fragment { 'postgrey/whitelist_clients.local/default':
      target => "/etc/${postgrey::config_directory}/${postgrey::wlc_basename}.local",
      order  => 10,
      source => 'puppet:///modules/postgrey/whitelist_clients.default';
    }
  }

  if ($postgrey::whitelist_clients != []) {
    concat::fragment { 'postgrey/whitelist_clients.local':
      target  => "/etc/${postgrey::config_directory}/${postgrey::wlc_basename}.local",
      order   => 15,
      content => inline_template('<%= scope.lookupvar("postgrey::whitelist_clients").join("\n") %><%= "\n" %>'),
    }
  }

  concat {
    "/etc/${postgrey::config_directory}/${postgrey::wlr_basename}":
  }

  concat::fragment { 'postgrey/whitelist_recipients.local/header':
    target => "/etc/${postgrey::config_directory}/${postgrey::wlr_basename}",
    order  => 0,
    source => 'puppet:///modules/postgrey/whitelist_recipients.header';
  }

  if ($postgrey::default_whitelist_recipients == true) {
    concat::fragment { 'postgrey/whitelist_recipients.local/default':
      target => "/etc/${postgrey::config_directory}/${postgrey::wlr_basename}",
      order  => 10,
      source => 'puppet:///modules/postgrey/whitelist_recipients.default';
    }
  }

  if ($postgrey::whitelist_recipients != []) {
    concat::fragment { 'postgrey/whitelist_recipients.local':
      target  => "/etc/${postgrey::config_directory}/${postgrey::wlr_basename}",
      order   => 15,
      content => inline_template('<%= scope.lookupvar("postgrey::whitelist_recipients").join("\n") %><%= "\n" %>'),
    }
  }
}
