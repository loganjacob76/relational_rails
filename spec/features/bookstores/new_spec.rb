require 'rails_helper'

RSpec.describe 'new bookstore' do
    describe 'as a visitor' do
        describe 'when i visit the new bookstore form by clikcing a link on the index' do
            it 'can create new bookstore' do
                visit '/bookstores'

                click_link 'Add Bookstore'

                expect(current_path).to eq('/bookstores/new')

                fill_in 'bookstore[name]', with: 'Store 1'
                click_on 'Submit'

                expect(current_path).to eq('/bookstores')
                expect(page).to have_content('Store 1')
            end
        end
    end
end