class SurveysController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.new(survey_params)
 
    if @survey.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @survey = Survey.find(params[:id])
   
    if @survey.update(survey_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
   
    redirect_to root_path
  end

  private
    def survey_params
      safe_params = params.require(:survey).permit(:name, :question)
      safe_params[:user_id] = @user.id
      safe_params
    end
end
