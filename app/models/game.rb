class Game < ApplicationRecord

  has_one_attached :image
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

  def average_rating
    if has_attribute?(:avg_rating)
      avg_rating&.round(1)
    else
      reviews.average(:rating)&.round(1)
    end
  end

  def display_image
    image.attached? ? image : "no_image.png"
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Game.where(title: content)
    elsif method == 'forward'
      Game.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Game.where('title LIKE ?', '%' + content)
    else
      Game.where('title LIKE ?', '%' + content + '%')
    end
  end
end
