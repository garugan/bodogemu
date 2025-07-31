class Review < ApplicationRecord
  has_many :review_comments, dependent: :destroy
  belongs_to :user
  belongs_to :game

  validates :title, presence: true
  validates :body, presence: true
  validates :playtime, presence: true
  validates :player, presence: true
  validates :rating, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Review.where(title: content)
    elsif method == 'forward'
      Review.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Review.where('title LIKE ?', '%' + content)
    else
      Review.where('title LIKE ?', '%' + content + '%')
    end
  end
end
