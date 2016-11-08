
# Class: splunk::profile::indexer
#
# This module manages splunk::profile::indexer
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
# == Class: splunk::profile::indexer
#
# The Splunk class takes are of installing and configuring a Splunk component of Indexer
# based on the provided parameters. 

class splunk::profile::indexer {

  class { 'splunk' :
    tcpout       => undef,
  }

}
