class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :comments, dependent: :destroy
  attr_accessible :text, :title
  validates :title, presence:true, length:{minimum:5}
  validates :text, presence:true, length:{minimum:5}
end
