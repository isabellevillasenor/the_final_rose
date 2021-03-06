class Outing < ApplicationRecord
  has_many :contestant_outings, dependent: :destroy
  has_many :contestants, through: :contestant_outings
  validates_presence_of :name, :location, :date

  def cont_count
    contestants.count
  end
end