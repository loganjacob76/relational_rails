require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'attributes' do
    it { should belong_to :bookstore }
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'instance methods' do
    before :each do
      shop1 = Bookstore.create!(name: 'Barnes & Noble', has_coffee_shop: true, days_open_per_week: 7)
      @john = shop1.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
    end

    describe '#employed_at' do
      it 'returns the name of the store the employee works at' do
        expect(@john.employed_at).to eq('Barnes & Noble')
      end
    end
  end
end
