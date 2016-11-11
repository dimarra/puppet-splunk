# vim: ts=2 sw=2 et
class splunk::service (
  $package = $splunk::package,
  $splunk_home = $splunk::splunk_home,
  $service = $splunk::service
) {
  notice("enable => ${service}[enable]")
  notice("ensure => ${service}[ensure]")
  if $service[ensure] == undef {
    service { $package :
      enable  => $service[enable],
#      provider => 'redhat'
    }
  } else {
    service { $package :
      ensure => $service[ensure],
      enable => $service[enable],
#      provider => 'redhat',
    }
  }
}
