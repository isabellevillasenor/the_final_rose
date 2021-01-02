class Bachelorette <ApplicationRecord
  has_many :contestants, dependent: :destroy
  validates_presence_of :name, :season_description
  validates :season_number, numericality: { greater_than: 0 }

  def avg_cont_age
    contestants.average(:age)
  end
end
