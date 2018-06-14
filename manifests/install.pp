class ssh::install(
  String $package_name = $::ssh::package_name,
  String $ensure       = $::ssh::ensure,
) {
  package { 'ssh_package': 
    ensure => $ensure,
    name   => $package_name, 
  }
}
