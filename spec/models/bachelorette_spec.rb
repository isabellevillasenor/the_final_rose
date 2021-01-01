require 'rails_helper'

describe Bachelorette do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:season_description) }
    it { should validate_numericality_of(:season_number).is_greater_than(0) }
  end

  describe 'relationships' do
    it {should have_many :contestants}
  end
end
