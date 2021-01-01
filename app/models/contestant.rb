class Contestant <ApplicationRecord
  belongs_to :bachelorette
  validates_presence_of :name, :hometown
  validates :age, numericality: { greater_than: 0 }
end
