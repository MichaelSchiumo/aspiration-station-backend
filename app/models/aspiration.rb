class Aspiration < ApplicationRecord
  belongs_to :dreamer

  validates :title, presence: true
  validates :category, presence: true
  validates :status, presence: true
end
