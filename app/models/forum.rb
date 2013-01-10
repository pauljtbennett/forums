class Forum < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  has_many :conversations
  attr_accessible :name
end
