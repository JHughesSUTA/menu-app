require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'testing associations' do
    it { should belong_to(:category) }
    # it { should have_many(:orders) }
    it { should have_many(:carted_items) }
  end

  describe 'testing validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:category_id) }
  end

  it "is valid with a name, description, price, category ID, lunch and dinner value" do
    category = create(:category)
    item = create(:item, category_id: category.id)
      # name: "Good Food",
      # description: "Melts in your mouth, not in your hand",
      # price: 5.99,
      # category_id: category.id,
      # lunch: true,
      # dinner: false)
    expect(item).to be_valid
  end

  xit "is invalid without a name" do
    category = create(:category)
    item = create(:item, name: nil, category_id: category.id)
      # name: nil,
      # description: "Melts in your mouth, not in your hand",
      # price: 5.99,
      # category_id: 1,
      # lunch: true,
      # dinner: false)
    expect(item).not_to be_valid
  end

  it "is invalid without a description" do
    item  = Item.new(
      name: "Good Food",
      description: nil,
      price: 5.99,
      category_id: 1,
      lunch: true,
      dinner: false)
    expect(item).not_to be_valid
  end

  it "is invalid without a price" do
    item  = Item.new(
      name: "Good Food",
      description: "Melts in your mouth, not in your hand",
      price: nil,
      category_id: 1,
      lunch: true,
      dinner: false)
    expect(item).not_to be_valid
  end

  it "is invalid without a category ID" do
    item = Item.new(
      name: nil,
      description: "Melts in your mouth, not in your hand",
      price: 5.99,
      category_id: nil,
      lunch: true,
      dinner: false)
    expect(item).not_to be_valid
  end

  it "is invalid without a lunch value" do
    item = Item.new(
      name: nil,
      description: "Melts in your mouth, not in your hand",
      price: 5.99,
      category_id: 1,
      lunch: nil,
      dinner: false)
    expect(item).not_to be_valid
  end

  it "is invalid without a dinner value" do
    item = Item.new(
      name: nil,
      description: "Melts in your mouth, not in your hand",
      price: 5.99,
      category_id: 1,
      lunch: true,
      dinner: nil)
    expect(item).not_to be_valid
  end
end