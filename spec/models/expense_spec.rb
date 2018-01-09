require "rails_helper"

describe Expense, type: :model do
  context "#status" do
    example "approved_atのみpresentのとき、statusは:approvedを返す" do
      approved_expense = FactoryBot.create(:expense, approved_at: Time.zone.now, rejected_at: nil)
      expect(approved_expense.status).to eq :approved
    end

    example "rejected_atのみpresentのとき、statusは:rejectedを返す" do
      rejected_expense = FactoryBot.create(:expense, approved_at: nil, rejected_at: Time.zone.now)
      expect(rejected_expense.status).to eq :rejected
    end

    example "approved_atもrejected_atもnilのとき、statusは:pendingを返す" do
      pending_expense = FactoryBot.create(:expense, approved_at: nil, rejected_at: nil)
      expect(pending_expense.status).to eq :pending
    end

    example "approved_atもrejected_atもpresentのとき、invalidになる" do
      error_expense = FactoryBot.build(:expense, approved_at: Time.zone.now, rejected_at: Time.zone.now)
      expect(error_expense).to be_invalid
    end
  end
end
