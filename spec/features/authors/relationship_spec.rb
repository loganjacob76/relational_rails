require 'rails_helper'

RSpec.describe "authors books page", type: :feature do
  it "can see names of all books for author" do
    author = Author.create!(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    book_1 = Book.create!(name: 'Deep Work', fiction: false, number_of_pages: 304, author: author)
    book_2 = Book.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 302, author: author)

    visit "/authors/#{author.id}/books"

    expect(page).to have_content(book_1.name)
    expect(page).to have_content(book_1.fiction)
    expect(page).to have_content(book_1.number_of_pages)

    expect(page).to have_content(book_2.name)
    expect(page).to have_content(book_2.fiction)
    expect(page).to have_content(book_2.number_of_pages)
  end
end
