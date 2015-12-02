class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource

  validates :content, presence: true
  
end
