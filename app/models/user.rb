# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation, :password_digest
  has_secure_password
  has_many :products, dependent: :destroy
  has_one :carts

  before_save {|user| user.email = email.downcase }
  before_save :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates(:name, presence: true, length: {maximum: 50})
  validates(:email, presence: true)

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email

  def current_cart
    if self.cart.empty?
      self.cart.create!
    end
    self.cart
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
