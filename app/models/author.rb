class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.order_by_created_at
    order(created_at: :DESC)
  end

  def author_books
    books
  end

  def book_count
    books.count
  end

  def alphabetical_books
    books.order(:name)
  end

  def page_limit(number)
    books.where('number_of_pages > ?', number)
  end
end
