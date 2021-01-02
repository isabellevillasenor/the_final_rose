require 'rails_helper'

describe 'Outing Show Spec' do
  before :each do
    @arwen = Bachelorette.create!(name: 'Arwen', season_number: 1, season_description: 'Losing Immortality')
    @aragorn = @arwen.contestants.create!(name: 'Aragorn', age: 25, hometown: 'Gondor')
    @lego = @arwen.contestants.create!(name: 'Legolas', age: 2931, hometown: 'Northern Mirkwood')
    @mush = Outing.create!(name: 'Mushroom Foraging', location: 'The Shire', date: '3018-10-02')
    ContestantOuting.create!(contestant: @lego, outing: @mush)
    ContestantOuting.create!(contestant: @aragorn, outing: @mush)
    visit outing_path(@mush)
  end

  it 'should display outing names locations and dates' do
    expect(page).to have_content(@mush.name)

    expect(page).to have_content('Location: ')
    expect(page).to have_content(@mush.location)
    expect(@mush.location).to eq('The Shire')

    expect(page).to have_content('Date: ')
    expect(page).to have_content(@mush.date)
  end

  it 'should display a count of contestants and their names' do
    expect(page).to have_content('Count of Contestants: ')
    expect(page).to have_content(@mush.cont_count)
    expect(@mush.cont_count).to eq(2)

    expect(page).to have_content('Contestants: ')
    expect(page).to have_content(@mush.contestants.name)
  end
end
