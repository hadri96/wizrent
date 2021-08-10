class Wizard < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :species, presence: true
  validates :description, presence: true
  validates :house, presence: true

end
