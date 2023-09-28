# @summary Manage postsrsd service
#
# @api private
class postsrsd::service {
  if $postsrsd::manage_service {
    service { 'postsrsd':
      ensure => $postsrsd::service_ensure,
      enable => $postsrsd::service_enable,
    }
  }
}
