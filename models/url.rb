class Url
  include DataMapper::Resource

  has n, :occurrences
  has n, :terms, :through => :occurrences

  property :id, Serial
  property :url, String
  property :title, String
  property :term, String
  property :count, Integer
end
