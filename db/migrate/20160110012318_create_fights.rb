class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.string :participant_1
      t.string :participant_2
      t.integer :victor

      t.timestamps null: false
    end
  end
end
