class AddOffensibleToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :offensible, polymorphic: true
  end
end
