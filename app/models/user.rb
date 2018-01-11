class User < ApplicationRecord
  belongs_to :company, optional: true
  has_many :expenses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_associated :company
  validates :name, presence: true
  include Gravtastic
    gravtastic
end
