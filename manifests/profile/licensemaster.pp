
# Class: splunk::profile::licensemaster
#
# This module manages splunk::profile::licensemaster
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
# == Class: splunk::profile::licensemaster
#
# The Splunk class takes are of installing and configuring a Splunk component of License Master
# based on the provided parameters. 

class splunk::profile::licensemaster {

  include splunk

#  class { 'splunk' :
#    clustering => { 
#      master   => undef,
#    }
#  }

}