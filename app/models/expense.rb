class Expense < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
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
end
