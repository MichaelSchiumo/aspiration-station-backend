class Dreamer < ApplicationRecord
  has_many :aspirations

  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  
end
