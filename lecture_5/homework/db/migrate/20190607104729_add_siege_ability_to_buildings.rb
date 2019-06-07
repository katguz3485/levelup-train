class AddSiegeAbilityToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :siege_ability, :integer, null: false, default: 0
  end
end
