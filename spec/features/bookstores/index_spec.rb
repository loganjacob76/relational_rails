require "rails_helper"

RSpec.describe 'bookstores index page', type: :feature do
  store1 = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
  store2 = Bookstore.create!(name: 'Books N Stuff', has_coffee_shop: false, days_open_per_week: 6)

  it "has all names of bookstores" do
    visit '/bookstores'

    expect(page).to have_content(store1.name)
    expect(page).to have_content(store2.name)
  end
end
