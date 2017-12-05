FactoryBot.define do 
  factory :user do
    name 'james'
    email 'email@email.com'
    password_digest 'password'
    admin true
  end
end