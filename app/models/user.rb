class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :accounts
  has_many :transactions, through: :accounts
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
