class DreamerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :age, :name, :sex
  has_many :aspirations
  has_many :songs
  has_many :quotes
end
