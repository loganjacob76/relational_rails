class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :name, :number_of_pages
  validates :fiction, inclusion: [true,false]

  def author_name
    Author.find(author_id).name
  end

  def self.only_fiction
    where(fiction: true)
  end
end
