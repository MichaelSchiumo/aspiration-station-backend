class Dreamer < ApplicationRecord
  has_many :aspirations
  has_many :songs

  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true

end
