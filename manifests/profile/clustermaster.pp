
# Class: splunk::profile::clustermaster
#
# This module manages splunk::profile::clustermaster
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
# == Class: splunk::profile::clustermaster
#
# The Splunk class takes are of installing and configuring a Splunk component of Cluster Master
# based on the provided parameters. 

class splunk::profile::clustermaster {

  class { 'splunk' :
#    clustering => { 
#      master   => undef,
#    }
  }

}
