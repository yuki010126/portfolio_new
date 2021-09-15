class Favorite < ApplicationRecord
  belongs_to :customer   # ユーザー/お気に入り → 1:多
# 　belongs_to :discussion   # 記事/お気に入り    → 1:多
　belongs_to :chat
  # validates_uniqueness_of :chat_id, scope: :customer_id
end

