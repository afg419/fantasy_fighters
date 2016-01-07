class Dojo < ActiveRecord::Base
  has_secure_password

  validates :dojo_name, presence: true,
                        uniqueness: true
  validates :password, presence: true
end
