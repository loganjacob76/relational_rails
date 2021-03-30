require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it { should have_many :books}
  end

  # describe 'class methods' do
  #   it 'shows authors in descending order of when they were created' do
  #     author_1 = Author.create(name: "Stephen King", best_selling_author: true, year_first_published: 1974)
  #     author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005)
  #
  #     expect(author_2).to appear_before(author_1)
  #   end
  # end
end
