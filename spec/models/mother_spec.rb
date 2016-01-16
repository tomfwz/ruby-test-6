require 'rails_helper'

RSpec.describe Mother, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female) }
  end  

  context 'valid gender' do
    let(:mother)   { build(:mother) }
    
    context 'valid' do
      it 'is valid gender of a mother' do
        mother.gender = :female
        expect(mother).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid gender of a mother' do
        mother.gender = :male
        expect(mother).to be_invalid
      end
    end
  end

  describe '#say_something' do
    let(:mother)   { create(:mother) }
    let(:tom)      { create(:son, mother: mother) }
    let(:greeting) { "Hello, I am your mother." }

    it 'returns the greeting of mother' do
      expect(tom.mother.say_something).to eq greeting
    end
  end
end
