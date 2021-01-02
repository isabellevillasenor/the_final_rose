require 'rails_helper'

describe 'Bachelorette Contestants Index' do
  before :each do 
    @gala = Bachelorette.create!(name: 'Galadriel', season_number: 2, season_description: 'Love Through the Millennium')
    @gand = @gala.contestants.create!(name: 'Gandalf', age: 2019, hometown: 'Valinor')
    @cele = @gala.contestants.create!(name: 'Celeborn', age: 1987, hometown: 'Doriath')
    visit bachelorette_contestants_path(@gala)
  end

  it 'should have only the associated contestants name age and hometown' do
    expect(page).to have_content("#{@gala.name}s Contestants")
    expect(page).to have_content('Name: ')
    expect(page).to have_content(@gand.name)
    expect(@gand.name).to eq('Gandalf')
    expect(page).to have_content(@cele.name)
    expect(@cele.name).to eq('Celeborn')

    expect(page).to have_content('Age')
    expect(page).to have_content(@gand.age)
    expect(@gand.age).to eq(2019)
    expect(page).to have_content(@cele.age)
    expect(@cele.age).to eq(1987)

    expect(page).to have_content('Hometown')
    expect(page).to have_content(@gand.hometown)
    expect(@gand.hometown).to eq('Valinor')
    expect(page).to have_content(@cele.hometown)
    expect(@cele.hometown).to eq('Doriath')
  end

  it 'should have a link on each contestant name to their show page' do
    expect(page).to have_link("#{@gand.name}")
    click_link("#{@gand.name}")

    expect(current_path).to eq(contestant_path(@gand))
  end
end