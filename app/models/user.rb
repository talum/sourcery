# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  firstname        :string
#  lastname         :string
#  email            :string
#  dob              :datetime
#  gender           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  provider         :string
#  uid              :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  gmail_name       :string
#  sign_in_count    :integer          default(0)
#  image            :string
#

class User < ActiveRecord::Base
  has_many :resources
  has_many :user_groups
  has_many :comments
  has_many :favorites
  has_many :groups, through: :user_groups
  has_one :student
  has_one :teacher

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.gmail_name = auth.info.name
      user.email = auth.info.email
      user.gender = auth.extra.raw_info.gender
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.most_favorites
    self.joins(:favorites).select("users.*, COUNT(favorites.id) as favorite_count").group("users.id").order("favorite_count DESC").limit(10)
  end

  def self.most_favorites_with_count
    self.most_favorites.each_with_object([]) do |resource, array|
      array.push(title: resource.title, count: resource.favorites.count)
    end
  end

  def firstname
    self.gmail_name.split(" ").first
  end

  def lastname
    self.gmail_name.split(" ").last
  end

  def resources_by_group
    groups.each_with_object({}) do |group, hash|
      hash[group] = group.resources.where(user_id: self.id)
    end
  end

  def favorites_by_group
    groups.each_with_object({}) do |group, hash|
      hash[group] = group.favorites.where(user_id: self.id)
    end
  end

  def fellow_group_member_ids
    UserGroup.where(group_id: self.group_ids).pluck(:user_id).uniq
  end

end
