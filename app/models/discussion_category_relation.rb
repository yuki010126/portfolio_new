class DiscussionCategoryRelation < ApplicationRecord
  belongs_to :discussion
  belongs_to :category
end
