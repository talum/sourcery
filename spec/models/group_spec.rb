# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  topic       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

require 'rails_helper'

RSpec.describe Group, type: :model do

 describe '#valid?' do
    let(:group) {  FactoryGirl.build( :group, topic: topic)}
    let(:topic){'ice cream'}

    context 'when the group topic is empty' do
      let(:topic) {nil}
      it 'is invalid' do
        expect(group).to_not be_valid
      end
    end
  end

 describe '#add_member' do
    let(:group) {  FactoryGirl.build( :group, topic: topic)}
    let(:topic){'ice cream'}

    context 'when the user is not yet a member of the group' do
      let(:current_user) {FactoryGirl.build(:user)}
      it 'adds the user to the group' do
        group.add_member(current_user)
        expect(group.users).to include(current_user)
      end
    end

    context 'when the user is already a member of the group' do
      let(:current_user){FactoryGirl.build(:user)}
      before do
        group.users << current_user
      end
      it 'does not add the user to the group' do
        group.add_member(current_user)
        expect(group.users).to contain_exactly(current_user)
      end
    end
  end

 describe '#remove_member' do
    let(:group) {  FactoryGirl.build( :group, topic: topic)}
    let(:topic){'ice cream'}

    context 'when the user is not a member of the group' do
      let(:current_user){FactoryGirl.build(:user)}
      it 'does not blow up' do
        expect{group.remove_member(current_user)}.to_not raise_error
      end
    end

    context 'when the user is a member of the group' do
      let(:current_user){FactoryGirl.build(:user)}
      before do
        group.users << current_user
      end
        it 'removes the current user from the group' do
          group.remove_member(current_user)
          expect(group.users).to be_empty
        end
      end
  end

end
