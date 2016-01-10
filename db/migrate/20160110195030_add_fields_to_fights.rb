class AddFieldsToFights < ActiveRecord::Migration
  def change
    add_column :fights, :winning_dojo_id, :integer
    add_column :fights, :losing_dojo_id, :integer
    add_column :fights, :winning_combatant_id, :integer
    add_column :fights, :losing_combatant_id, :integer
    remove_column :fights, :participant_1
    remove_column :fights, :participant_2
    remove_column :fights, :victor
  end
end
