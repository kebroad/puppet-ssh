function ssh::data {
  $base_params = {
    'ssh::ensure' => 'present',
    'ssh::service_enable'  => true,
    'ssh::service_ensure'  => 'running',
  } 

    case $facts['os']['family'] {
      'Debian': {
        $os_params = {
          'ssh::package_name' => 'openssh-server',
          'ssh::service_name' => 'ssh',
        }
      }
      'RedHat': {
        $os_params = {
          'ssh::package_name' => 'openssh-server',
          'ssh::service_name' => 'sshd',
        }
      }
      default: {
        fail("${facts['operatingsystem']} is not supported!")
      }
   }
 


  $base_params + $os_params
}
