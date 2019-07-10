# @summary 
# installs base apache package
#
class apache::install {
  package { "${apache::install_name}":
    ensure => "${apache::install_ensure}",
  }
}
