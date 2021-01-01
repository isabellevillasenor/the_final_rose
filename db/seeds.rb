Bachelorette.destroy_all
Contestant.destroy_all

@arwen = Bachelorette.create!(name: 'Arwen', season_number: 1, season_description: 'Losing Immortality')
@gala = Bachelorette.create!(name: 'Galadriel', season_number: 2, season_description: 'Love Through the Millennium')

@aragorn = @arwen.contestants.create!(name: 'Aragorn', age: 25, hometown: 'Gondor')
@lego = @arwen.contestants.create!(name: 'Legolas', age: 2931, hometown: 'Northern Mirkwood')
@gand = @gala.contestants.create!(name: 'Gandalf', age: 2019, hometown: 'Valinor')
@celeborn = @gala.contestants.create!(name: 'Celeborn', age: 1987, hometown: 'Doriath')