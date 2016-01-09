class Combatant < ActiveRecord::Base
  belongs_to :dojo

  validates :name, presence: true,
                    uniqueness: { scope: :dojo_id }
  validates :race, presence: true
  validates :strength, presence: true,
                      inclusion: { in: (0..15) }
  validates :intelligence, presence: true,
                      inclusion: { in: (0..15) }
  validates :dexterity, presence: true,
                      inclusion: { in: (0..15) }
  validates :hp, presence: true



  def to_param
    "#{name.capitalize.gsub(" ","***")}" if name
  end
end
