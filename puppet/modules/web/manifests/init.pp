
class web {

	package {'apache2':
		ensure => present
		}
	service {'apache2':
		ensure => start,
		enable => true
		}

}
