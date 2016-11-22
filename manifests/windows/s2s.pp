# vim: ts=2 sw=2 et
class splunk::windows::s2s (
  $dhparamsize = $splunk::dhparamsize,
  $package = $splunk::package,
  $splunk_os_user = $splunk::splunk_os_user,
  $splunk_home = $splunk::splunk_home,
  $certtype = $splunk::certtype,
  $splunk_permissions = $splunk::splunk_permissions,
){
          # the following section is added for handling on windows platform
          if $::osfamily == 'windows' {

  $confdir = 'C:/ProgramData/PuppetLabs/puppet/etc'
  if $certtype == 'custom' {

  file { "${splunk_home}/etc/auth/certs":
    ensure  => directory,
    owner   => $splunk_os_user,
    group   => $splunk_os_user,
    mode    => $splunk_permissions,
    recurse => true,
  } ->
  exec { 'openssl dhparam':
    command   => "openssl dhparam -outform PEM -out \"${splunk_home}/etc/auth/certs/dhparam.pem\" ${dhparamsize}",
    path      => ["${::system32}", "${splunk_home}/bin", ],
    creates   => [
      "${splunk_home}/etc/auth/certs/dhparam.pem",
    ],
    # this may take some time
    logoutput => true,
    timeout   => 900,
  }
/*
  # reuse certs from commercial Puppet
  exec { 'openssl s2s ca commercial puppet':
    command => "type ${::confdir}/ssl/certs/ca.pem > '${splunk_home}/etc/auth/certs/ca.crt'",
    path      => ["${::system32}", "${splunk_home}/bin"],
    creates => [ "${splunk_home}/etc/auth/certs/ca.crt", ],
    require => File["${splunk_home}/etc/auth/certs"],
    onlyif  => "${::system32}\\cmd.exe /c 'if exist ${::confdir}/ssl (exit 0) else (exit 1)'"
  } ->
  exec { 'openssl s2s 1 commercial puppet':
    command => "type ${::confdir}/ssl/private_keys/${::fqdn}.pem ${::confdir}/ssl/certs/${::fqdn}.pem > '${splunk_home}/etc/auth/certs/s2s.pem'",
    path      => ["${::system32}", "${splunk_home}/bin"],
    creates => [ "${splunk_home}/etc/auth/certs/s2s.pem", ],
    onlyif  => "${::system32}\\cmd.exe /c 'if exist ${::confdir}/ssl (exit 0) else (exit 1)'"
  }
 */  
 
  file { "${splunk_home}/etc/auth/certs/ca.crt": 
    ensure  => 'present',
    replace => 'no',
    owner   => $splunk_os_user,
    group   => $splunk_os_user,
    source  => "${confdir}/ssl/certs/ca.pem",
  }

  concat { "${splunk_home}/etc/auth/certs/s2s.pem":
    owner   => $splunk_os_user,
    group   => $splunk_os_user,
    mode    => '0660'
  }

  concat::fragment{ "${confdir}/ssl/private_keys/${::fqdn}.pem":
    target  => "${splunk_home}/etc/auth/certs/s2s.pem",
    source  => "${confdir}/ssl/private_keys/${::fqdn}.pem",
    order   => '01'
  }

  concat::fragment{ "${confdir}/ssl/certs/${::fqdn}.pem":
    target  => "${splunk_home}/etc/auth/certs/s2s.pem",
    source  => "${confdir}/ssl/certs/${::fqdn}.pem",
    order   => '02'
  }
  } # if $certtype
          } # end if $::osfamily == 'windows'

}

