require 'rails_helper'

describe 'Bachelorette Show Page' do
  before :each do
    @gala = Bachelorette.create!(name: 'Galadriel', season_number: 2, season_description: 'Love Through the Millennium')
    @gand = @gala.contestants.create!(name: 'Gandalf', age: 2019, hometown: 'Valinor')
    @celeborn = @gala.contestants.create!(name: 'Celeborn', age: 1987, hometown: 'Doriath')
    visit bachelorette_path(@gala)
  end

  it 'should display bachelorette name, season number and season description' do
    expect(page).to have_content('Bachelorette')
    expect(page).to have_content('Name: ')
    expect(page).to have_content(@gala.name)

    expect(page).to have_content('Season: ')
    expect(page).to have_content(@gala.season_number)

    expect(page).to have_content('Season Description: ')
    expect(page).to have_content(@gala.season_description)
  end

  it 'should have a link to associated contestants index' do
    expect(page).to have_link('See Contestants')
    click_link 'See Contestants'
  
    expect(current_path).to eq(bachelorette_contestants_path(@gala))
  end

  it 'should display the average age of all contestants' do
    expect(page).to have_content('Average Age of Contestants: ')
    expect(page).to have_content(@gala.avg_cont_age)
    expect(@gala.avg_cont_age).to eq(2003)
  end
end