class Url
  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :title, String
  property :term, String
  property :count, Integer
end
