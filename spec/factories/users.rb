FactoryBot.define do
  factory :user do
    name { Faker::Pokemon.name }
    email { Faker::Internet.unique.email }
    password "password"
    company_id { Company.all.to_a.map(&:id).sample || FactoryBot.create(:company).id }
    admin false
  end
end
