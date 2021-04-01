require "rails_helper"

RSpec.describe 'bookstores show page', type: :feature do
  before :each do
    @store = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
  end

  it "has data from each column" do
    visit "/bookstores/#{@store.id}"

    expect(page).to have_content(@store.name)
    expect(page).to have_content(@store.has_coffee_shop)
    expect(page).to have_content(@store.days_open_per_week)
  end

  it "has all links" do
    visit "/bookstores/#{@store.id}"

    expect(page).to have_link(href: '/bookstores')
    expect(page).to have_link(href: '/employees')
    expect(page).to have_link(href: "/bookstores/#{@store.id}/employees")
  end

  it 'can delete delete bookstores' do
    visit "/bookstores/#{@store.id}"

    click_button 'Delete Bookstore'

    expect(current_path).to eq("/bookstores")

    expect(page).not_to have_content(@store)
  end
end
