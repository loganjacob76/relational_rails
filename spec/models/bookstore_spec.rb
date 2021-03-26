require 'rails_helper'

RSpec.describe Bookstore, type: :model do
  describe 'relationships' do
    it { should have_many :employees}
  end
end
