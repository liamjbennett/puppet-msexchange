class msexchange::install(
  $package_ensure,
  $package_roles,
  $user,
  $domain,
  $password,
  $upgrade,
){
    
    if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
    }
    
    include msexchange::params
    
    anchor { 'msexchange::install::begin': }
    -> class { 'msexchange::install::prep':
       user       => $user,
       domain     => $domain,
       password   => $password,
       upgrade    => $upgrade,
       org_name   => $msexchange::params::organization_name,
       source_dir => $msexchange::params::source_dir
    }
    -> msexchange::install::role::prereq { $package_roles:
      user     => $user,
      domain   => $domain,
      password => $password,
    }
    -> msexchange::install::role::install { $package_roles:
      package_ensure => $package_ensure,
      user           => $user,
      domain         => $domain,
      password       => $password
    }
    -> anchor { 'msexchange::install::end': }
    
    #TODO: reboot after install
}
