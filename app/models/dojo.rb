class Dojo < ActiveRecord::Base
  has_secure_password
  has_many :combatants
  has_many :winning_fights, :class_name => "Fight", :foreign_key => "winning_dojo_id"
  has_many :losing_fights, :class_name => "Fight", :foreign_key => "losing_dojo_id"

  validates :dojo_name, presence: true,
                        uniqueness: true
  validates :password, presence: true

  enum role: ["default", "combat_federation"]
end
