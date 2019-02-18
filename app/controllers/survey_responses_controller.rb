class SurveyResponsesController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
  end
  
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
      safe_params = params.require(:survey_response).permit(:answer)
      safe_params[:answer]  = text_to_bool safe_params[:answer]
      safe_params[:user_id] = @user.id
      safe_params
    end
end
