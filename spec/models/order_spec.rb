require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'testing associations' do
    it { should belong_to(:user) }
    # it { should belong_to(:item) }
    it { should have_many(:carted_items) }
    # it { should have many items through carted_items }
  end

  describe 'testing validations' do
  end
end