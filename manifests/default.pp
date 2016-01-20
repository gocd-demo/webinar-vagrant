# comment

exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}

package { 'unzip':
	require => Exec['apt-update'],
	ensure => installed,
}
