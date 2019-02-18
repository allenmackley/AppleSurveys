class ApplicationController < ActionController::Base
  before_action :setup_user

  def setup_user 
    @user = User.find(3)
  end
end
