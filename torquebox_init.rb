require 'data_mapper'
require 'models/term'
require 'models/url'

DataMapper::Logger.new(TorqueBox::Logger.new(DataMapper), :info)
DataMapper.setup(:default, "postgres://poorsmatic:poorsmatic@localhost/poorsmatic")
DataMapper.auto_upgrade!


