class Contact < ApplicationRecord


  validates :nickname, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :message, presence: true
end
