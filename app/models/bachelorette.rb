class Bachelorette <ApplicationRecord
  has_many :contestants
  validates_presence_of :name, :season_description
  validates :season_number, numericality: { greater_than: 0 }
end
