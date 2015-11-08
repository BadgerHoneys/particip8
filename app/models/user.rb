class User < ActiveRecord::Base
  rolify
  before_save :encrypt_password

  has_many :ratings
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

  def delete_role(role_symbol,target=nil)
    UsersRoles.delete_role self,role_symbol,target
  end

  def user_roles(role_name)
    student_roles = []
    roles.each do |role|
      student_roles.push role if role.name == role_name
    end
    student_roles
  end
end

class UsersRoles < ActiveRecord::Base

  def self.delete_role(subject,role_symbol, obj=nil)
    res_name = obj.nil? ? nil : obj.class.name
    res_id   = obj.id rescue nil
    role_row = subject.roles.where(name: role_symbol.to_s, resource_type: res_name , resource_id: res_id).first
    if  role_row.nil?
      raise "cannot delete nonexisting role on subject"
    end
    role_id = role_row.id
    self.delete_all(user_id: subject.id,role_id: role_id)
  end

  private_class_method :new
end