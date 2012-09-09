#Class included on both hosts
#Sets up /etc/hosts file so names can be used.
#Updates apt cache
class site::common {
  host {'database':
    name => 'db2.vagrant',
    ip   => '172.19.2.20',
  }

  host {'web':
    name => 'demo2.vagrant',
    ip   => '172.19.2.10',
  }

  class{'apt': 
    always_apt_update => true,
  }

  #Run apt class manifest before any package resources
  Class['apt'] -> Package<| |>
}
