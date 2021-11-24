class AddGenderAndGameIdAndNickname < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :gender, :string
    add_column :users, :game_id, :string
    add_index :users, :nickname, unique: true
  end
end
