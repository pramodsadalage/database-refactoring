class ack {
  $ack_rpm = "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"

  exec { "ack_rpm" :
    command => "/bin/rpm -ivh ${ack_rpm}",
    path    => $path,
    unless  => "/bin/rpm -V epel-release-6-8.noarch",
  }

  package { ["ack"]:
    require => Exec["ack_rpm"],
  }
}
