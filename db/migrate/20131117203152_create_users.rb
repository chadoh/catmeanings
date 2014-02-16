class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.uuid :auth_token
      t.uuid :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :auth_token
    add_index :users, :password_reset_token
  end
end
