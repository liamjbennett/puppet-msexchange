class msexchange::install::role::prereq(
  $package_roles
){      
    if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
    }    
    
    include msexchange::params
    
    class { 'msexchange::install::role::prereq::packages':
      package_roles => $package_roles
    }
    
    class { 'msexchange::install::role::prereq::services':
      package_roles => $package_roles
    }
    
    reboot { "after role ${name}":
      require => [ Class['msexchange::install::role::prereq::packages'], Class['msexchange::install::role::prereq::services'] ]
    }
}