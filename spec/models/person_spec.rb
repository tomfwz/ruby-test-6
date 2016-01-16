require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :dob }
    it { is_expected.to enumerize(:type).in(:Father, :Mother, :Son, :Daughter) }
  end  

  describe '#age' do
    let(:john) { build(:person, dob: 20.years.ago) }

    it 'returns the age of person from his birthday' do
      expect(john.age).to eq 20 
    end
  end 

  describe 'father' do
    let!(:father) { create(:father) }
    let(:tom)     { create(:son, father: father) }

    it 'returns father' do
      expect(tom.father).to eq father
    end
  end

  describe 'mother' do
    let!(:mother) { create(:mother) }
    let(:tom)     { create(:son, mother: mother) }

    it 'returns mother' do
      expect(tom.mother).to eq mother
    end
  end
end
