# frozen_string_literal: true

class AddMissingNullValues < ActiveRecord::Migration[5.2]
  def change
    change_column_null :mercenaries, :name, false
    change_column_null :mercenaries, :experience, false
    change_column_null :mercenaries, :preferred_weapon_kind, false
    change_column_null :mercenaries, :available_from, false
    change_column_null :mercenaries, :price, false
    change_column_null :weapons, :range, false
    change_column_null :weapons, :damage, false
    change_column_null :weapons, :kind, false
    change_column_null :buildings, :name, false
  end
end
