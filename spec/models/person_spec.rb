require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :dob }
    it { is_expected.to enumerize(:gender).in(:male, :female) }
    it { is_expected.to enumerize(:type).in(:father, :mother, :son, :daughter) }
  end  

  describe '#age' do
    let(:john) { build(:person, dob: 20.years.ago) }

    it 'returns the age of person from his birthday' do
      expect(john.age).to eq 20 
    end
  end 
end
