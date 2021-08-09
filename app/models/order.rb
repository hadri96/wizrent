class Order < ApplicationRecord
  belongs_to :wizard
  belongs_to :user

  validates :amount, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
