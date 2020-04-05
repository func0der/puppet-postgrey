#
# Class: postgrey::install
#
class postgrey::install() {
  package { 'postgrey':
    ensure => present;
  }
}

