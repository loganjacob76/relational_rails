require 'rails_helper'

RSpec.describe "books show page", type: :feature do
  before :each do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    @author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    @book_1 = Book.create!(name: 'Deep Work', fiction: false, number_of_pages: 304, author: @author_1)
    @book_2 = Book.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 302, author: @author_2)
  end

  it "can see info of book with specified id" do

    visit "/books/#{@book_1.id}"
    expect(page).to have_content(@book_1.name)
    expect(page).to have_content(@book_1.fiction)
    expect(page).to have_content(@book_1.number_of_pages)
    expect(page).to have_content(@book_1.author.name)
  end

  it "can see link to all books page" do
    visit "/authors"

    expect(page).to have_link('All Books', href: '/books')
  end

  it "can see link to all authors page" do
    visit "/authors"

    expect(page).to have_link('All Authors', href: '/authors')
  end

  it 'can delete a book' do
    visit "/books/#{@book_1.id}"

    click_button 'Delete Book'

    expect(current_path).to eq('/books')
    expect(page).to_not have_content(@book_1.name)
    expect(page).to_not have_button('Delete')
  end
end
