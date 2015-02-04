# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  # host { 'hostmachine':
  #   ip => '192.168.0.1';
  # }

  file {
    '/home/vagrant/.bash':
    ensure => directory
  }

  file {
    '/home/vagrant/.bash/git-aware-prompt':
    recurse => true,
    source => "puppet:///modules/baseconfig/git-aware-prompt"
  }

  file {
    '/home/vagrant/.bash_profile':
    owner => 'vagrant',
    group => 'vagrant',
    mode  => '0644',
    source => 'puppet:///modules/baseconfig/bash_profile';
  }

  package {[
      'git',
      'emacs',
      'tree'
    ]:
    ensure => present
  }
}
