require 'rails_helper'

describe 'Contestant Show Page' do
  before :each do 
    @gala = Bachelorette.create!(name: 'Galadriel', season_number: 2, season_description: 'Love Through the Millennium')
    @gand = @gala.contestants.create!(name: 'Gandalf', age: 2019, hometown: 'Valinor')
    @cele = @gala.contestants.create!(name: 'Celeborn', age: 1987, hometown: 'Doriath')
    @volcano = Outing.create!(name: 'Throw Rings In Volcano', location: 'Mordor', date: '3018-9-14')
    ContestantOuting.create!(contestant: @gand, outing: @volcano)
    ContestantOuting.create!(contestant: @cele, outing: @volcano)
    visit contestant_path(@gand)
  end

  it 'should have their name season number and description' do
    expect(page).to have_content(@gand.name)
    expect(@gand.name).to eq('Gandalf')

    expect(page).to have_content('Season ')
    expect(page).to have_content(@gand.bachelorette.season_number)
    expect(@gand.bachelorette.season_number).to eq(2)

    expect(page).to have_content(@gand.bachelorette.season_description)
    expect(@gand.bachelorette.season_description).to eq('Love Through the Millennium')
  end

  it 'should see all the outings that they went on' do
    expect(page).to have_content("Outings #{@gand.name} Went On")
    expect(page).to have_content(@gand.outings.name)
  end

  it 'should have links to outings show pages via outing name' do
    click_link 

    expect(current_path).to eq(outing_path(@volcano))
  end
end




