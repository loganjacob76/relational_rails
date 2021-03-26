require 'rails_helper'

RSpec.describe "author show page", type: :feature do
  it "can see info of author with specified id" do
    author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)

    visit "/authors/#{author_1.id}"
    expect(page).to have_content(author_1.name)
    expect(page).to have_content(author_1.best_selling_author)
    expect(page).to have_content(author_1.year_first_published)
  end
end
