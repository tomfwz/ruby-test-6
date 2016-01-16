require 'rails_helper'

RSpec.describe Son, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end  

  context 'valid gender' do
    let(:son)   { build(:son) }
    
    context 'valid' do
      it 'is valid gender of a son' do
        son.gender = :male
        expect(son).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid gender of a son' do
        son.gender = :female
        expect(son).to be_invalid
      end
    end
  end
end
