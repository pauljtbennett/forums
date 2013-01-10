class Conversation < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  has_many :posts
  attr_accessible :title
end
