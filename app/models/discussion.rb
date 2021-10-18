class Discussion < ApplicationRecord
  belongs_to :customer
  has_many :opinions, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # has_many :hashtagposts, dependent: :destroy
  # has_many :hashtags, through: :hashtagposts
  has_many :discussion_category_relations
  has_many :categories, through: :discussion_category_relations

  validates :title, presence: true
  validates :nickname, presence: true

  # validates :introduction, presence: true


  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def self.search(keyword)
    where(["title like? OR introduction like? OR nickname like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  
  def self.category
    Discussion.where(category_id: @category )
  end
end

