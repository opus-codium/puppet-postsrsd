# @summary Manage postsrsd configuration
#
# @api private
class postsrsd::config {
  file { $postsrsd::secrets_file:
    ensure  => file,
    owner   => 'root',
    group   => 'postsrsd',
    mode    => '0644',
    content => epp('postsrsd/postsrsd.secret.epp'),
  }

  file { $postsrsd::config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'postsrsd',
    mode    => '0640',
    content => epp('postsrsd/postsrsd.conf.epp'),
  }
}
