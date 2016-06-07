define db2_dsdriver::parameter(
  $parameter_name  = Undef,
  $parameter_value = Undef,
) {

include ::db2_dsdriver::params

  concat::fragment{"parameter_${name}":
    target => "${::db2_dsdriver::path}/${::db2_dsdriver::config}",
    content => template("${module_name}/parameter.erb"),
    order   => 55,
  }

}
