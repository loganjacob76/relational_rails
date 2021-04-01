require 'rails_helper'

RSpec.describe 'Edit Book' do
  before :each do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    @book_1 = @author_1.books.create!(name: 'The Shining', fiction: true, number_of_pages: 447)
  end
  describe 'As a visitor' do
    describe 'When I visit the book show page' do
      it 'can update a book' do

        visit "books/#{@book_1.id}"

        click_link 'Update Book'

        expect(current_path).to eq("/books/#{@book_1.id}/edit")

        fill_in 'Name', with: 'Shining'
        click_on 'Update Book'

        expect(current_path).to eq("/books/#{@book_1.id}")
        expect(page).to have_content('Shining')
      end
    end
  end
end
