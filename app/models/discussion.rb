class Discussion < ApplicationRecord
  belongs_to :customer
  has_many :opinions, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # has_many :hashtagposts, dependent: :destroy
  # has_many :hashtags, through: :hashtagposts
  has_many :discussion_category_relations
  has_many :categories, through: :discussion_category_relations

  # after_create do
  #   discussion = Discussion.find_by(id: self.id)
  #   hashtags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   hashtags.uniq.map do |hashtag|
  #     tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
  #     discussion.hashtags << tag
  #   end
  # end

  # before_update do
  #   discussion = Discussion.find_by(id: self.id)
  #   discussion.hashtags.clear
  #   hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   hashtags.uniq.map do |hashtag|
  #     tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
  #     discussion.hashtags << tag
  #   end
  # end

  # after_create do
  #   discussion = Discussion.find_by(id: id)
  #   # hashbodyに打ち込まれたハッシュタグを検出
  #   hashtags = introduction.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   hashtags.uniq.map do |hashtag|
  #     # ハッシュタグは先頭の#を外した上で保存
  #     tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
  #     discussion.hashtags << tag
  #   end
  # end

  # before_update do
  #   discussion = Discussion.find_by(id: id)
  #   discussion.hashtags.clear
  #   hashtags = introduction.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   hashtags.uniq.map do |hashtag|
  #     tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
  #     discussion.hashtags << tag
  #   end
  # end

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def self.search(keyword)
  where(["title like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def self.category
  Discussion.where(category_id: @category )
  end
end

