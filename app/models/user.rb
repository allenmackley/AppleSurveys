class User < ApplicationRecord
  has_many :surveys
  has_many :survey_responses
  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :email, presence: true
end
