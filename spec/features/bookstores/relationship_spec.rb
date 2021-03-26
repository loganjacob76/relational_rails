require "rails_helper"

RSpec.describe 'parent child index page', type: :feature do
  shop1 = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)

  john = shop1.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
  bobert = shop1.employees.create!(name: 'Bobert Gu', employee_of_the_month: true, age: 27)

  it "has all employees of selected bookstore and their attributes" do
    visit "/bookstores/#{shop1.id}/employees"

    expect(page).to have_content(shop1.name)

    expect(page).to have_content(john.name)
    expect(page).to have_content(bobert.name)

    expect(page).to have_content(john.employee_of_the_month)
    expect(page).to have_content(bobert.employee_of_the_month)

    expect(page).to have_content(john.age)
    expect(page).to have_content(bobert.age)
  end
end
