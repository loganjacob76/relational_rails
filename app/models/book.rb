class Book < ApplicationRecord
  belongs_to :author

  def author_name
    Author.find(author_id).name
  end

  def self.only_fiction
    where(fiction: true)
  end
end
