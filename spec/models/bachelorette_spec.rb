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

  describe 'instance methods' do
    it '#avg_cont_age' do
      @gala = Bachelorette.create!(name: 'Galadriel', season_number: 2, season_description: 'Love Through the Millennium')
      @gand = @gala.contestants.create!(name: 'Gandalf', age: 2019, hometown: 'Valinor')
      @celeborn = @gala.contestants.create!(name: 'Celeborn', age: 1987, hometown: 'Doriath')

      expect(@gala.avg_cont_age).to eq(2003)
    end
  end
end
