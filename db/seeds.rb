require "factory_bot"

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
  end

  factory :user do
    name { Faker::Pokemon.name }
    email { Faker::Internet.unique.email }
    password "password"
    company_id { Company.all.to_a.map(&:id).sample }
    admin false
  end

  factory :user_admin, class: User do
    name "risacan"
    email "admin@example.com"
    password "password"
    company_id 1
    admin true
  end

  factory :expense do
    title { Faker::Commerce.product_name }
    user_id { User.all.to_a.map(&:id).sample }
    category { Expense.categories.values.sample }
  end
end

FactoryBot.create_list(:company, 5)
FactoryBot.create_list(:user, 50)
FactoryBot.create(:user_admin)
FactoryBot.create_list(:expense, 100)
