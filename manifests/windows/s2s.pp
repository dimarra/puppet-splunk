# vim: ts=2 sw=2 et
class splunk::windows::s2s (
  $dhparamsize = $splunk::dhparamsize,
  $package = $splunk::package,
  $splunk_os_user = $splunk::splunk_os_user,
  $splunk_home = $splunk::splunk_home,
  $certtype = $splunk::certtype
){

  if $certtype == 'custom' {

  file { "${splunk_home}/etc/auth/certs":
    ensure  => directory,
    owner   => $splunk_os_user,
    group   => $splunk_os_user,
    mode    => '0700',
    recurse => true,
  } ->
  exec { 'openssl dhparam':
    command   => "${::system32}\\cmd.exe /c openssl dhparam -outform PEM -out '${splunk_home}/etc/auth/certs/dhparam.pem' ${dhparamsize}",
    path      => ['/bin', '/sbin', '/usr/bin', '/usr/sbin', "${splunk_home}/bin"],
    creates   => [
      "${splunk_home}/etc/auth/certs/dhparam.pem",
    ],
    # this may take some time
    logoutput => true,
    timeout   => 900,
  }

  # reuse certs from commercial Puppet
  exec { 'openssl s2s ca commercial puppet':
    command => "type ${::confdir}/ssl/certs/ca.pem > '${splunk_home}/etc/auth/certs/ca.crt'",
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin', "${splunk_home}/bin"],
    creates => [ "${splunk_home}/etc/auth/certs/ca.crt", ],
    require => File["${splunk_home}/etc/auth/certs"],
    onlyif  => "if exist ${::confdir}/ssl (exit 0) else (exit 1)"
  } ->
  exec { 'openssl s2s 1 commercial puppet':
    command => "type ${::confdir}/ssl/private_keys/${::fqdn}.pem ${::confdir}/ssl/certs/${::fqdn}.pem > '${splunk_home}/etc/auth/certs/s2s.pem'",
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin',],
    creates => [ "${splunk_home}/etc/auth/certs/s2s.pem", ],
    onlyif  => "if exist ${::confdir}/ssl (exit 0) else (exit 1)"
  }
  
  } # if $certtype

}

