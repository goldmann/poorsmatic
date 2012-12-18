require 'data_mapper'

require 'models/term'
require 'models/url'

DB = '/tmp/poorsmatic.db'

DataMapper::Logger.new(TorqueBox::Logger.new(DataMapper), :debug)
DataMapper.setup(:default, "sqlite://#{DB}")

if File.exists?(DB)
  DataMapper.auto_upgrade!
else
  DataMapper.auto_migrate!
end


