class Chat < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :kind_relations
  has_many :kinds, through: :kind_relations

  validates :title, presence: true
  validates :nickname, presence: true
  validates :introduction, presence: true

  def self.search(keyword)
    where(["title like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer).exists?
  end

  def self.kind
    chat.where(kind_id: @kind )
  end


  # validates :title, presence: true, length: { in: 4..127 }
  # validates :nickname, presence: true, length: { in: 1..30 }
end
