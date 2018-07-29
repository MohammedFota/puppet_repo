class motd {
	$hostname = $facts['networking']['fqdn']
	$os_name = $facts['os']['name']
	$os_release = $facts['os']['release']	
	

	if $hostname == 'msfota1.mylabserver.com' {
		file { '/etc/motd':
			path => '/etc/motd',
			ensure => file,
			source => 'puppet:///modules/motd/motd',
			content => "\n\n[Puppet Master] ${hostname} ${os_name} ${os_release}\n\n",
		}
	}
	
	elseif $facts['networking']['domain'] == 'mylabserver.com' {
		file { '/etc/motd':
			path => '/etc/motd',
			ensure => file,
			source => 'puppet:///modules/motd/motd',
			content => "\n\n[Puppet Master] ${hostname} ${os_name} ${os_release}\n\n",
		}	
	}
}
