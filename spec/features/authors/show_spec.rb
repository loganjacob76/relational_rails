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

  it "can see link to all books page" do
    visit "/authors"

    expect(page).to have_link('All Books', href: '/books')
  end

  it "can see link to all authors page" do
    visit "/authors"

    expect(page).to have_link('All Authors', href: '/authors')
  end

  it "can see number of books by author" do
    author_2 = Author.create!(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    book_1 = Book.create!(name: 'Deep Work', fiction: false, number_of_pages: 304, author: author_2)
    book_2 = Book.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 302, author: author_2)

    visit "/authors/#{author_2.id}"
    expect(page).to have_content("Number of Books: #{author_2.books.count}")
  end

  it "can see link to edit author record" do
    author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)

    visit "/authors/#{author_1.id}"
    expect(page).to have_link("Update Author", href: "/authors/#{author_1.id}/edit")
  end
end
