class Conversation < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  has_many :posts
  attr_accessible :title
  
  accepts_nested_attributes_for :posts

  validates_presence_of :title
end
