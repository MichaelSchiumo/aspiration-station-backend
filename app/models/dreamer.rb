class Dreamer < ApplicationRecord
  has_many :aspirations
  has_many :songs
  has_many :quotes

  # validates :name, presence: true
  # validates :age, presence: true
  # validates :sex, presence: true

end
