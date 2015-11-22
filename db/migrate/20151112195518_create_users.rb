class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps null: false
      t.integer :total_hoops
      t.integer :highest_streak
      t.integer :shootouts_won
    end
  end
end
