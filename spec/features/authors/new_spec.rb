require 'rails_helper'

RSpec.describe 'New Author' do
  describe 'As a visitor' do
    describe 'When I visit the new author form by clicking a link on the index' do
      it 'I can create a new author' do
        visit '/authors'

        click_link 'New Author'

        expect(current_path).to eq('/authors/new')

        fill_in 'Name', with: 'Edgar Allen Poe'
        click_on 'Create Author'

        expect(current_path).to eq("/authors")
        expect(page).to have_content('Edgar Allen Poe')
      end
    end
  end
end
