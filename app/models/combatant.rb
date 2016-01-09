class Combatant < ActiveRecord::Base
  belongs_to :dojo

  def to_param
    "#{name.capitalize.gsub(" ","***")}" if name
  end
end
