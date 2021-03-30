class Author < ApplicationRecord
  has_many :books

  def self.order_by_created_at
    order(created_at: :DESC)
  end

  def book_count
    books.count
  end

  def author_books
    # books.order(:name)
    books
  end

  def alphabetical_books
    books.order(:name)
  end
end
