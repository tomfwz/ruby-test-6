require 'rails_helper'

RSpec.describe Father, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end  

  describe '#say_something' do
    let(:father)   { create(:father) }
    let(:tom)      { create(:son, father: father) }
    let(:greeting) { "Hello, I am your father" }

    it 'returns the greeting of father' do
      expect(tom.father.say_something).to eq greeting
    end
  end
end
