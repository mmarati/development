# Class: user
# ===========================
#
# Full description of class user here.
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
#    class { 'user':
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
class user {
if $osfamily_windows {
user {'maruthi':
ensure => present,
groups => 'Administrators',
home => 'C:\Users\maruthi',
managehome => true,
password => 'Sree@1982',
}
user {'Administrator' :
ensure => 'absent',
}
}

else {
user { "maruthi":
ensure => present,
#uid => '0',
#gid => 'admin',
shell => '/bin/bash',
home => '/home/maruthi',
managehome => true,
password =>'$6$7.IwhG8ukBNUz/Yt$8yuzq1rxI1DcwdjvtA3/EuylvpGwYYNrnPwxbg2KXfv4.jJBj0HrefesVoy1blGa9mMW2oEcRGwc/FOwLKtDV.',
#password_max_age => '9999'
##expiry => '2020-12-31',
}
}
}
