FactoryBot.define do 
  factory :order do
    # user_id
    subtotal 9.24
    tax 0.74
    total 9.98
    # do i ned to test whether tax and total are accurate?
  end
end