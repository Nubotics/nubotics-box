nginx:
  conf:
    user: "vagrant"
    worker_processes: 4
    worker_connections: 1024
    error_log:
      path: "/var/log/nginx/error.log"
      level: "crit"
    gzip: "on"
  vhost:
    port: 80
    root: "/var/www/application/public"
    cache_static_files: "off"
    error_log: "/var/log/nginx/application_error.log"

php:
  display_errors: "On"
  display_startup_errors: "On"
  error_reporting: "E_ALL"
  track_errors: "On"
  default_socket_timeout: 60
  timezone: "UTC"
  upload_max_filesize: "10M"
  session:
    save_handler: "files"
    save_path: "/var/lib/php"
    name: "PSBSESSID"
    gc_maxlifetime: 28800
    cookie_lifetime: 0
    serialize_handler: "php"
  xdebug:
    idekey: "phpsaltbox"
    remote_enable: 1
    profiler_enable: 1

mysql:
  # see https://github.com/saltstack-formulas/mysql-formula
  server:
    root_password: 'root'

redis:
  # see https://github.com/saltstack-formulas/redis-formula
  user: vagrant
  port: 6379

nodejs:
  version: 0.12.4
