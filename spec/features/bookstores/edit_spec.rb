require 'rails_helper'

RSpec.describe 'bookstores edit page' do
    before :each do
        @store = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
    end

    describe 'as a visitor' do
        describe 'when i visit the edit bookstore form by clicking a link on the show' do
            it 'can update an existing bookstore' do

                visit "/bookstores/#{@store.id}"

                click_link 'Update Bookstore'

                expect(current_path).to eq("/bookstores/#{@store.id}/edit")
                
                fill_in 'bookstore[name]', with: 'Store 1'
                click_on 'Submit'

                expect(current_path).to eq("/bookstores/#{@store.id}")
                expect(page).to have_content('Store 1')
            end
        end
    end
end