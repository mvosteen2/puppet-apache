# @summary 
# generates virtual hosts files
#
# @example
#   apache::vhosts { 'namevar':
#     port      => INT,
#     subdomain => STR,
#     admin     => STR,
#     docroot   => STR,
#}
define apache::vhosts (
  Integer  $port,
  String[1] $subdomain,
  String    $admin,
  String    $docroot,
) {
  file { "${docroot}":
    ensure => 'director',
    owner  => $apache::vhosts_owner,
    group  => $apache::vhosts_group,
  }

  file { "${apache::vhost_dir}/${subdomain}.conf":
    ensure  => 'file',
    owner   => $apache::vhosts_owner,
    group   => $apache::vhosts_group,
    mode    => '2644',
    content => epp('apache/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain, 'admin' => $admin, 'docroot' => $docroot}),
    notify  => Service['apache_service'],
  }
}
