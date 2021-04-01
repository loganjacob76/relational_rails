require 'rails_helper'

RSpec.describe "authors books page", type: :feature do
  before :each do
    @author = Author.create!(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
    @book_1 = Book.create!(name: 'Deep Work', fiction: false, number_of_pages: 200, author: @author)
    @book_2 = Book.create!(name: 'Digital Minimalism', fiction: false, number_of_pages: 400, author: @author)
    @book_3 = Book.create!(name: 'So Good They Cant Ignore You', fiction: false, number_of_pages: 225, author: @author)
  end
  it "can see names of all books for author" do
    visit "/authors/#{@author.id}/books"

    expect(page).to have_content(@book_1.name)
    expect(page).to have_content(@book_1.fiction)
    expect(page).to have_content(@book_1.number_of_pages)

    expect(page).to have_content(@book_2.name)
    expect(page).to have_content(@book_2.fiction)
    expect(page).to have_content(@book_2.number_of_pages)
  end

  it "can see link to all books page" do
    visit "/authors"

    expect(page).to have_link('All Books', href: '/books')
  end

  it "can see link to all authors page" do
    visit "/authors"

    expect(page).to have_link('All Authors', href: '/authors')
  end

  it "can see link to add new book" do
    author = Author.create!(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)

    visit "/authors/#{@author.id}/books"

    expect(page).to have_link('Create Book', href: "/authors/#{@author.id}/books/new")
  end

  it "can show only books that have more that specified number of pages" do
    visit "/authors/#{@author.id}/books"


    fill_in 'Search by Page Number Limit', with: '300'
    click_on 'Search'

    expect(current_path).to eq("/authors/#{@author.id}/books")
    expect(page).to have_content('Digital Minimalism')
    expect(page).not_to have_content('Deep Work')
    expect(page).not_to have_content('So Good They Cant Ignore You')
  end
end
