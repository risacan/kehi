require "rails_helper"

describe Expense, type: :model do
  subject(:expense) { FactoryBot.build(:expense, approved_at: approved_at, rejected_at: rejected_at) }

  describe "#status" do
    subject { expense.status }
    context  "approved_atのみpresentのとき、statusは:approvedを返す" do
      let(:approved_at) { Time.zone.now }
      let(:rejected_at) { nil }
      it { is_expected.to eq :approved}
    end

    context "rejected_atのみpresentのとき、statusは:rejectedを返す" do
      let(:approved_at) { nil }
      let(:rejected_at) { Time.zone.now }
      it { is_expected.to eq :rejected }
    end

    context "approved_atもrejected_atもnilのとき、statusは:pendingを返す" do
      let(:approved_at) { nil }
      let(:rejected_at) { nil }
      it { is_expected.to eq :pending }
    end
  end

  describe "validation" do
    context "approved_atもrejected_atもpresentのとき、invalidになる" do
      let(:approved_at) { Time.zone.now }
      let(:rejected_at) { Time.zone.now }
      it { is_expected.to be_invalid }
    end
  end
end
