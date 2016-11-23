
# Class: splunk::profile::universalforwarder
#
# This module manages splunk::profile::universalforwarder
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
# == Class: splunk::profile::universalforwarder
#
# The Splunk class takes are of installing and configuring a Splunk component of Universal Forwarder
# based on the provided parameters. 

class splunk::profile::universalforwarder {

  class { 'splunk' :
    type => 'uf',
    tcpout => lookup("splunk::heavyforwarders")
  }

}
