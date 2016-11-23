
# Class: splunk::profile::deploymentserver
#
# This module manages splunk::profile::deploymentserver
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
# vim: ts=2 sw=2 et
#
# == Class: splunk::profile::deploymentserver
#
# The Splunk class takes are of installing and configuring a Splunk component of Deployment Server
# based on the provided parameters. 

class splunk::profile::deploymentserver {

  class { 'splunk' :
    tcpout => lookup("splunk::searchpeers"),
  }

}
