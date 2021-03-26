require "rails_helper"

RSpec.describe 'bookstores show page', type: :feature do
  shop1 = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
  shop2 = Bookstore.create!(name: 'Books N Stuff', has_coffee_shop: false, days_open_per_week: 6)

  it "has data from each column" do
    visit "/bookstores/#{shop1.id}"

    expect(page).to have_content(shop1.name)
    expect(page).to have_content(shop1.has_coffee_shop)
    expect(page).to have_content(shop1.days_open_per_week)
    expect(page).to have_content(shop1.created_at)
    expect(page).to have_content(shop1.updated_at)
  end
end
