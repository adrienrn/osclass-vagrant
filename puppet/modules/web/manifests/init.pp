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
    class { '::mysql::server': }

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

    #
    # PHP
    #
    package {[
            'php5',
            'php5-cli',
            'php5-dev',
            'libapache2-mod-php5',
            'php-apc',
            'php5-curl',
            'php5-gd',
            'php5-fpm',
            'php5-imagick',
            'php5-intl',
            'php5-mcrypt',
            'php5-memcache',
            'php5-mysql',
            'php5-pspell',
            'php5-sqlite',
            'php5-tidy',
            'php5-xdebug',
            'php5-xmlrpc',
            'php5-xsl'
      ]:
      ensure => present;
    }

    exec { 'enabling_mcrypt':
        command  => "/usr/sbin/php5enmod mcrypt",
        notify  => Service["apache2"],
        require => Package["php5-mcrypt"],
    }

    #
    # COMPOSER
    #
    class { 'php::composer': }

    #
    # BOWER
    #
    class { 'nodejs':
      version => 'stable',
    }

    package { 'bower':
      ensure => present,
      provider => 'npm',
      require => Class["nodejs"]
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
      php_values => {
        error_log => '/vagrant/php.error.log'
      }
    }

    file { "/var/www/osclass/config.php":
      ensure => present,
      source => "puppet:///modules/web/config.php",
    }

    #
    # PHPMYADMIN
    #
    class { 'phpmyadmin': }
    phpmyadmin::server{ 'default': }

    phpmyadmin::vhost { 'phpmyadmin.osclass.dev':
        vhost_enabled => true,
        priority      => '30',
        docroot       => $phpmyadmin::params::doc_path,
    }

}