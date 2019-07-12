class User < ApplicationRecord
  has_secure_password
  # validates_presence_of :first_name :last_name :email :password_digest :address :city :state :zip_code
  has_many :profiles, dependent: :destroy
  has_many :reviews
  has_and_belongs_to_many :lessons
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end
end
