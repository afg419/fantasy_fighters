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

  validate :attributes_total

  def attributes_total
    unless strength + intelligence + dexterity == 15
      errors.add(:invalid_attribute_total, "Total combatant skill must add to 15")
    end
  end


  def to_param
    "#{name.gsub(" ","-")}"
  end
end
