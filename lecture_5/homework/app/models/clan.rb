# frozen_string_literal: true

class Clan < ApplicationRecord
  has_many :warriors, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
end
