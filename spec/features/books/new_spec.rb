require 'rails_helper'

RSpec.describe 'New Book' do
  before :each do
    @author = Author.create!(name: 'Jane Austen', best_selling_author: true, year_first_published: 1811)
  end
  describe 'As a visitor' do
    describe 'When I visit the new book form by clicking a link on the relationship' do
      it 'can create a new book for that author' do
        visit "/authors/#{@author.id}/books"

        click_link 'Create Book'

        expect(current_path).to eq("/authors/#{@author.id}/books/new")

        fill_in 'Name', with: 'Persuation'
        click_on 'Create Book'

        expect(current_path).to eq("/authors/#{@author.id}/books")
        expect(page).to have_content('Persuation')
      end
    end
  end
end
