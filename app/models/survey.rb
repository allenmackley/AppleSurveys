class Survey < ApplicationRecord
  has_many :survey_responses
  validates :name, presence: true
  validates :question, presence: true
  after_initialize :count_responses
  attr_accessor :num_yes, :num_no, :total 

  def count_responses
    @num_yes = survey_responses.where("answer = 1").count
    @num_no  = survey_responses.where("answer = 0").count
    @total   = num_yes + num_no
  end

  def perc_yes
    if num_yes != 0 and total != 0
      ((num_yes.to_f / total.to_f) * 100).round
    else 
      0
    end
  end

  def perc_no
    if num_no != 0 and total != 0
      ((num_no.to_f / total.to_f) * 100).round
    else 
      0
    end
  end
end
