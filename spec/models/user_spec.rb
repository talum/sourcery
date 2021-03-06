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

require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#firstname' do
    let(:user) {  FactoryGirl.build( :user, gmail_name: gmail_name)}
    let(:gmail_name){'Jess Parker'}

    context 'user has a gmail_name' do
      it 'returns the correct first name' do
        expect(user.firstname).to eq 'Jess'
      end
    end
  end

  describe '#lastname' do
    let(:user) {  FactoryGirl.build( :user, gmail_name: gmail_name)}
    let(:gmail_name){'Jess Parker'}

    context 'when user has a gmail_name' do
      it 'returns the correct last name' do
        expect(user.lastname).to eq 'Parker'
      end
    end
  end

   describe '#resources_by_group' do
    let(:user) {  FactoryGirl.build( :user, gmail_name: gmail_name)}
    let(:gmail_name){'Jess Parker'}

    context 'when user has no groups or resources' do
      it 'return an empty hash' do
        expect(user.resources_by_group).to eq({})
      end
    end

    let(:user) {  FactoryGirl.build( :user, gmail_name: 
      gmail_name)}
    let(:group1){ FactoryGirl.build( :group, topic: 'construction')}
    let(:resource1){ FactoryGirl.build( :resource, title: 'tools', link: 'www.tooltime.com')}

    context 'when user has one group' do
      it 'return a hash with one key/value pair' do
        user.groups << group1
        group1.resources << resource1
        group1.save
        expect(user.resources_by_group).to eq({group1 => group1.resources})
      end
    end

    let(:group2){ FactoryGirl.build( :group, topic: 'knitting')}
    let(:resource2){ FactoryGirl.build( :resource, title: 'yarn work', link: 'www.itsseweasy.com')}

    context 'when user has more than one group' do
      it 'return a hash with multiple key/value pairs' do
        user.groups << [group1, group2]
        group1.resources << resource1
        group2.resources << resource2
        group1.save
        group2.save
        expect(user.resources_by_group).to eq({group1 => group1.resources, group2 => group2.resources})
      end
    end

  end


  describe '#fellow_group_member_ids' do
    let(:jim){FactoryGirl.create(:user, gmail_name: "Jim")}
    let(:maddy){FactoryGirl.create(:user, gmail_name: "Maddy")}
    let(:meredith){FactoryGirl.create(:user, gmail_name: "Meredith")}
    let(:tracy){FactoryGirl.create(:user, gmail_name: "Tracy")}
    let(:group_one){FactoryGirl.create(:group, topic: "dinos")}
    let(:group_two){FactoryGirl.create(:group, topic: "tacos")}
    let(:group_three){FactoryGirl.create(:group, topic: "parachuting")}
    let(:group_four){FactoryGirl.create(:group, topic: "paragliding")}

    context 'when users Jim and Maddy have joined group 1' do
      before do 
        group_one.users << jim 
        group_one.users << maddy
      end
      it 'returns the ids of all other members of groups of which Jim is a member' do
        expect(jim.fellow_group_member_ids).to include(jim.id, maddy.id)
      end
    end

   context 'when user Jim has joined groups 1 and 2, and Maddy is in group 1, Meredith in group 2' do
    before do 
      group_one.users << jim 
      group_one.users << maddy
      group_two.users << jim 
      group_two.users << meredith
      group_three.users << tracy 
    end
    it 'returns the ids of all other members of groups of which Jim is a member' do
      expect(jim.fellow_group_member_ids).to include(jim.id, maddy.id, meredith.id)
      expect(jim.fellow_group_member_ids).to_not include(tracy.id)
    end
  end
  end

end
