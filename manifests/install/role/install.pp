define msexchange::install::role::install(
  $package_ensure,
  $user,
  $domain,
  $password,
){  
    
    if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
    }
    
    include msexchange::params

    $options = $msexchange::params::roles[$name]['options']
      
    $mode = $package_ensure ? {
      'installed'   => 'install',
      'uninstalled' => 'uninstall',
      default       => 'install'
    }
    
    $role_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\ExchangeServer\\v14\\${name}Role"
    
    #TODO: test options - SourceDir and UpdatesDir cannot be the same directory as it causes an error with LPSETUPUI.exe
    
    file { "C:/role_install_${name}.ps1":
      ensure  => present,
      content => template('msexchange/role_install.ps1.erb')
    }
    
    #TODO: is this the best way to determine if an exchange role is installed AND how do we check if it is in the middle of being installed
    exec { "${mode} role ${name}":
        command  => "C:/role_install_${name}.ps1",
        timeout  => 0,
        provider => powershell,
        onlyif   => "if (Get-Item -LiteralPath \'${role_reg_key}\' -ErrorAction SilentlyContinue) { exit 1 }" 
    }    
}