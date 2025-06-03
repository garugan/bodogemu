class AddPlaytimeAndPlayerToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :playtime, :string
    add_column :games, :player, :string
  end
end
