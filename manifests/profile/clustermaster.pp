
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

  # do a lookup hash strategy to merge the values from other yaml files.
  class { 'splunk' :
    clustering => lookup("splunk::clustering", Hash[String, Scalar], "hash", undef)
  }
}
