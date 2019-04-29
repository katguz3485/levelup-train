class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false, default: ""
      t.integer :shield_quality, null: false, default: 0
      t.integer :number_of_battles, null: false, default: 0
      t.date :join_date, null: false
      t.date :death_date, default: nil
      t.belongs_to :clan, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
