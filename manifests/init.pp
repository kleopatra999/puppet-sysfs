class sysfs {
  package { 'sysfsutils':
    ensure => installed,
  }

  service { 'sysfsutils':
    hasstatus  => false,
    hasrestart => true,
    subscribe  => Concat['/etc/sysfs.conf'],
  }

  concat { '/etc/sysfs.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['sysfsutils'],
  }
}
