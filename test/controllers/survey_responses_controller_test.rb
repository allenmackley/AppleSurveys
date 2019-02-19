require 'test_helper'

class SurveyResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should GET nested survey index url" do 
    get survey_survey_responses_url(surveys(:newton))
    assert_response :success
  end
  test "should raise error on GET nested new survey response url" do
    assert_raises(AbstractController::ActionNotFound) do
      get new_survey_survey_response_url(surveys(:newton))
    end
  end
  test "should raise error on GET missing response for nested edit survey response url" do 
    assert_raises(AbstractController::ActionNotFound) do
      get edit_survey_survey_response_url(surveys(:newton), survey_responses(:response1))
    end
  end
  test "should GET nested survey response url" do
    get survey_survey_response_url(surveys(:newton), survey_responses(:response1))
    assert_response :success
  end

  test "should POST to survey_responses create" do
    post survey_survey_responses_url(surveys(:newton)), params: {
      survey_response: {
        answer: 'YES'
      }
    }
    assert_response :redirect
  end
  test "should not allow PATCH to undefined survey_responses update" do
    assert_raises(AbstractController::ActionNotFound) do
      patch survey_survey_response_url(surveys(:newton), survey_responses(:response1)), params: {
        survey_response: {
          answer: 'NO'
        }
      }
    end
  end
  test "should not allow PUT to undefined survey_responses update" do
    assert_raises(AbstractController::ActionNotFound) do
      put survey_survey_response_url(surveys(:newton), survey_responses(:response1)), params: {
        survey_response: {
          answer: 'NO'
        }
      }
    end
  end
  test "should not allow DELETE to undefined survey_responses destroy" do
    assert_raises(AbstractController::ActionNotFound) do
      delete survey_survey_response_url(surveys(:newton), survey_responses(:response1))
    end
  end
end
