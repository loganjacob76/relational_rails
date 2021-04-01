require 'rails_helper'

RSpec.describe "books index page", type: :feature do
  before :each do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    @book_1 = Book.create!(name: 'The Shining', fiction: true, number_of_pages: 447, author: @author_1)
    @book_2 = Book.create!(name: 'It', fiction: true, number_of_pages: 1000, author: @author_1)
  end
  it "can see names of all books" do

    visit "/books"

    expect(page).to have_content(@book_1.name)
    expect(page).to have_content(@book_1.fiction)
    expect(page).to have_content(@book_1.number_of_pages)
    expect(page).to have_content(@book_1.author.name)
    expect(page).to have_content(@book_2.name)
  end

  it "can see link to all books page" do
    visit "/books"

    expect(page).to have_link('All Books', href: '/books')
  end

  it "can see link to all authors page" do
    visit "/books"

    expect(page).to have_link('All Authors', href: '/authors')
  end

  it "can see link to edit book page" do
    visit "/books"

    expect(page).to have_link('Edit Book', href: "/books/#{@book_1.id}/edit")
    expect(page).to have_link('Edit Book', href: "/books/#{@book_2.id}/edit")
  end

  it 'can delete a book' do
    visit '/books'

    first(:button, 'Delete Book').click

    expect(current_path).to eq('/books')
    expect(page).to_not have_content(@book_1.name)
  end
end
