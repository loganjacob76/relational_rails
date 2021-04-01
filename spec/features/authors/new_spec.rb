require 'rails_helper'

RSpec.describe 'New Author page' do
  describe 'As a visitor' do
    describe 'When I visit the new author form by clicking a link on the index' do
      it 'I can create a new author' do
        visit '/authors'

        click_link 'New Author'

        expect(current_path).to eq('/authors/new')
        expect(page).to have_field('Best selling author', checked: false)

        fill_in 'Name', with: 'Edgar Allen Poe'
        check('Best selling author', allow_label_click: true)
        click_on 'Create Author'

        expect(current_path).to eq("/authors")
        expect(page).to have_content('Edgar Allen Poe')
      end
    end
  end
end
