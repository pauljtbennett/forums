class Site < ActiveRecord::Base
  has_many :forums
  attr_accessible :name, :url
end
