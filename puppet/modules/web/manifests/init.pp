class web {
    #
    # APACHE2
    #
    class {'apache':
        mpm_module => "prefork"
    }

    include apache::mod::php

    #
    # MYSQL
    #
    class { '::mysql::server':
    }

    file { "/tmp/init.sql":
      ensure => present,
      source => "puppet:///modules/web/init.sql",
    }

    mysql::db { 'osclass':
      user     => 'hello',
      password => 'hello',
      host     => 'localhost',
      sql        => '/tmp/init.sql',
      require => File['/tmp/init.sql'],
    }

    # mysql_user { 'hello@localhost':
    #   ensure                   => 'present',
    #   max_connections_per_hour => '60',
    #   max_queries_per_hour     => '120',
    #   max_updates_per_hour     => '120',
    #   max_user_connections     => '10',
    # }

    # mysql_grant { 'hello@localhost/osclass.*':
    #   ensure     => 'present',
    #   options    => ['GRANT'],
    #   privileges => ['ALL'],
    #   table      => 'osclass.*',
    #   user       => 'hello@localhost',
    # }

    #
    # PHP
    #
    package {[
        'php5',
            'php5-cli',
            'libapache2-mod-php5',
            'php-apc',
            'php5-curl',
            'php5-dev',
            'php5-gd',
            'php5-fpm',
            'php5-imagick',
            'php5-mcrypt',
            'php5-memcache',
            'php5-mysql',
            'php5-pspell',
            'php5-sqlite',
            'php5-tidy',
            'php5-xdebug',
            'php5-xmlrpc',
            'php5-xsl',
            'phpmyadmin'
      ]:
      ensure => present;
    }

    #
    # SETUP OSCLASS & VHOST
    #
    file {'/var/www/osclass':
      ensure => 'link',
      target => '/vagrant/sites/osclass',
    }

    apache::vhost {'osclass.dev':
      port    => '80',
      docroot => '/var/www/osclass',
    }
}