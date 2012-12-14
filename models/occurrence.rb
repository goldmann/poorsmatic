class Occurrence
  include DataMapper::Resource

  belongs_to :url, :key => true
  belongs_to :term, :key => true
end
