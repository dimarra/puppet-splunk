# vim: ts=2 sw=2 et
class splunk::absent (
  $inputport = $splunk::inputport,
  $ciphersuite = $splunk::ciphersuite,
  $sslversions = $splunk::sslversions,
  $ecdhcurvename = $splunk::ecdhcurvename,
  $splunk_home = $splunk::splunk_home,
  $splunk_app_precedence_dir = $splunk::splunk_app_precedence_dir,
  $splunk_app_replace = $splunk::splunk_app_replace,
  $splunk_os_user = $splunk::splunk_os_user,
  $certtype = $splunk::certtype
){
  
  service { 'splunkforwarder':
    ensure => 'stopped',
    enable => false,
  }

  package { 'splunkforwarder':
    ensure   => 'absent',
#    provider => chocolatey,
#    source   => '"http://ip-172-31-25-24.ap-southeast-2.compute.internal/chocolatey"',
#    install_options => '--allow-empty-checksums',
  }

  service { 'splunk':
    ensure => 'stopped',
    enable => false,
  }

  package { 'splunk':
    ensure   => 'absent',
#    provider => chocolatey,
#    source   => '"http://ip-172-31-25-24.ap-southeast-2.compute.internal/chocolatey"',
#    install_options => '--allow-empty-checksums',
  }

}

