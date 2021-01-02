class Contestant < ApplicationRecord
  has_many :contestant_outings, dependent: :destroy
  has_many :outings, through: :contestant_outings
  belongs_to :bachelorette, dependent: :destroy
  validates_presence_of :name, :hometown
  validates :age, numericality: { greater_than: 0 }
end
