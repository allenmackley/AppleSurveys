require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should GET surveys index url" do
    get surveys_url
    # should test redirect to root path
    assert_response :redirect
  end
  test "should GET survey url" do
    get survey_url(surveys(:newton))
    assert_response :success
  end
  test "should GET new survey url" do
    get new_survey_url
    assert_response :success
  end
  test "should GET edit survey url" do
    get edit_survey_url(surveys(:newton))
    assert_response :success
  end

  test "should POST to surveys create" do
    post surveys_url, params: {
      survey: {
        name: "New Survey",
        question: "New survey question"
      }
    }
    assert_response :redirect
  end
  test "should not redirect from POST to surveys create if data invalid" do
    post surveys_url, params: {
      survey: {
        name: ''
      }
    }
    assert_response :success
  end
  test "should PATCH to surveys update" do
    patch survey_url(surveys(:newton)), params: {
      survey: {
        name: "Modified Survey",
        question: "Modified survey question"
      }
    }
    assert_response :redirect
  end
  test "should not redirect from PATCH to surveys edit if data invalid" do
    patch survey_url(surveys(:newton)), params: {
      survey: {
        name: ''
      }
    }
    assert_response :success
  end
  test "should PUT to surveys update" do
    put survey_url(surveys(:newton)), params: {
      survey: {
        name: "Modified Survey",
        question: "Modified survey question"
      }
    }
    assert_response :redirect
  end
  test "should not redirect from PUT to surveys edit if data invalid" do
    put survey_url(surveys(:newton)), params: {
      survey: {
        name: ''
      }
    }
    assert_response :success
  end
  test "should DELETE to surveys destroy" do
    delete survey_url(surveys(:newton))
    assert_response :redirect
  end
end
