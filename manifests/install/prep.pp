class msexchange::install::prep(
  $user,
  $domain,
  $password,
  $upgrade,
  $org_name,
  $source_dir
){

    if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
    }
    
    #TODO: Set-service NetTcpPortSharing -startuptype automatic
    #TODO: Make sure IPv6 is enabled
    
    #TODO: fix this only-if
    exec { "prepare AD for exchange":
        command  => template('msexchange/ad_prep.ps1.erb'),
        provider => powershell,
        #onlyif => '' -- determine if this has already run? What if an existing exch is in the domain? What if you run it twice?
    }
    
    #Using custom parser functions to create registry entry which makes sure that the source_dir server is added into the local intranet zone
    $source_host = hostname($source_dir)
    $source_domain = domain($source_dir)
    
    notify { "adding domain ${source_domain} to local intranet": }
    notify { "adding hostname ${source_host} to local intranet": }
     
    registry_key { "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\EscDomains\\${source_domain}":
        ensure => 'present',
    }
    
    registry_key { "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\EscDomains\\${source_domain}\\${source_host}":
        ensure => 'present'
    }
    
    registry_value { "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\EscDomains\\${source_domain}\\${source_host}\\*":
      ensure => 'present',
      type => 'dword',
      data => '1'
    }
    
}