class Post < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  belongs_to :parent, :foreign_key => "post_id", :class_name => "Post"
  has_many :children, :foreign_key => "post_id", :class_name => "Post"
  attr_accessible :content

  validates_presence_of :content
end
