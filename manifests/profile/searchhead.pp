
# Class: splunk::profile::searchhead
#
# This module manages splunk::profile::searchhead
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
# == Class: splunk::profile::searchhead
#
# The Splunk class takes are of installing and configuring a Splunk component of Search Head
# based on the provided parameters. 

class splunk::profile::searchhead {

  $searchpeers = lookup("splunk::searchpeers")
  notify { "searchpeers $searchpeers": }

  $searchheads = lookup("splunk::searchheads")
  notify { "searchheads $searchheads": }


  $heavyforwarders = lookup("splunk::heavyforwarders")
  notify { "heavyforwarders $heavyforwarders": }


#
#  class { 'splunk' :
#    clustering => lookup("splunk::shclustering", Hash[String, Scalar], "hash", {}),
#    tcpout => lookup("splunk::searchpeers", Array)
#  }
#
}
