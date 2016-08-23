class oracle {
  $oracle_rpm = "oracle-xe-11.2.0-1.0.x86_64.rpm"
  $oracle_rpm_path = "puppet:///modules/oracle/${oracle_rpm}"

  $oracle_instant_client_rpm = "oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm"
  $oracle_instant_client_sdk_rpm = "oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm"
  $oracle_instant_client_rpm_path = "puppet:///modules/oracle/${oracle_instant_client_rpm}"
  $oracle_instant_client_sdk_rpm_path = "puppet:///modules/oracle/${oracle_instant_client_sdk_rpm}"

  file { "${home}/${oracle_rpm}":
    ensure => present,
    source => $oracle_rpm_path,
  }

  file { "${home}/${oracle_instant_client_rpm}":
    ensure => present,
    source => $oracle_instant_client_rpm_path,
  }

  file { "${home}/${oracle_instant_client_sdk_rpm}":
    ensure => present,
    source => $oracle_instant_client_sdk_rpm_path,
  }

  exec {
    "create swapfile":
      # Needs to be 2 times the memory (mem is capped at 1024)
      command => "/bin/dd if=/dev/zero of=/swapfile bs=1M count=2048",
      user => root,
      creates => "/swapfile";
    "set up swapfile":
      command => "/sbin/mkswap /swapfile",
      require => Exec["create swapfile"],
      user => root,
      unless => "/usr/bin/file /swapfile | grep 'swap file' 2>/dev/null";
    "enable swapfile":
      command => "/sbin/swapon /swapfile",
      require => Exec["set up swapfile"],
      user => root,
      unless => "/bin/cat /proc/swaps | grep '^/swapfile' 2>/dev/null";
    "add swapfile entry to fstab":
      command => "/bin/echo >>/etc/fstab /swapfile swap swap defaults 0 0",
      user => root,
      unless => "/bin/grep '^/swapfile' /etc/fstab 2>/dev/null";
  }

  file {
    "/swapfile":
      mode => 600,
      owner => root,
      group => root,
      require => Exec['create swapfile'];
  }

  exec { "oracle_rpm":
    command => "/bin/rpm -ivh ${home}/${oracle_rpm}",
    path => $path,
    unless => "/bin/rpm -q oracle-xe-11.2.0-1.0.x86_64",
    require => File["${home}/${oracle_rpm}", "/swapfile"],
  }

  exec { "oracle_instant_client":
    command => "/bin/rpm -ivh ${home}/${oracle_instant_client_rpm}",
    path => $path,
    unless => "/bin/rpm -q oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64",
    require => File["${home}/${oracle_instant_client_rpm}"],
  }

  exec { "oracle_instant_client_sdk":
    command => "/bin/rpm -ivh ${home}/${oracle_instant_client_sdk_rpm}",
    path => $path,
    unless => "/bin/rpm -q oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64",
    require => File["${home}/${oracle_instant_client_sdk_rpm}"],
  }

  package { ["oracle-xe-11.2.0-1.0.x86_64"]:
    require => [Exec["oracle_rpm"], Exec["oracle_instant_client"], Exec["oracle_instant_client_sdk"]],
  }
  
  Exec["oracle_rpm"]-> Exec["oracle_instant_client"]-> Exec["oracle_instant_client_sdk"]
}


