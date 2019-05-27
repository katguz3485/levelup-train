class AddOffensibleToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :offensible, polymorphic: true
  end
end
