require 'mongo'

@mongo_db ||= ::Mongo::MongoClient.new(Volt.config.db_host, Volt.config.db_port)
@db ||= @mongo_db.db(Volt.config.db_name)

@db[:mails].drop_index( 'createdAt_1' )
@db[:mails].create_index({ createdAt: 1 }, { expireAfterSeconds: 3600 } )