class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  validates :email, uniqueness: true
end
