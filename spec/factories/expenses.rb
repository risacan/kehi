FactoryBot.define do
  factory :expense do
    title { Faker::Commerce.product_name }
    user_id { User.all.to_a.map(&:id).sample || FactoryBot.create(:user).id }
    paid_at { Faker::Date.backward }
    paid_to { Faker::Company.name }
    amount { Faker::Commerce.price * 100 }
    category { Expense.categories.values.sample }
  end
end
