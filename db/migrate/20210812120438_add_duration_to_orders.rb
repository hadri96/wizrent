class AddDurationToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :duration, :integer
  end
end
