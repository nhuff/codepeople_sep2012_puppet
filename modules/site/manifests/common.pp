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

  Class['apt'] -> Package<| |>
}
