class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates_presence_of :name, :year_first_published
  validates :best_selling_author, inclusion: [true,false]

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
