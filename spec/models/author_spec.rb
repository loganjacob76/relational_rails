require 'rails_helper'

RSpec.describe Author, type: :model do
  before :each do
    @author = Author.create!(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    @book_1 = Book.create!(name: 'Deep Work', fiction: false, number_of_pages: 400, author: @author)
    @book_2 = Book.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 302, author: @author)
  end

  describe 'relationships' do
    it { should have_many :books}
  end

  describe 'instance methods' do
    it 'can list author books' do
      expect(@author.author_books).to eq([@book_1, @book_2])
    end

    it 'can count author books' do
      expect(@author.book_count).to eq(2)
    end

    it 'can alphabetize books' do
      expect(@author.alphabetical_books).to eq([@book_1, @book_2])
    end

    it 'can define a page limit' do
      expect(@author.page_limit(350)).to eq([@book_1])
    end
  end
end
