require 'rails_helper'

RSpec.describe CartedItem, type: :model do
  describe 'testing associations' do
    it { should belong_to(:user) }
    it { should belong_to(:item) }
    it { should belong_to(:order) }
  end

  describe 'testing validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).only_integer }
    it {should validate_numericality_of(:quantity).is_less_than(11) }
  end
end