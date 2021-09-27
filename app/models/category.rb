class Category < ApplicationRecord
  has_many :discussion_category_relations
  has_many :discussions, through: :discussion_category_relations
end
