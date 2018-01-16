class Expense < ApplicationRecord
  paginates_per 10
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :paid_at, presence: true
  validates :paid_to, presence: true
  validates :amount, presence: true
  validates :category, presence: true
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
  scope :approved, -> { where.not(approved_at: nil) }
  scope :rejected, -> { where.not(rejected_at: nil).where("confirmed_by != user_id") }
  scope :retrieved, -> { where.not(rejected_at: nil).where("confirmed_by = user_id") }
  scope :pending, -> { where(approved_at: nil, rejected_at: nil)}
  scope :user, -> (user) { where("user_id = ?", user) }
  def self.status(status)
    public_send(status)
  end

  def status
    if approved_at.nil? && rejected_at.nil?
      return :pending
    elsif approved_at.present? && rejected_at.nil?
      return :approved
    elsif approved_at.nil? && rejected_at.present? && (confirmed_by == user_id)
      return :retrieved
    elsif approved_at.nil? && rejected_at.present? && (confirmed_by != user_id)
      return :rejected
    else
      return :error
    end
  end
end
