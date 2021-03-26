require "rails_helper"

RSpec.describe 'bookstores show page', type: :feature do
  shop1 = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)

  it "has data from each column" do
    visit "/bookstores/#{shop1.id}"

    expect(page).to have_content(shop1.name)
    expect(page).to have_content(shop1.has_coffee_shop)
    expect(page).to have_content(shop1.days_open_per_week)
  end

  it "has all links" do
    visit "/bookstores/#{shop1.id}"

    expect(page).to have_link(href: '/bookstores')
    expect(page).to have_link(href: '/employees')
    expect(page).to have_link(href: "/bookstores/#{shop1.id}/employees")
  end
end
