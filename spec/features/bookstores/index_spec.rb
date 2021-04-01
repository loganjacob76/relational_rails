require "rails_helper"

RSpec.describe 'bookstores index page', type: :feature do
  before :each do
    @store1 = Bookstore.create!(name: 'Barnes N Noble', has_coffee_shop: true, days_open_per_week: 7)
    @store2 = Bookstore.create!(name: 'Books N Stuff', has_coffee_shop: false, days_open_per_week: 6)
  end

  it "has all names and created at timestamps of bookstores" do
    visit '/bookstores'

    expect(page).to have_content(@store1.name)
    expect(page).to have_content(@store2.name)

    expect(page).to have_content(@store1.created_at)
    expect(page).to have_content(@store2.created_at)
  end

  it 'orders bookstores by created_by in descending order' do
    visit '/bookstores'

    expect(@store2.name).to appear_before(@store1.name)
  end

  it "has all links" do
    visit '/bookstores'

    expect(page).to have_link(href: '/employees')
  end

  it 'can delete delete bookstores' do
    visit "/bookstores"

    first(:button, 'Delete Bookstore').click

    expect(current_path).to eq("/bookstores")

    expect(page).not_to have_content(@store1)
  end
end
