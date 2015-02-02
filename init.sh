#!env bash

perl -e '
	%deps = (
		"puppet/modules/stdlib" => "https://github.com/puppetlabs/puppetlabs-stdlib.git",
		"puppet/modules/concat" => "https://github.com/puppetlabs/puppetlabs-concat.git",
		"puppet/modules/apache" => "https://github.com/puppetlabs/puppetlabs-apache.git",
		"puppets/modules/staging" => "https://github.com/nanliu/puppet-staging.git",
		"puppet/modules/mysql" => "https://github.com/puppetlabs/puppetlabs-mysql.git",
	);

	for my $k (keys(%deps)) {
		if(! -d $k) {
			`git clone $deps{$k} $k`
		} else {

		}
	}
'