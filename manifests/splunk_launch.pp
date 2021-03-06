# vim: ts=2 sw=2 et
class splunk::splunk_launch (
  $splunk_os_user = $splunk::splunk_os_user,
  $splunk_bindip = $splunk::splunk_bindip,
  $splunk_home = $splunk::splunk_home,
  $splunk_db_dir = $splunk::splunk_db_dir,
){
  if $splunk_os_user == undef {
    augeas { "${splunk_home}/etc/splunk-launch.conf splunk_os_user":
      lens    => 'ShellVars.lns',
      incl    => "${splunk_home}/etc/splunk-launch.conf",
      changes => [
        'rm SPLUNK_OS_USER',
      ];
    }
  } else {
    augeas { "${splunk_home}/etc/splunk-launch.conf splunk_os_user":
      lens    => 'ShellVars.lns',
      incl    => "${splunk_home}/etc/splunk-launch.conf",
      changes => [
        "set SPLUNK_OS_USER ${splunk_os_user}",
      ];
    }
  }
  if $splunk_bindip == undef {
    augeas { "${splunk_home}/etc/splunk-launch.conf splunk_bindip":
      lens    => 'ShellVars.lns',
      incl    => "${splunk_home}/etc/splunk-launch.conf",
      changes => [
        'rm SPLUNK_BINDIP',
      ];
    }
  } else {
    augeas { "${splunk_home}/etc/splunk-launch.conf splunk_bindip":
      lens    => 'ShellVars.lns',
      incl    => "${splunk_home}/etc/splunk-launch.conf",
      changes => [
        "set SPLUNK_BINDIP ${splunk_bindip}",
      ];
    }
  }
  if $splunk_db_dir == undef {
    augeas { "${splunk_home}/etc/splunk-launch.conf splunk_db_dir":
      lens    => 'ShellVars.lns',
      incl    => "${splunk_home}/etc/splunk-launch.conf",
      changes => [
        'rm SPLUNK_DB',
      ];
    }
  } else {
    augeas { "${splunk_home}/etc/splunk-launch.conf splunk_db_dir":
      lens    => 'ShellVars.lns',
      incl    => "${splunk_home}/etc/splunk-launch.conf",
      changes => [
        "set SPLUNK_DB ${splunk_db_dir}",
      ];
    }
  }
  
}
