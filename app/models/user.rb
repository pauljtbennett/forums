class User < ActiveRecord::Base
  has_many :forums
  has_many :conversations
  has_many :posts
  attr_accessible :email, :password, :password_confirmation
  
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  
  validates_uniqueness_of :email
end
