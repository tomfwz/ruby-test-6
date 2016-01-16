require 'rails_helper'

RSpec.describe Father, type: :model do
  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end  
end
