class Term
  include DataMapper::Resource

  property :id, Serial
  property :term, String

  validates_presence_of :term
  validates_uniqueness_of :term
end

