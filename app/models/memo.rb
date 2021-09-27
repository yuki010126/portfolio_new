class Memo < ApplicationRecord
   belongs_to :customer

  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

  validates :title, presence: true
  validates :body, presence: true



end


