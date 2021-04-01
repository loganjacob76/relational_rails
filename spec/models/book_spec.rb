require 'rails_helper'

RSpec.describe Book, type: :model do
  before :each do
    @author_1 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    @author_2 = Author.create(name: 'Stephen King', best_selling_author: true, year_first_published: 1973)
    @book_1 = Book.create(name: 'The Shining', fiction: true, number_of_pages: 447, author: @author_2)
    @book_2 = Book.create(name: 'Deep Work', fiction: false, number_of_pages: 304, author: @author_1)
  end

  describe 'relationship' do
    it { should belong_to :author }
  end

  describe 'class methods' do
    it 'finds all books that are fiction' do
      expect(Book.only_fiction).to eq([@book_1])
    end
  end

  describe 'instance methods' do
    describe '#author_name' do
      it 'returns the name of the books author' do
        expect(@book_1.author_name).to eq('Stephen King')
      end
    end
  end
end
