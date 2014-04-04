class CreateGuesses < ActiveRecord::Migration
  def change
      create_table :guesses do |t|
      t.integer :round_id
      t.integer :card_id
      t.string  :user_guess
      t.string  :correctness
    end
  end
end
