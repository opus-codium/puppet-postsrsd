# @summary Manage postsrsd package
#
# @api private
class postsrsd::package {
  if $postsrsd::manage_package {
    package { 'postsrsd':
      ensure => $postsrsd::package_ensure,
    }
  }
}
