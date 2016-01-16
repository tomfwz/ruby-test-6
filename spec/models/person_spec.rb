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
  
  describe '#parents' do
    let!(:father) { create(:father) }
    let!(:mother) { create(:mother) }
    let(:tom)     { create(:son, mother: mother, father: father) }

    it 'returns parent' do
      expect(tom.parent).to eq [mother, father]
    end
  end

  describe '#sons' do
    let!(:lily)   { create(:mother) }
    let(:tom)     { create(:son, mother: lily) }
    let(:wayne)   { create(:son, mother: lily) }

    it 'returns parent' do
      expect(lily.sons).to eq [tom, wayne]
    end

  end
end
