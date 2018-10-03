
class apache {


	case $::osfamily{
	
	"RedHat":{
		$apache2 = ["httpd"]
		service {'firewalld':
			ensure => stopped,
			enable => false
		}

	}

	"Debian":{
		$apache2 = ["apache2"]
		exec{"atualiza_repoapache":
		command => "/usr/bin/apt update"
		}
		
		} 

	}

	package{$apache2:
		ensure => present
		}
	
	service{$apache2:
		ensure => running
		}

	file {"/var/www/html/index.html":
                source => "puppet:///modules/apache/index.html",
                ensure => present
                }
	
}
