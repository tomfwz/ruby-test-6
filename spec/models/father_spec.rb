require 'rails_helper'

RSpec.describe Father, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end  
  
  describe '#father' do
    let!(:father) { create(:person, type: 'Father') }
    let(:tom) { create(:person, father: father) }

    it 'returns father' do
      expect(tom.father).to eq father
    end
  end
end
