FactoryBot.define do
  factory :expense do
    title { Faker::Commerce.product_name }
    user_id { User.all.to_a.map(&:id).sample || FactoryBot.create(:user).id }
    category { Expense.categories.values.sample }
  end
end
