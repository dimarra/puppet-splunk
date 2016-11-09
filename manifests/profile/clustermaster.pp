
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

  $clustering_first = lookup("splunk::clustering",  Hash[String, Scalar], "first", "default value")
  notify { "first $clustering_first": }

  $clustering_deep = lookup("splunk::clustering", Hash[String, Scalar], "deep", "default value")
  notify { "deep $clustering_deep": }

#  $clustering_unique = lookup("splunk::clustering", Hash[String, Scalar], "unique", "default value")
#  notify { "unique $clustering_unique": }

  $clustering_hash = lookup("splunk::clustering", Hash[String, Scalar], "hash", undef)
  notify { "hash $clustering_hash": }


  include splunk
  class { 'splunk' :
    clustering => lookup("splunk::clustering", Hash[String, Scalar], "hash", undef)
  }
}
