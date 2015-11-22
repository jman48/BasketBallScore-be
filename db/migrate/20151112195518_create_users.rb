class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps null: false
      t.integer :totalHoops
      t.integer :highestStreak
      t.integer :shootoutsWon
    end
  end
end
