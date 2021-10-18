class Chat < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :kind_relations
  has_many :kinds, through: :kind_relations

  validates :title, presence: true
  validates :nickname, presence: true
  # validates :content, presence: true

  def self.search(keyword)
    where(["title like? OR introduction like? OR nickname like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer).exists?
  end

  def self.kind
    chat.where(kind_id: @kind )
  end

end
