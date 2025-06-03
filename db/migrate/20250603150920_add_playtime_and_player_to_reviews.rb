class AddPlaytimeAndPlayerToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :playtime, :integer
    add_column :reviews, :player, :integer
  end
end
