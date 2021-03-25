class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :fiction
      t.integer :number_of_pages

      t.timestamps
    end
  end
end
