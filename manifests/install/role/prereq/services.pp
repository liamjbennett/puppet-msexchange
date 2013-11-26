class msexchange::install::role::prereq::services(
  $ensure = 'present',
  $package_roles
){      
    if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
    }    
    
    include msexchange::params
    
    ensure_resource('windowsfeature','NET-Framework', {'ensure' => $ensure})
    ensure_resource('windowsfeature','RSAT-ADDS', {'ensure' => $ensure})
    
    if member($package_roles, 'EdgeTransport') {      
        ensure_resource('windowsfeature','Web-Server', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Web-Basic-Auth', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Web-Metabase', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Web-Net-Ext', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Web-Lgcy-Mgmt-Console', {'ensure' => $ensure})
        ensure_resource('windowsfeature','WAS-Process-Model', {'ensure' => $ensure})        
        ensure_resource('windowsfeature','RSAT-Clustering', {'ensure' => $ensure})
        ensure_resource('windowsfeature','RSAT-Web-Server', {'ensure' => $ensure})
    }
    
    if member($package_roles, 'ClientAccess') {    
        ensure_resource('windowsfeature','Web-ISAPI-Ext', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Web-Digest-Auth', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Web-Dyn-Compression', {'ensure' => $ensure})
        ensure_resource('windowsfeature','NET-HTTP-Activation', {'ensure' => $ensure})
        ensure_resource('windowsfeature','RPC-over-HTTP-proxy', {'ensure' => $ensure})     
    }
    
    if member($package_roles, 'UnifiedMessaging') {
        ensure_resource('windowsfeature','as-net-framework', {'ensure' => $ensure})
        ensure_resource('windowsfeature','Desktop-Experience', {'ensure' => $ensure})
    }
}