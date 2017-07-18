class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, class_name: "Article"
  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: { minimum: 6, maximum: 50 }

private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
