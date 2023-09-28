# @summary Manage postsrsd
#
# @example Basic usage
#     class { 'postsrsd':
#       domains => [
#         'example.com',
#         'example.org',
#       ],
#     }
class postsrsd (
  Array[Sensitive[String[1]]]    $secrets,
  Stdlib::Absolutepath           $config_file,
  Array[Stdlib::Fqdn]            $domains,
  Stdlib::Absolutepath           $secrets_file,
  String[1]                      $chroot_dir,
  Optional[Stdlib::Absolutepath] $domains_file      = undef,
  Optional[Stdlib::Fqdn]         $srs_domain        = undef,
  String[1]                      $socketmap         = 'unix:/var/spool/postfix/srs',
  Integer[0]                     $keep_alive        = 30,
  Optional[String[1]]            $milter            = undef,
  Enum['database', 'embedded']   $original_envelope = 'embedded',
  Optional[String[1]]            $envelope_database = undef,
  String[1]                      $separator         = '=',
  Integer[1]                     $hash_length       = 4,
  Integer[1]                     $hash_minimum      = 4,
  Boolean                        $always_rewrite    = false,
  String[1]                      $unprivileged_user = 'nobody', # BAD!!
  Boolean                        $syslog            = false,
  Boolean                        $debug             = false,

  Boolean                        $manage_package    = true,
  Stdlib::Ensure::Package        $package_ensure    = installed,

  Boolean                        $manage_service    = true,
  Stdlib::Ensure::Service        $service_ensure    = 'running',
  Boolean                        $service_enable    = true,

) {
  contain postsrsd::package
  contain postsrsd::config
  contain postsrsd::service

  Class[postsrsd::package]
  -> Class[postsrsd::config]
  ~> Class[postsrsd::service]
}
