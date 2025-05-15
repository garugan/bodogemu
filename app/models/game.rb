class Game < ApplicationRecord

  has_one_attached :game_image
  has_many :reviews, dependent: :destroy
  belongs_to :genre

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :genre_id, presence: true

  def get_game_image(width, height)
    unless game_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      game_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    game_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
