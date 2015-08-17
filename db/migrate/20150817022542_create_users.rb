class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :provider, null: false
      t.integer :uid, null: false
      t.integer :session_token, null: false
      t.timestamps null: false
    end
  end
end
