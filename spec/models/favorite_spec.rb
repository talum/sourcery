# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  resource_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Favorite, type: :model do

  describe 'Associations' do
    it 'belongs to a resource' do 
      expect(@favorite.resource).to eq(@darwin)
    end

    it 'belongs to a user' do 
      expect(@favorite.user).to eq(@maddy)
    end

  end

end
