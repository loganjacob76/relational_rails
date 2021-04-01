class Employee < ApplicationRecord
  belongs_to :bookstore

  validates_presence_of :name, :age
  validates :employee_of_the_month, inclusion: [true,false]

  def employed_at
    Bookstore.find(bookstore_id).name
  end
end
