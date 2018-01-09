class Expense < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :approved_at, absence: true,
    if: Proc.new { |a| a.rejected_at.present? }
  validates :rejected_at, absence: true,
    if: Proc.new { |a| a.approved_at.present? }
  enum category: {
    category0: 0,
    category1: 1,
    category2: 2,
    category3: 3,
    category4: 4,
    category5: 5,
    category6: 6,
    category7: 7,
    category8: 8,
    category9: 9,
    category10: 10
  }

  def status
    if approved_at.nil? && rejected_at.nil?
      return :pending
    elsif approved_at.present? && rejected_at.nil?
      return :approved
    elsif approved_at.nil? && rejected_at.present?
      return :rejected
    else
      return :error
    end
  end
end
