
# Class: splunk::profile::deployer
#
# This module manages splunk::profile::deployer
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
# == Class: splunk::profile::deployer
#
# The Splunk class takes are of installing and configuring a Splunk component of Deployer
# based on the provided parameters. 

class splunk::profile::deployer {

  include splunk

#  class { 'splunk' :
#    clustering => { 
#      master   => undef,
#    }
#  }

}
