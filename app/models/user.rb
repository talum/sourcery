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
#

class User < ActiveRecord::Base
  has_many :resources
  has_many :groups

  has_one :student
  has_one :teacher

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.gmail_name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def firstname
    self.gmail_name.split(" ").first
  end

  def lastname
    self.gmail_name.split(" ").last
  end

  def groups
    self.teacher ? groups = self.teacher.groups : groups = self.student.groups
  end

  def resources_by_group
    groups.each_with_object({}) do |group, hash|
      hash[group.topic] = group.resources.where(user_id: self.id)
    end
  end

end
