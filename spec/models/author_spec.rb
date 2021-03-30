require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it { should have_many :books}
  end

  # describe 'validations' do
  #   it 'shows authors in descending order of when they were created' do
  #     author_1 = Author.create(name: 'Stephen King', best_selling_author: true, year_first_published: 1974, created_at: '2021-03-25 23:18:17.720146')
  #     author_2 = Author.create(name: 'Cal Newport', best_selling_author: true, year_first_published: 2005, created_at: '2021-03-28 23:18:17.720146')
  #
  #     expect(author_2).to appear_before(author_1)
  #   end
  # end
end
