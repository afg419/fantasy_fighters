class Dojo < ActiveRecord::Base
  has_secure_password
  has_many :combatants

  validates :dojo_name, presence: true,
                        uniqueness: true
  validates :password, presence: true

  enum role: ["default", "combat_federation"]
end
