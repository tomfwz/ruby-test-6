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

    it 'returns sons' do
      expect(lily.sons).to eq [tom, wayne]
    end
  end

  describe '#child' do
    let(:lily)    { create(:mother) }
    let(:anna)    { create(:mother) }
    let(:tom)     { create(:son, mother: lily) }
    let(:wayne)   { create(:son, mother: lily) }
    let(:sophie)  { create(:daughter, mother: lily) }
    let(:joan)    { create(:daughter, mother: anna) }

    it 'returns child' do
      expect(lily.child).to eq [tom, wayne, sophie]
      expect(lily.child).to_not include joan
      expect(anna.child).to eq [joan]
    end
  end

  describe '#daughters' do
    let(:lily)    { create(:mother) }
    let(:tom)     { create(:son, mother: lily) }
    let(:wayne)   { create(:son, mother: lily) }
    let(:sophie)  { create(:daughter, mother: lily) }
    let(:joan)    { create(:daughter, mother: lily) }

    it 'returns child' do
      expect(lily.daughters).to eq [sophie, joan]
      expect(lily.daughters).to_not include [tom, wayne]
    end
  end
  
  describe '#brothers' do
    let!(:lily)   { create(:mother) }
    let(:tom)     { create(:son, mother: lily) }
    let(:wayne)   { create(:son, mother: lily) }

    it 'returns brothers' do
      expect(tom.brothers).to eq [wayne]
      expect(wayne.brothers).to eq [tom]
    end
  end

  describe '#father_of?' do
    let!(:james)  { create(:father) }
    let!(:men)    { create(:father) }
    let(:tom)     { create(:son, father: james) }
    let(:wayne)   { create(:son, father: men) }

    it 'returns brothers' do
      expect(james.father_of?(tom)).to be true
      expect(james.father_of?(wayne)).to be false
    end
  end
end
