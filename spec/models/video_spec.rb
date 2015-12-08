# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  link         :string
#  title        :string
#  published_at :datetime
#  likes        :integer
#  dislikes     :integer
#  uid          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  group_id     :integer
#  user_id      :integer
#

require 'rails_helper'

RSpec.describe Video, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
