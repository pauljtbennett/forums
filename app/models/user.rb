class User < ActiveRecord::Base
  has_many :forums
  has_many :conversations
  has_many :posts
  attr_accessible :username, :email, :password, :password_confirmation
  
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_presence_of :email
  
  validates_uniqueness_of :username
  validates_uniqueness_of :email

	before_create { generate_token(:auth_token) }

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end  
end
