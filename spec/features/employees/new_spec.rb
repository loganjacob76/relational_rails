require 'rails_helper'

RSpec.describe 'new employee' do
    describe 'as a visitor' do
        describe 'when i visit the new employee form by clicking a link in the the bookstore/employees index' do
            before :each do
                @store = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
            end
            
            it 'can create a new employee' do
                visit "/bookstores/#{@store.id}/employees"

                click_link 'Create Employee'

                expect(current_path).to eq("/bookstores/#{@store.id}/employees/new")

                fill_in 'employee[name]', with: 'Nombre'
                fill_in 'employee[age]', with: 16
                click_on 'Create Employee'

                expect(current_path).to eq("/bookstores/#{@store.id}/employees")
                expect(page).to have_content('Nombre')
                expect(page).to have_content(16)
            end
        end
    end
end