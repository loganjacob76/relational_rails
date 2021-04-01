require 'rails_helper'

RSpec.describe Bookstore, type: :model do
  before :each do
    @store1 = Bookstore.create!(name: 'Barnes N Noble', has_coffee_shop: true, days_open_per_week: 7)

    @john = @store1.employees.create!(name: 'John Doe', employee_of_the_month: false, age: 16)
    @jane = @store1.employees.create!(name: 'Jane Doe', employee_of_the_month: true, age: 19)
  end

  describe 'attributes' do
    it { should have_many :employees}
    it { should validate_presence_of :name }
    it { should validate_presence_of :days_open_per_week }
  end

  describe 'instance methods' do
    describe '#alphabetized_employees' do
      it 'sorts employees alphabetically' do
        expect(@store1.alphabetized_employees).to eq([@jane, @john])
      end
    end
  end
end
