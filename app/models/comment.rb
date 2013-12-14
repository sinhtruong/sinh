class Comment <ActiveRecord::Base
 	belongs_to :user
 	belongs_to :post
 	attr_accessible :body ,:user_id
 	default_scope order('created_at DESC')
  validates :body, presence:true, length:{minimum:5}
end