# == Class: db2_dsdriver
#
# Full description of class db2_dsdriver here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'db2_dsdriver':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class db2_dsdriver (
  $path = $::db2_dsdriver::params::path,
  $config = $::db2_dsdriver::params::config,

) inherits ::db2_dsdriver::params {

$cfg_file = "${path}/${config}"

concat{$cfg_file: }

concat::fragment{'header':
    target  => $cfg_file,
    content => "# This file managed by Puppet.  DO NOT EDIT!\n\n",
    order   => 1,
  }

concat::fragment{'configuration_open':
    target  => $cfg_file,
    content => "<configuration>\n",
    order   => 1,
  }

concat::fragment{'dsncollection_open':
    target  => $cfg_file,
    content => "  <dsncollection>\n",
    order   => 20,
  }

concat::fragment{'dsncollection_close':
    target  => $cfg_file,
    content => "  </dsncollection>\n",
    order   => 29,
  }

concat::fragment{'databases_open':
    target  => $cfg_file,
    content => "  <databases>\n",
    order   => 30,
  }

concat::fragment{'databases_close':
    target  => $cfg_file,
    content => "  </databases>\n",
    order   => 39,
  }

concat::fragment{'parameters_open':
    target  => $cfg_file,
    content => "  <parameters>\n",
    order   => 50,
  }

concat::fragment{'parameters_close':
    target  => $cfg_file,
    content => "  </parameters>\n",
    order   => 59,
  }

concat::fragment{'configuration_close':
    target  => $cfg_file,
    content => "</configuration>\n",
    order   => 99,
  }

}
