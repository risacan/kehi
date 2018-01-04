FactoryBot.define do
  factory :user_admin, class: User do
    name "risacan"
    email "admin@example.com"
    password "password"
    company_id { Company.all.to_a.map(&:id).first || FactoryBot.create(:company).id }
    admin true
  end
end
