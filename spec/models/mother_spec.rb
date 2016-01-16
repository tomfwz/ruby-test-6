require 'rails_helper'

RSpec.describe Mother, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female) }
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
