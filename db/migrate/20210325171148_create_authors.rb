class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :best_selling_author
      t.integer :year_first_published

      t.timestamps
    end
  end
end
