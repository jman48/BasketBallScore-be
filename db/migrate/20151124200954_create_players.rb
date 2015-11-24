class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :game, index: true
      t.belongs_to :user, index: true
      t.integer :score
    end
  end
end
