# vim: ts=2 sw=2 et
class splunk::deploymentclient
(
  $deployment_server = $splunk::deployment_server,
  $ds_intermediate = $splunk::ds_intermediate,
  $repositorylocation = $splunk::repositorylocation,
  $splunk_home = $splunk::splunk_home,
  $splunk_os_user = $splunk::splunk_os_user,
  $splunk_app_precedence_dir = $splunk::splunk_app_precedence_dir,
  $splunk_app_replace = $splunk::splunk_app_replace,
  $phonehomeintervalinsec = $splunk::phonehomeintervalinsec,
  $clientname_prefix = $splunk::clientname_prefix,
  $splunk_permissions = $splunk::splunk_permissions,
){
  $splunk_app_name = 'puppet_common_deploymentclient_base'
  if $deployment_server == undef {
    file {"${splunk_home}/etc/apps/${splunk_app_name}":
      ensure  => absent,
      recurse => true,
      purge   => true,
      force   => true,
    }
  } else {
    file { ["${splunk_home}/etc/apps/${splunk_app_name}",
            "${splunk_home}/etc/apps/${splunk_app_name}/${splunk_app_precedence_dir}",
            "${splunk_home}/etc/apps/${splunk_app_name}/metadata",]:
      ensure => directory,
      owner  => $splunk_os_user,
      group  => $splunk_os_user,
      mode   => $splunk_permissions,
    } ->
    file { "${splunk_home}/etc/apps/${splunk_app_name}/${splunk_app_precedence_dir}/deploymentclient.conf":
      ensure  => present,
      owner   => $splunk_os_user,
      group   => $splunk_os_user,
      replace => $splunk_app_replace,
      content => template("splunk/${splunk_app_name}/local/deploymentclient.conf"),
    }
  }
}
