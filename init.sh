#!/usr/bin/env perl

%deps = (
	"puppet/modules/stdlib" => "https://github.com/puppetlabs/puppetlabs-stdlib.git#4.11.0",
	"puppet/modules/concat" => "https://github.com/puppetlabs/puppetlabs-concat.git#2.1.0",
	"puppet/modules/inifile" => "https://github.com/puppetlabs/puppetlabs-inifile.git#1.5.0",
	"puppet/modules/apache" => "https://github.com/puppetlabs/puppetlabs-apache.git#1.8.1",
	"puppet/modules/staging" => "https://github.com/nanliu/puppet-staging.git#1.0.4",
	"puppet/modules/mysql" => "https://github.com/puppetlabs/puppetlabs-mysql.git#3.6.0",
	"puppet/modules/php" => "https://github.com/jippi/puppet-php.git#0.9.0",
	"puppet/modules/phpmyadmin" => "https://github.com/justicel/puppet-phpmyadmin.git#master",
	"puppet/modules/wget" => "https://github.com/maestrodev/puppet-wget.git#v1.7.3",
	"puppet/modules/nodejs" => "https://github.com/willdurand/puppet-nodejs.git#v1.9.1",
);

for my $k (keys(%deps)) {
	if(! -d $k) {
		my ($url, $version) = split('#', $deps{$k});
		`git clone -b $version --single-branch $url $k`
	} else {

	}
}

if(! -d "sites/osclass") {
	`git clone -b v3.5.3 https://github.com/osclass/Osclass.git sites/osclass`
}

1;