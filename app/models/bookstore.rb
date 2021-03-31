class Bookstore < ApplicationRecord
  has_many :employees, dependent: :destroy
  
  def self.order_by_creation
    order(created_at: :desc)
  end

  def alphabetized_employees
    employees.order(:name)
  end
end
