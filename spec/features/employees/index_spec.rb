require "rails_helper"

RSpec.describe 'employees index page', type: :feature do
  before :each do
    store1 = Bookstore.create!(name: 'Barnes N Noble', has_coffee_shop: true, days_open_per_week: 7)
    store2 = Bookstore.create!(name: 'Books N Stuff', has_coffee_shop: false, days_open_per_week: 6)
    
    @john = store1.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
    @jane = store2.employees.create!(name: 'Jane Doe', employee_of_the_month: true, age: 19)
  end
  
  it "displays employees and their attributes" do
    visit '/employees'

    expect(page).not_to have_content(@john.name)
    expect(page).to have_content(@jane.name)

    expect(page).not_to have_content("Employee of the Month: #{@john.employee_of_the_month}")
    expect(page).to have_content("Employee of the Month: #{@jane.employee_of_the_month}")

    expect(page).not_to have_content("Age: #{@john.age}")
    expect(page).to have_content("Age: #{@jane.age}")

    expect(page).not_to have_content(@john.employed_at)
    expect(page).to have_content(@jane.employed_at)
  end

  it "has all links" do
    visit '/employees'

    expect(page).to have_link(href: '/bookstores')
  end
end
