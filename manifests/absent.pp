# vim: ts=2 sw=2 et
class splunk::absent (
){
  
#  service { ['splunkforwarder', 'splunk']:
#    ensure => 'stopped',
#    enable => false,
#  }

  package { ['splunkforwarder', 'splunk']:
    ensure   => 'absent',
#    provider => chocolatey,
#    source   => '"http://ip-172-31-25-24.ap-southeast-2.compute.internal/chocolatey"',
#    install_options => '--allow-empty-checksums',
  }

}

