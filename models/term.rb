class Term
  include DataMapper::Resource

  has n, :occurrences 
  has n, :urls, :through => :occurrences

  property :id, Serial
  property :term, String

  validates_presence_of :term
  validates_uniqueness_of :term
end

