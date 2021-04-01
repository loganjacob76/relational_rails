class Bookstore < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates_presence_of :name, :days_open_per_week
  validates :has_coffee_shop, inclusion: [true,false]
  
  def self.order_by_creation
    order(created_at: :desc)
  end

  def alphabetized_employees
    employees.order(:name)
  end

  def employees_by_age(number)
    employees.where('age > ?', number)
  end
end
