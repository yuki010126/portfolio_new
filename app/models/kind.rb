class Kind < ApplicationRecord
  has_many :kind_relations
  has_many :chats, through: :kind_relations
end
