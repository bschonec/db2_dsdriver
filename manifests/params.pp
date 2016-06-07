class db2_dsdriver::params {

case $::operatingsystemmajrelease {

  5:       {$path = '/opt/db2/clidriver/cfg'}
  default: {$path = '/opt/db2/cfg'}

} # case

$config = 'db2dsdriver.cfg'
$config_file_owner = 'root'
$config_file_group = 'root'
$config_file_mode = '0644'

}
