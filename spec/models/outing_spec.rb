require 'rails_helper'

describe Outing do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:date) }
  end

  describe 'relationships' do
    it { should have_many(:contestant_outings) }
    it { should have_many(:contestants).through(:contestant_outings) }
  end
end