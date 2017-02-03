class postgrey::config() {
  file {
    '/etc/default/postgrey':
      content => template('postgrey/default.erb');
  }

  concat {
    '/etc/postgrey/whitelist_clients.local':
  }

  concat::fragment { 'postgrey/whitelist_clients.local/header':
     target => '/etc/postgrey/whitelist_clients.local',
     order  => 00,
     source => 'puppet:///modules/postgrey/whitelist_clients.header';
  }

  if ($postgrey::default_whitelist_clients == true) {
    concat::fragment { 'postgrey/whitelist_clients.local/default':
      target => '/etc/postgrey/whitelist_clients.local',
      order  => 10,
      source => 'puppet:///modules/postgrey/whitelist_clients.default';
    }
  }

  if ($postgrey::whitelist_clients != []) {
    concat::fragment { 'postgrey/whitelist_clients.local':
      target  => '/etc/postgrey/whitelist_clients.local',
      order   => 15,
      content => inline_template('<%= scope.lookupvar("postgrey::whitelist_clients").join("\n") %><%= "\n" %>')
    }
  }

  concat {
    '/etc/postgrey/whitelist_recipients.local':
  }

  concat::fragment { 'postgrey/whitelist_recipients.local/header':
     target => '/etc/postgrey/whitelist_recipients.local',
     order  => 00,
     source => 'puppet:///modules/postgrey/whitelist_recipients.header';
  }

  if ($postgrey::default_whitelist_recipients == true) {
    concat::fragment { 'postgrey/whitelist_recipients.local/default':
      target => '/etc/postgrey/whitelist_recipients.local',
      order  => 10,
      source => 'puppet:///modules/postgrey/whitelist_recipients.default';
    }
  }

  if ($postgrey::whitelist_recipients != []) {
    concat::fragment { 'postgrey/whitelist_recipients.local':
      target  => '/etc/postgrey/whitelist_recipients.local',
      order   => 15,
      content => inline_template('<%= scope.lookupvar("postgrey::whitelist_recipients").join("\n") %>')
    }
  }
}

