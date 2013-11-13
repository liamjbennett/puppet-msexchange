#
class msexchange(
  $package_ensure = $msexchange::params::package_ensure,
  $package_version = $msexchange::params::package_version,
  $package_roles = $msexchange::params::package_roles,
  $user = $msexchange::params::user,
  $domain = $msexchange::params::domain,
  $password = $msexchange::params::password,
  $upgrade = $msexchange::params::upgrade,
  $options = $msexchange::params::options
) inherits msexchange::params {
    
  # http://www.jaapwesselius.com/2012/04/04/unattended-setup-exchange-2010/
  # http://exchangeserverpro.com/installing-exchange-server-2010-pre-requisites-on-windows-server-2008/
  # http://allcomputers.us/windows_server/installing-exchange-server-2010---configure-the-server-to-host-exchange-server-2010-.aspx
    
  validate_re($package_ensure,'^(present|absent)')
  validate_re($package_version,'^(2010)')
  validate_string($user)
  validate_string($domain)
  validate_string($password)
  validate_array($package_roles)
  validate_bool($upgrade)
  validate_hash($options)

  class { 'msexchange::install':
    package_ensure => $package_ensure,
    package_roles  => $package_roles,
    user           => $user,
    domain         => $domain,
    password       => $password,
    upgrade        => $upgrade
  }
}
