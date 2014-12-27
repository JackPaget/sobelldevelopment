class Staff < ActiveRecord::Base

	include BCrypt
  	before_save :encrypt_password

  	validates_confirmation_of :password , :message => "Passwords donot match."
  	validates_presence_of :password, :message => "Please Enter a Password"
  	validates_presence_of :email,:message=>"Email ID Field cannot be blank"
 	validates_uniqueness_of :email,:message => "Sorry this Email ID is already registered."
  	validates_presence_of :first_name , :message => "First Name Field cannot be blank"
  	validates_presence_of :last_name, :message => "Last Name Field cannot be blank"
  	validates_presence_of :role, :message => "Role must be defined"
  	validates_presence_of :office
  	validates_presence_of :group
  	validates_presence_of :job_title

  	def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  	end

	def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


end
