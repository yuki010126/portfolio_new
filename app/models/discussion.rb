class Discussion < ApplicationRecord
  belongs_to :customer
  has_many :opinions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def self.search(keyword)
  where(["title like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
