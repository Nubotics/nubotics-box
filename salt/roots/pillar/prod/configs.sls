nginx:
  vhost:
    cache_static_files: "on"

php:
  display_errors: "Off"
  display_startup_errors: "Off"
  error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
  track_errors: "Off"
  session:
    gc_maxlifetime: 7200
  xdebug:
    remote_enable: 0
    profiler_enable: 0

redis:
  user: vagrant

mongodb:
  use_ppa: True
  package_name: mongodb-10gen
  mongo_directory: /mongodb
  manage_replica_set: False
  reconfigure_replica_set: False
  config_svr: False
  shard_svr: False
  settings:
    bind_ip: 127.0.0.1
    db_path: /mongodb/data
    log_path: /mongodb/log
    log_append: True
    rest: True

mongos:
  use_ppa: True
  package_name: mongodb-org-mongos
  settings:
    log_file: /mongodb/log/mongos.log
    config_svrs: "cfg1.local:27019,cfg2.local:27019,cfg3.local:27019"
