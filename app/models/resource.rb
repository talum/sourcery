class Resource < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :favorites
end
