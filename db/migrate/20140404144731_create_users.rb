class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string   :user_name
        t.string   :user_email
        t.string   :password_digest
        t.integer   :total_cards_played
        t.integer   :total_cards_correct
      end
  end
end
