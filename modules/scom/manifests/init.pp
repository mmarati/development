# Class: maruthi
# ===========================
#
# Full description of class maruthi here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'maruthi':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class scom {

file{ 'C:\\Temp\\AMD64':
    source => 'puppet:///modules/scom/AMD64',
    source_permissions => ignore,
    ensure => 'directory',
    recurse => 'true',
   notify => Package['MOMAgent.msi'],
   }
package {'MOMAgent.msi':
  name => 'MoMAgent.msi',
  ensure => 'installed',
  provider  => "windows",
  source => 'C:\\Temp\\AMD64\\MOMAgent.msi',
  install_options =>[ '/quiet','USE_MANUALLY_SPECIFIED_SETTINGS=0','AcceptEndUserLicenseAgreement=1','MANAGEMENT_GROUP=OMRLM2012','MANAGEMENT_SERVER_DNS=kwtotecoma01'],
require => File['C:\\Temp\\AMD64\\MOMAgent.msi'],
}
 service {'HealthService':
 ensure  => 'running',
 require => Package['MOMAgent.msi'],
    }
    }
