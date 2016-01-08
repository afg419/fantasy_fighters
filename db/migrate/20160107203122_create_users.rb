class CreateUsers < ActiveRecord::Migration
  def change
    create_table :dojos do |t|
      t.string :dojo_name
      t.string :password_digest
      t.integer :wins, default: 0
      t.integer :matches, default: 0
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
