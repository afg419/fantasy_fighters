class AddDojoRefToCombatants < ActiveRecord::Migration
  def change
    add_reference :combatants, :dojo, index: true, foreign_key: true
  end
end
