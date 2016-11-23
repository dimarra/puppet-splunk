
# Class: splunk::profile::heavyforwarder
#
# This module manages splunk::profile::heavyforwarder
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
# == Class: splunk::profile::heavyforwarder
#
# The Splunk class takes are of installing and configuring a Splunk component of Heavy Forwarder
# based on the provided parameters. 

class splunk::profile::heavyforwarder {

  class { 'splunk' :
#    clustering => lookup("splunk::shclustering", Hash[String, Scalar], "hash", {}),
    tcpout => lookup("splunk::searchpeers"),
  }
  
}

