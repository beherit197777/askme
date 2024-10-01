class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, unique: true
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :avatar_url
      t.string :background_color

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
