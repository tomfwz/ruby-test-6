require 'rails_helper'

RSpec.describe Daughter, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female) }
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
