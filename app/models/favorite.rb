class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :chat
  validates :customer_id, uniqueness: { scope: :chat_id }
end

