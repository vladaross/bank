class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates :kind, presence: true
  validates :sum, presence: true
end
