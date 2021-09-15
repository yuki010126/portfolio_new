class Chat < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search(keyword)
  where(["title like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end


  # validates :title, presence: true, length: { in: 4..127 }
  # validates :nickname, presence: true, length: { in: 1..30 }
end
