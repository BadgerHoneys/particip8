class User < ActiveRecord::Base
  before_save :encrypt_password
  
  has_many :attendances, through: :current_days

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

	def generate_auth_token
	  payload = { user_id: self.id }
	  AuthToken.encode(payload)
  end

  def match_password(login_password="")
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end

end
