class CreateEmployee < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :bookstore_id
      t.string :name
      t.boolean :employee_of_the_month
      t.integer :age
      t.timestamp :created_at
      t.timestamp :updated_at
    end
    add_foreign_key :employees, :bookstores
  end
end
