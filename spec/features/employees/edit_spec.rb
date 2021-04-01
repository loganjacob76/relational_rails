require 'rails_helper'

RSpec.describe 'edit employee' do
    describe 'as a visitor' do
        describe 'when i visit the edit employee form by clicking a link on the show page' do
            before :each do
                store = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
                @john = store.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
            end

            it 'can update an existing employee' do
                visit "/employees/#{@john.id}"

                click_link 'Update Employee'

                expect(current_path).to eq("/employees/#{@john.id}/edit")

                fill_in :name, with: 'Jane Doe'
                click_on 'Update Employee'

                expect(current_path).to eq("/employees/#{@john.id}")
                expect(page).to have_content('Jane Doe')
            end
        end
    end
end