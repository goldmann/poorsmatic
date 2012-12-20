require 'data_mapper'
require 'models/term'
require 'models/url'

DataMapper::Logger.new(TorqueBox::Logger.new(DataMapper), :info)
DataMapper.setup(:default, "postgres://#{ENV['POSTGRESQL_DB_USER']}:#{ENV['POSTGRESQL_DB_PASS']}@#{ENV['POSTGRESQL_DB_HOST']}/#{ENV['POSTGRESQL_DB_NAME']}")
DataMapper.auto_upgrade!

