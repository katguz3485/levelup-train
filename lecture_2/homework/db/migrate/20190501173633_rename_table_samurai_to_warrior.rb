class RenameTableSamuraiToWarrior < ActiveRecord::Migration[5.2]
  def change
    rename_table :samurais, :warriors
    add_column :warriors, :type, :string, null: false
  end
end
