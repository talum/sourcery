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

end
