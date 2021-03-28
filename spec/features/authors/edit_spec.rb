require 'rails_helper'

RSpec.describe 'New Author' do
  describe 'As a visitor' do
    describe 'When I visit the authors index' do
      it 'I can update an author' do
        author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)

        visit '/authors'

        click_link 'Update Author'

        expect(current_path).to eq("/artists/#{author_1.id}/edit")

        fill_in 'Name', with: 'S. King'
        click_on 'Update Author'

        expect(current_path).to eq("/author")
        expect(page).to have_content('S. King')
      end
    end
  end
end
