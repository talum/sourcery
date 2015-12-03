# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Teacher, type: :model do

  describe 'Associations' do
    it 'belongs to a user' do 
      expect(@teacher.user).to eq(@maddy)
    end

    it 'has many groups through user' do 
      expect(@teacher.groups).to eq(@maddy.groups)
      expect(@teacher.groups).to include(@bio)
    end

  end

end

