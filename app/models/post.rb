class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user

  validates :content, :user, presence: true
  validates :content, length: { in: 3..100 }

end
