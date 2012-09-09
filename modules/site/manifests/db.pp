#Install mysql server and create a demo2 database.
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

  #Create database. This could be defined on the client as an
  #exported resource and then collected on the server, but that
  #requires a puppetmaster which we don't have when using puppet apply
  #in vagrant.
  mysql::db {'demo2':
    user     => 'demo2',
    password => 'supersecret',
    grant    => ['all'],
    sql      => '/db/demo2_load.sql',
    host     => '%',
    require  => File['/db'],
  }
}
