class Kind < ApplicationRecord
  has_many :chat_kind_relations
  has_many :chats, through: :chat_kind_relations
end
