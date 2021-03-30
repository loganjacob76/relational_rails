class Author < ApplicationRecord
  has_many :books

  def self.order_by_created_at
    order(created_at: :DESC)
  end

  def author_books
    books
  end
end
