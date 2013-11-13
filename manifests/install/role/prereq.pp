define msexchange::install::role::prereq(
  $user,
  $domain,
  $password,
){      
    if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
    }    
    
    include msexchange::params
    
    ensure_resource('windowsfeature','NET-Framework', {'ensure' => 'present' })
    ensure_resource('windowsfeature','RSAT-ADDS', {'ensure' => 'present' })
    
    if $name != 'EdgeTransport' {
        
        ensure_resource('windowsfeature','Web-Server', {'ensure' => 'present' })
        ensure_resource('windowsfeature','Web-Basic-Auth', {'ensure' => 'present' })
        ensure_resource('windowsfeature','Web-Metabase', {'ensure' => 'present' })
        ensure_resource('windowsfeature','Web-Net-Ext', {'ensure' => 'present' })
        ensure_resource('windowsfeature','Web-Lgcy-Mgmt-Console', {'ensure' => 'present' })
        ensure_resource('windowsfeature','WAS-Process-Model', {'ensure' => 'present' })        
        ensure_resource('windowsfeature','RSAT-Clustering', {'ensure' => 'present' })
        ensure_resource('windowsfeature','RSAT-Web-Server', {'ensure' => 'present' })
    }
    
    if $name == 'ClientAccess' {
        
        ensure_resource('windowsfeature','Web-ISAPI-Ext', {'ensure' => 'present' })
        ensure_resource('windowsfeature','Web-Digest-Auth', {'ensure' => 'present' })
        ensure_resource('windowsfeature','Web-Dyn-Compression', {'ensure' => 'present' })
        ensure_resource('windowsfeature','NET-HTTP-Activation', {'ensure' => 'present' })
        ensure_resource('windowsfeature','RPC-over-HTTP-proxy', {'ensure' => 'present' })
        
    }
    
    #TODO: install Office 2010 filter pack
    
    #TODO:
    #reboot { "after role ${name}":
    #  subscribe => Exec["install prerequists for role ${name}"],
    #}
}