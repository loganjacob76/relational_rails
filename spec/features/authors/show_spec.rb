require 'rails_helper'

RSpec.describe "author show page", type: :feature do
  before :each do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
    @author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
  end
  it "can see info of author with specified id" do

    visit "/authors/#{@author_1.id}"
    expect(page).to have_content(@author_1.name)
    expect(page).to have_content(@author_1.best_selling_author)
    expect(page).to have_content(@author_1.year_first_published)
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
    visit "/authors/#{@author_2.id}"
    expect(page).to have_content("Number of Books: #{@author_2.books.count}")
  end

  it "can see link to edit author record" do
    @author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)

    visit "/authors/#{@author_1.id}"
    expect(page).to have_link("Update Author", href: "/authors/#{@author_1.id}/edit")
  end

  it 'can delete an author' do
    @author_1 = Author.create(name: "Jane Austen", best_selling_author: true, year_first_published: 1811)

    visit "/authors/#{@author_1.id}"

    click_button 'Delete Author'

    expect(current_path).to eq('/authors')
    expect(page).to_not have_content(@author_1.name)
    expect(page).to_not have_button('Delete')
  end
end
