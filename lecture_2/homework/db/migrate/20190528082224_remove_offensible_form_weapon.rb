# frozen_string_literal: true

class RemoveOffensibleFormWeapon < ActiveRecord::Migration[5.2]
  def change
    remove_reference :weapons, :offensible, polymorphic: true
  end
end
