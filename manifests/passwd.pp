# vim: ts=2 sw=2 et
class splunk::passwd (
  $admin = $splunk::admin,
  $splunk_home = $splunk::splunk_home,
  $splunk_os_user = $splunk::splunk_os_user
){
          # the following section is added for handling on windows platform
          if $::osfamily == 'windows' {
#            include splunk::windows::passwd
#            Class['splunk::windows::passwd']
          } else {
          # proceed as per original module
  if $admin != undef {
    $hash  = $admin[hash]
    $fn    = $admin[fn]
    $email = $admin[email]
    file { "${splunk_home}/etc/passwd":
      ensure  => present,
      owner   => $splunk_os_user,
      mode    => '0600',
      content => ':admin:::',
      replace => 'no',
    } ->
    exec { 'set admin passwd':
      command => "sed -i -e 's#^:admin:.*$#:admin:${hash}::${fn}:admin:${email}::#g' ${splunk_home}/etc/passwd",
      unless  => "grep -qe '^:admin:${hash}' ${splunk_home}/etc/passwd",
      path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    } ->
    file { "${splunk_home}/etc/.ui_login":
      ensure  => present,
      owner   => $splunk_os_user,
      mode    => '0600',
      content => '',
      replace => 'no',
    }
  }
          } # end if $::osfamily == 'windows'
}

