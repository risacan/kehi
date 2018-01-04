require "factory_bot"
Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f }

FactoryBot.create_list(:company, 5)
FactoryBot.create_list(:user, 50)
FactoryBot.create(:user_admin)
FactoryBot.create_list(:expense, 100)
