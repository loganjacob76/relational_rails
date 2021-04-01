require 'rails_helper'

RSpec.describe "authors index page", type: :feature do
  before :each do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    @author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
  end
  it "can see names of all authors" do
    visit "/authors"

    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_2.name)
  end

  it "can see date and time when author was created" do
    visit "/authors"

    expect(page).to have_content(@author_1.created_at)
    expect(page).to have_content(@author_2.created_at)
  end

  it "can see link to all books page" do
    visit "/authors"

    expect(page).to have_link('All Books', href: '/books')
  end

  it "can see link to all authors page" do
    visit "/authors"

    expect(page).to have_link('All Authors', href: '/authors')
  end

  it "can see link to all books by author page" do
    visit "/authors/#{@author_1.id}"

    expect(page).to have_link("All Books by #{@author_1.name}", href: "/authors/#{@author_1.id}/books")
  end

  it "can see link to create a new author record" do
    visit "/authors"

    expect(page).to have_link("Add New Author", href: "/authors/new")
  end

  it 'shows authors in descending order of when they were created' do
    visit "/authors"

    expect(@author_2.name).to appear_before(@author_1.name)
  end
end
