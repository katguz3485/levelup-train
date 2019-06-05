# frozen_string_literal: true

class AddKindColumnToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :kind, :integer, null: false, default: 0
  end
end
