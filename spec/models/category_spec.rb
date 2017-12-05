require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'testing associations' do
    it { should have_many(:items) }
  end

  describe 'testing validations' do
    it { should validate_presence_of(:name) }
  end
end