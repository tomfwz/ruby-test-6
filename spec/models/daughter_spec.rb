require 'rails_helper'

RSpec.describe Daughter, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female) }
  end  

  context 'valid gender' do
    let(:daughter)   { build(:daughter) }
    
    context 'valid' do
      it 'is valid gender of a daughter' do
        daughter.gender = :female
        expect(daughter).to be_valid
      end
    end

    context 'invalid' do
      it 'is invalid gender of a daughter' do
        daughter.gender = :male
        expect(daughter).to be_invalid
      end
    end
  end

  describe '#say_something' do
    let!(:father)   { create(:father) }
    let!(:sophie)   { create(:daughter, father: father) }
    let(:greeting) { "Hello, I am your daughter." }

    it 'returns the greeting of daughter' do
      expect(father.daughters.first.say_something).to eq greeting
    end
  end
end
