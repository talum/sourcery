# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'Associations' do
    it 'belongs to a user' do 
      expect(@student.user).to eq(@tracy)
    end

    it 'has many groups through user' do 
      expect(@student.groups).to eq(@tracy.groups)
      expect(@student.groups).to include(@bio)
    end

  end

end
