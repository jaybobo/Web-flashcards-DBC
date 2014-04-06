class AddPlayStatsToRound < ActiveRecord::Migration
  def up
    add_column :rounds, :cards_played, :integer, default: 0
    add_column :rounds, :cards_correct, :integer, default: 0
  end

  def down
    remove_column :rounds, :cards_played
    remove_column :rounds, :cards_correct
  end
end
