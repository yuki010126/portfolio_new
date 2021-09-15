class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :discussion
  validates :customer_id, uniqueness: { scope: :discussion_id }
end
