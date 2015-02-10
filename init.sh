#!/usr/bin/env perl

%deps = (
	"puppet/modules/stdlib" => "https://github.com/puppetlabs/puppetlabs-stdlib.git",
	"puppet/modules/concat" => "https://github.com/puppetlabs/puppetlabs-concat.git",
	"puppet/modules/inifile" => "https://github.com/puppetlabs/puppetlabs-inifile.git",
	"puppet/modules/apache" => "https://github.com/puppetlabs/puppetlabs-apache.git",
	"puppet/modules/staging" => "https://github.com/nanliu/puppet-staging.git",
	"puppet/modules/mysql" => "https://github.com/puppetlabs/puppetlabs-mysql.git",
	"puppet/modules/php" => "https://github.com/jippi/puppet-php.git",
	"puppet/modules/phpmyadmin" => "https://github.com/justicel/puppet-phpmyadmin.git",
	"puppet/modules/wget" => "https://github.com/maestrodev/puppet-wget.git",
	"puppet/modules/nodejs" => "https://github.com/willdurand/puppet-nodejs.git",
	"puppet/modules/baseconfig/files/git-aware-prompt" => "https://github.com/adrienrn/git-aware-prompt.git"
);

for my $k (keys(%deps)) {
	if(! -d $k) {
		`git clone $deps{$k} $k`
	} else {

	}
}

if(! -d "sites/osclass") {
	`git clone -b v3.5.3 https://github.com/osclass/Osclass.git sites/osclass`
}

1;