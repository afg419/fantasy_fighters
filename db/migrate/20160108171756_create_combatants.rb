class CreateCombatants < ActiveRecord::Migration
  def change
    create_table :combatants do |t|
      t.string :name
      t.string :race
      t.integer :strength
      t.integer :dexterity
      t.integer :intelligence
      t.integer :hp
      t.integer :matches, default: 0
      t.integer :wins, default: 0

      t.timestamps null: false
    end
  end
end
