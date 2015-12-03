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
    binding.pry
    groups.each_with_object({}) do |group, hash|
      binding.pry
      hash[group] = group.resources.where(user.gmail_name => self.gmail_name)
    end
  end

end
