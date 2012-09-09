class site::db {
  file {'/db':
    ensure => 'directory',
  }

  class{'mysql::server':
    config_hash => { 
      'root_password' => 'password',
      'bind_address'  => '0.0.0.0'
    },
  }

  mysql::db {'demo2':
    user     => 'demo2',
    password => 'supersecret',
    grant    => ['all'],
    sql      => '/db/demo2_load.sql',
    host     => '%',
    require  => File['/db'],
  }
}
