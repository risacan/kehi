FactoryBot.define do
  factory :expense do
    title { Faker::Commerce.product_name }
    user_id { User.all.to_a.map(&:id).sample || FactoryBot.create(:user).id }
    paid_at { Faker::Date.backward }
    paid_to { Faker::Company.name }
    amount { Faker::Commerce.price * 100 }
    category { Expense.categories.values.sample }
    created_at { Faker::Date.backward(60) }
    approved_at { [Time.zone.now, nil].sample }
    rejected_at nil
    confirmed_by nil
    before(:create) do |m, evaluator|
      if m.approved_at.nil?
        m.rejected_at = [Time.zone.now, nil].sample
      end

      if m.approved_at.present? || m.rejected_at.present?
        m.confirmed_by = User.all.to_a.map(&:id).sample
      end
    end
  end
end
