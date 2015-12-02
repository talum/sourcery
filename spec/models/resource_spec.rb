require 'rails_helper'

RSpec.describe Resource, type: :model do

 describe '#valid?' do
    let(:resource) {  FactoryGirl.build( :resource, title: title, link: link)}
    let(:title){'check this link out'}
    let(:link){'https://google.com'}

    context 'when the title is empty' do
      let(:title) {nil}
      it 'is invalid' do
        expect(resource).to_not be_valid
      end
    end
    
    context 'when the link is empty' do
      let(:link) {nil}
      it 'is invalid' do
        expect(resource).to_not be_valid
      end
    end
    
  end

end
