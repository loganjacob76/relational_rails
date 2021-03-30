class Employee < ApplicationRecord
  belongs_to :bookstore

  def employed_at
    Bookstore.find(bookstore_id).name
  end

  def self.employees_of_the_month
    where(employee_of_the_month = 'TRUE')
  end
end
