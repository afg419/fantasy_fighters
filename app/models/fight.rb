class Fight < ActiveRecord::Base
  belongs_to :winning_dojo, :class_name => "Dojo"
  belongs_to :losing_dojo, :class_name => "Dojo"

  belongs_to :winning_combatant, :class_name => "Combatant"
  belongs_to :losing_combatant, :class_name => "Combatant"
end
