
# Class: splunk::profile::universalfowarder
#
# This module manages splunk::profile::universalfowarder
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
# == Class: splunk::profile::universalfowarder
#
# The Splunk class takes are of installing and configuring a Splunk component of Universal Forwarder
# based on the provided parameters. 

class splunk::profile::universalfowarder {

  class { 'splunk' :
    type => 'uf',
  }

}
