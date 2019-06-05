# frozen_string_literal: true

class AddWarriorReferenceToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :warrior, foreign_key: true
  end
end
