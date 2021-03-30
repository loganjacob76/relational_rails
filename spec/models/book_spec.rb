require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationship' do
    it { should belong_to :author }
  end

  describe 'instance methods' do
    describe '#author_name' do
      it 'returns the name of the books author' do
        author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
        book_1 = author_1.books.create!(name: 'The Shining', fiction: true, number_of_pages: 447)

        expect(book_1.author_name).to eq('Stephen King')
      end
    end
  end
end
