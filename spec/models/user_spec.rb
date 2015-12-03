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

end
