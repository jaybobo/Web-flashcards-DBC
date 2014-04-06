class AddTimestampsToDecks < ActiveRecord::Migration
  def change
    add_timestamps(:decks)
    add_timestamps(:rounds)
    add_timestamps(:guesses)
  end
end
