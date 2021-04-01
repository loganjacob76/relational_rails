require 'rails_helper'

RSpec.describe 'Edit Author' do
  before :each do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
  end

  describe 'As a visitor' do
    describe 'When I visit the authors show page' do
      it 'I can update an author' do

        visit "authors/#{@author_1.id}"

        click_link 'Update Author'

        expect(current_path).to eq("/authors/#{@author_1.id}/edit")

        fill_in 'Name', with: 'S. King'
        click_on 'Update Author'

        expect(current_path).to eq("/authors/#{@author_1.id}")
        expect(page).to have_content('S. King')
      end
    end
  end
end
