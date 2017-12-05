require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'testing associations' do
    # has secure password?
    it { should have_many(:orders) }
    it { should have_many(:carted_items) }
  end

  describe 'testing validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end