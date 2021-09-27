class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:99}
  has_many :hashtag_post_images, dependent: :destroy
  has_many :discussions, through: :hashtagpost
end

