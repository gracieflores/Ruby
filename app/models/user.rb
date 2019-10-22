class User < ApplicationRecord
  
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :post_likes, through: :likes, source: :posts
  
  has_secure_password
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, :email, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 8 }, on: :create
  validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  before_validation :normalize_email, on: :create

  private
  def normalize_email
    self.email = email.downcase
  end

end
