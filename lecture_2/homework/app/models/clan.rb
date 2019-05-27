# frozen_string_literal: true

class Clan < ApplicationRecord
  has_many :warriors, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name
end
