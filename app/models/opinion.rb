class Opinion < ApplicationRecord
  belongs_to :discussion
  belongs_to :customer
end
