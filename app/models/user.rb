class User < ActiveRecord::Base
  before_create :encrypt_password
  
  
  has_many :attendances, through: :current_days

  def to_json(options={})
    options[:except] ||= [:password, :password_reset_token, :salt]
    super(options)
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def generate_password_reset_token!
    #generate reset token here
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
  end

	def generate_auth_token
	  payload = { user_id: self.id}
	  AuthToken.encode(payload)
  end

  def match_password(login_password="")
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end

end
