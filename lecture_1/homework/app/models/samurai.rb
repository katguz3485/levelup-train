class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, presence: true, length: {maximum: 100}
  validates :shield_quality, presence: true, numericality: {greater_than: 0, less_than: 1000}
  validates :number_of_battles, presence: true
  validates :join_date, presence: true

  scope :dead, -> {where('death_date is NOT_NULL')}
  scope :alive, -> {where('death_date is NULL')}

end
