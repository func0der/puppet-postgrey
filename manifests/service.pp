#
# Class: postgrey::service
#
class postgrey::service {
  $ensure = $postgrey::start ? {
    true    => running,
    default => stopped
  }

  service { 'postgrey':
    ensure => $ensure,
    enable => $postgrey::enable,
  }
}

