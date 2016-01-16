require 'rails_helper'

RSpec.describe Father, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end  
  
  describe 'father' do
    let!(:father) { create(:father) }
    let(:tom)     { create(:son, father: father) }

    it 'returns father' do
      expect(tom.father).to eq father
    end
  end
end
