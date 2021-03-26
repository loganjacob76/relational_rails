require 'rails_helper'

RSpec.describe "books index page", type: :feature do
  it "can see names of all books" do
    author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    book_1 = Book.create!(name: 'Deep Work', fiction: false, number_of_pages: 304, author: author_1)
    book_2 = Book.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 302, author: author_2)

    visit "/books"

    expect(page).to have_content(book_1.name)
    expect(page).to have_content(book_1.fiction)
    expect(page).to have_content(book_1.number_of_pages)
    expect(page).to have_content(book_1.author.name)
    expect(page).to have_content(book_2.name)
  end
end
