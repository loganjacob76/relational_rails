class Employee < ApplicationRecord
  belongs_to :bookstore

  def employed_at
    Bookstore.find(bookstore_id).name
  end
end
