class Hashtagpost < ApplicationRecord
  belongs_to :discussion
  belongs_to :Hashtag
  validates  :discussion_id, presence: true
  validates  :Hashtag_id,   presence: true
end


# 今後実装予定　ハッシュタグ