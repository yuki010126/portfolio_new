class Comment < ApplicationRecord
  belongs_to :chat
  belongs_to :customer
end
