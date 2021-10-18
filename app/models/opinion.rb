class Opinion < ApplicationRecord
  belongs_to :discussion
  belongs_to :customer


  validates :nickname, presence: true
  # validates :content, presence: true
end
