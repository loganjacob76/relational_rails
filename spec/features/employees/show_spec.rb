require "rails_helper"

RSpec.describe 'employees show page', type: :feature do
  before :each do
    store1 = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
    @john = store1.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
  end

  it "has the attributes of the employee" do
    visit "/employees/#{@john.id}"

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@john.employee_of_the_month)
    expect(page).to have_content(@john.age)
    expect(page).to have_content(@john.employed_at)
  end

  it "has all links" do
    visit "/employees/#{@john.id}"

    expect(page).to have_link(href: '/bookstores')
    expect(page).to have_link(href: '/employees')
  end

  it 'can delete delete employees' do
    visit "/employees/#{@john.id}"

    click_button 'Delete Employee'

    expect(current_path).to eq("/employees")

    expect(page).not_to have_content(@john)
  end
end
