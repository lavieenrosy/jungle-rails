class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :password_digest, length: { minimum: 5 }
  validates :password_digest, :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
