class AddWizardIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :wizard, null: false, foreign_key: true
  end
end
