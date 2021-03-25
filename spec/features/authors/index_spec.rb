require 'rails_helper'

RSpec.describe "authors index page", type: :feature do
  it "can see names of all authors" do
    author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)

    visit "/authors"

    expect(page).to have_content(author_1.name)
    expect(page).to have_content(author_2.name)
  end
end
