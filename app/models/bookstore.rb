class Bookstore < ApplicationRecord
  has_many :employees
  
  def self.order_by_creation
    order(created_at: :desc)
  end
end
