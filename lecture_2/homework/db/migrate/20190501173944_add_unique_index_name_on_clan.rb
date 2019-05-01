class AddUniqueIndexNameOnClan < ActiveRecord::Migration[5.2]
  def change
    add_index :clans, :name, unique: true, where: "name != ''"
  end
end
