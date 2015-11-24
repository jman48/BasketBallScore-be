class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :hoopsToWin
    end
  end
end
