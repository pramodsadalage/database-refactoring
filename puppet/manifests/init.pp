$home = "/home/${username}"

Exec { path => "${home}/bin:/usr/bin:/bin:/usr/sbin:/sbin" }

exec { "set timezone":
  command => "/bin/echo 'ZONE=\"America/Chicago\"' > /etc/sysconfig/clock && ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime",
  unless => "grep Chicago /etc/sysconfig/clock",
}

# --- yum update ---------------------------------------------------------

# needs new nss to update epel during yum-update
exec { 'yum-nss-update':
  command => "/usr/bin/yum -y clean all; /usr/bin/yum -y update nss",
}

exec { 'yum-update':
  command => "/usr/bin/yum update -y",
  onlyif => "/bin/bash -c '[ $(yum check-update | wc -l) -ne 0 ]'",
  timeout => 0,
  require => Exec["yum-nss-update"],
}

# --- Packages ---------------------------------------------------------------

package { [ 'openssl.x86_64', 'gcc.x86_64', 'gcc-c++.x86_64', 'openssl-devel.x86_64']:
  ensure => installed,
}

class { "oracle": }
class { 'java':
  distribution => 'jre',
}

Exec["yum-update"] -> Package <| |>

# --- SSH Config -------------------------------------------------------------------

file { "${home}/.ssh":
  ensure => directory,
}

# --- Dotfiles -------------------------------------------------------------------

file { "${home}/.bashrc":
  ensure => present,
  mode => 777,
  content => template(".bashrc.erb"),
}

# --- Disable iptables -----------------------------------------------------------

service { "iptables":
  enable => false,
  ensure => "stopped",
}
