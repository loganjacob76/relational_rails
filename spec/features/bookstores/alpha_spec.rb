require 'rails_helper'

RSpec.describe 'alphabetized employees page' do
    before :each do
        @store1 = Bookstore.create!(name: 'Barnes N Noble', has_coffee_shop: true, days_open_per_week: 7)

        @john = @store1.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
        @jane = @store1.employees.create!(name: 'Jane Doe', employee_of_the_month: true, age: 19)
    end

    it 'displays employees in alphabetical order' do
        visit "/bookstores/#{@store1.id}/employees"

        click_button 'Sort Alphabetically'

        expect(current_path).to eq("/bookstores/#{@store1.id}/employees")

        expect(@jane.name).to appear_before(@john.name)
    end
end