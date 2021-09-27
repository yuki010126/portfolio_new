class Comment < ApplicationRecord
  belongs_to :chat
  belongs_to :customer
  
  validates :nickname, presence: true
  validates :content, presence: true
end
