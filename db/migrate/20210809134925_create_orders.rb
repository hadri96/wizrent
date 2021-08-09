class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :amount
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
