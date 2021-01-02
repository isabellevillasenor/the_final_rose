Bachelorette.destroy_all
Contestant.destroy_all
Outing.destroy_all
ContestantOuting.destroy_all

@arwen = Bachelorette.create!(name: 'Arwen', season_number: 1, season_description: 'Losing Immortality')
@gala = Bachelorette.create!(name: 'Galadriel', season_number: 2, season_description: 'Love Through the Millennium')

@aragorn = @arwen.contestants.create!(name: 'Aragorn', age: 25, hometown: 'Gondor')
@lego = @arwen.contestants.create!(name: 'Legolas', age: 2931, hometown: 'Northern Mirkwood')
@gand = @gala.contestants.create!(name: 'Gandalf', age: 2019, hometown: 'Valinor')
@celeborn = @gala.contestants.create!(name: 'Celeborn', age: 1987, hometown: 'Doriath')

@ride = Outing.create!(name: 'Horseback Riding', location: 'Rivendell', date: '3018-9-04')
@mush = Outing.create!(name: 'Mushroom Foraging', location: 'The Shire', date: '3018-10-02')
@volcano = Outing.create!(name: 'Throw Rings In Volcano', location: 'Mordor', date: '3018-9-14')
@drinks = Outing.create!(name: 'Drinks at Prancing Pony', location: 'Bree', date: '3018-08-28')

ContestantOuting.create!(contestant: @aragorn, outing: @ride)
ContestantOuting.create!(contestant: @lego, outing: @ride)
ContestantOuting.create!(contestant: @gand, outing: @mush)
ContestantOuting.create!(contestant: @aragorn, outing: @mush)
ContestantOuting.create!(contestant: @aragorn, outing: @drinks)
ContestantOuting.create!(contestant: @lego, outing: @drinks)
ContestantOuting.create!(contestant: @gand, outing: @volcano)
ContestantOuting.create!(contestant: @celeborn, outing: @volcano)