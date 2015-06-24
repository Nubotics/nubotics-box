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
    bind_ip: 0.0.0.0
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