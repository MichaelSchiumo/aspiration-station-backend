class DreamerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :age, :name, :sex
  has_many :aspirations
end
