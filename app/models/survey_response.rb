class SurveyResponse < ApplicationRecord
  belongs_to :survey
  belongs_to :user
  validates :answer, presence: true
end
