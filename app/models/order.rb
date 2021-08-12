class Order < ApplicationRecord
  belongs_to :wizard
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  after_validation :calculate_price

  private

  def calculate_price
    self.duration = (end_date - start_date).to_i + 1
    self.amount = wizard.price * duration
  end
end

