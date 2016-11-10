
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

 $clustering_first = lookup("splunk::clustering",  Hash[String, Scalar], "first", "default value")
  notify { "first $clustering_first": }


  $clustering_deep = lookup("splunk::clustering", Hash[String, Scalar], "deep", "default value")
  notify { "deep $clustering_deep": }


#  $clustering_unique = lookup("splunk::clustering", Hash[String, Scalar], "unique", "default value")
#  notify { "unique $clustering_unique": }


  $clustering_hash = lookup("splunk::clustering", Hash[String, Scalar], "hash", "default value")
  notify { "hash $clustering_hash": }

  class { 'splunk' :
    clustering => lookup("splunk::clustering", Hash[String, Scalar], "hash", undef),
    tcpout     => 'donotapply',
  }

}
