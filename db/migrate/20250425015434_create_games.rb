class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :body
      t.integer :genre_id
      t.timestamps
    end
  end
end
