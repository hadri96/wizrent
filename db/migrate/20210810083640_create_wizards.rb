class CreateWizards < ActiveRecord::Migration[6.0]
  def change
    create_table :wizards do |t|
      t.string :name
      t.string :eye_color
      t.string :hair_color
      t.string :sex
      t.string :house
      t.integer :price
      t.string :picture_url
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :species

      t.timestamps
    end
  end
end
