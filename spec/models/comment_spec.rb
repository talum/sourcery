# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  resource_id :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe '#valid?' do
    let(:comment) {  FactoryGirl.build( :comment, content: content)}
    let(:content){'hellloo'}

    context 'when the comment is empty' do
      let(:content) {nil}
      it 'is invalid' do
        expect(comment).to_not be_valid
      end
    end
  end

  describe 'Associations' do
    it 'belongs to a resource' do 
      expect(@comment.resource).to eq(@darwin)
    end

    it 'belongs to a user' do 
      expect(@comment.user).to eq(@maddy)
    end

  end

end
