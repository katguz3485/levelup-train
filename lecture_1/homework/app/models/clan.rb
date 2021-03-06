# frozen_string_literal: true

class Clan < ApplicationRecord
  has_many :samurais, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
end
