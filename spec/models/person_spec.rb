require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :dob }
    it { is_expected.to enumerize(:gender).in(:male, :female) }
    it { is_expected.to enumerize(:type).in(:Father, :Mother, :Son, :Daughter) }
  end  

  describe '#age' do
    let(:john) { build(:person, dob: 20.years.ago) }

    it 'returns the age of person from his birthday' do
      expect(john.age).to eq 20 
    end
  end 

  describe '#ensure_valid_age' do
    let!(:father) { build(:father) }
    let!(:mother) { build(:mother) }
    let!(:son)    { build(:son) }

    context 'valid' do
      it 'is a valid father' do
        father.dob = 20.years.ago
        expect(father).to be_valid
      end
    
      it 'is a valid mother' do
        mother.dob = 18.years.ago
        expect(mother).to be_valid
      end

      it 'is a valid son' do
        son.dob = 10.years.ago
        expect(son).to be_valid
      end
    end

    context 'invalid' do
      it 'is a invalid father' do
        father.dob = 19.years.ago
        expect(father).to be_invalid
      end
    
      it 'is a invalid mother' do
        mother.dob = 17.years.ago
        expect(mother).to be_invalid
      end

      it 'is a invalid son' do
        son.dob = Date.current + 1.years
        expect(son).to be_invalid
      end
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

  describe '#name' do
    let!(:james)     { create(:father, first_name: 'James', last_name: 'Fwz') }
    let(:james_name) { "James Fwz" }

    it 'returns the name of person' do
      expect(james.name).to eq james_name 
    end
  end

  describe '#older_than' do
    let!(:james)   { create(:father, dob: 30.years.ago ) }
    let!(:tom)     { create(:son, dob: 10.years.ago, father: james) }

    it 'returns the number of ages between 2 person' do
      expect(james.older_than(tom)).to eq 20 
    end
  end
end
