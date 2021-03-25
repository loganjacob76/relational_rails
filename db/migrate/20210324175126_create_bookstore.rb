class CreateBookstore < ActiveRecord::Migration[5.2]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.boolean :has_coffee_shop
      t.integer :days_open_per_week

      t.timestamps
    end
  end
end
