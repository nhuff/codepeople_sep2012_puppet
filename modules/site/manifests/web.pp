#Install apache and mod_php.
#Create an apache vhost that runs our app
class site::web {
  class{'apache':}
  
  apache::vhost{'demo2.vagrant':
    port               => '80',
    docroot            => '/web',
    docroot_owner      => 'vagrant',
    docroot_group      => 'vagrant',
    configure_firewall => false, #Don't want to include firewall module for demo
  }

  include php::apache2
  php::module{'mysql':
    source => 'puppet:///modules/site/'
  }

  #Setup variables for template.  I would normally use something
  #like hiera here, but keeping it simple for demo.
  $database_server   = 'db2.vagrant'
  $database_name     = 'demo2'
  $database_user     = 'demo2'
  $database_password = 'supersecret'
  file{'/tmp/webapp-config.php':
    ensure  => 'file',
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0644',
    content => template('site/webapp-config.erb'),
  }
}
