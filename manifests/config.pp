define db2_dsdriver::config (

  $host,
  $host_port,
  $dsn_alias = $name,
  $dsn_name = $name,
) {

include ::db2_dsdriver::params

  concat::fragment{"dsn_${name}":
    target => "${::db2_dsdriver::path}/${::db2_dsdriver::config}",
    content => template("${module_name}/dsn.erb"),
    order   => 25,
  }

  concat::fragment{"database_${name}":
    target => "${::db2_dsdriver::path}/${::db2_dsdriver::config}",
    content => template("${module_name}/database.erb"),
    order   => 35,
  }

}
