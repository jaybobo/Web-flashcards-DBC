class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string   :user_name
        t.string   :user_email
        t.string   :password_digest
      end
  end
end
