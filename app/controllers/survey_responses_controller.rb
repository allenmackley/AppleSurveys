class SurveyResponsesController < ApplicationController
  def show
    @survey_response = SurveyResponse.find(params[:id])
  end
  
  def create
    @survey = Survey.find(params[:survey_id])
    @survey_response = @survey.survey_responses.create(survey_response_params)
    redirect_to survey_survey_response_path(@survey, @survey_response)
  end
 
  private
    def text_to_bool text_answer
      text_answer === 'YES' ? 1 : 0
    end
    def survey_response_params
      allowed_params = params.require(:survey_response).permit(:answer)
      allowed_params[:answer] = text_to_bool allowed_params[:answer]
      allowed_params
    end
end
