# @summary Manage postsrsd configuration
#
# @api private
class postsrsd::config {
  file { $postsrsd::config_path:
    ensure  => file,
    owner   => 'root',
    group   => 'postsrsd',
    mode    => '0640',
    content => epp('postsrsd/postsrsd.conf.epp'),
  }
}
