# vim: ts=2 sw=2 et

class splunk::distsearch (
  $searchpeers = $splunk::searchpeers,
  $splunk_os_user = $splunk::splunk_os_user,
  $splunk_home = $splunk::splunk_home,
  $splunk_app_replace        = $splunk::splunk_app_replace,
  $splunk_app_precedence_dir = $splunk::splunk_app_precedence_dir,
  $splunk_permissions = $splunk::splunk_permissions,
){
  notify { "distsearch $searchpeers": }
  $splunk_app_name = 'puppet_search_shcluster_distsearch_base'
  if $searchpeers == undef {
    file { "${splunk_home}/etc/system/local/distsearch.conf":
      ensure  => 'absent',
    }
  } else {
    # do nothing, because we use $SPLUNK_HOME/bin/splunk add search-server
    file { ["${splunk_home}/etc/apps/${splunk_app_name}",
            "${splunk_home}/etc/apps/${splunk_app_name}/${splunk_app_precedence_dir}",
            "${splunk_home}/etc/apps/${splunk_app_name}/metadata",]:
      ensure => directory,
      owner  => $splunk_os_user,
      group  => $splunk_os_user,
      mode   => $splunk_permissions,
    } ->
    file { "${splunk_home}/etc/apps/${splunk_app_name}/${splunk_app_precedence_dir}/distsearch.conf":
      ensure  => present,
      owner   => $splunk_os_user,
      group   => $splunk_os_user,
      replace => $splunk_app_replace,
      content => template("splunk/${splunk_app_name}/local/distsearch.conf"),
    }
  }
}
