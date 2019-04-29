class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false, default: ""
      t.integer :shield_quality, null: false, default: 0
      t.integer :number_of_battles, null: false, default: 0
      t.date :join_date
      t.date :death_date
      t.belongs_to :clan, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end

#   - Samuraje posiadają swoje imię, jakość używanego pancerza(0..1000), liczbę stoczonych bitew, datę dołączenia i datę śmierci (null oznacza, że nadal jest żywy).
end
