require 'rails_helper'

RSpec.describe CartedItem, type: :model do # why CartedItem and not Carted_item?
  describe 'testing associations' do
    it { should belong_to(:user) }
    it { should belong_to(:item) }
    # it { should belong_to(:order) }  -- not sure since it's optional
  end

  describe 'testing validations' do
    it { should validate_presence_of(:quantity) }
    # it should validate numericality of quantity
  end
end