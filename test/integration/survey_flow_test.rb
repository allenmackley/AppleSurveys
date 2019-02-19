require 'test_helper'

class SurveyFlowTest < ActionDispatch::IntegrationTest
  test "can see the home page" do
    get "/"
    assert_select "h1", {count: 1, text: "Apple Surveys"}
  end
  test "home page has Create New Survey button" do
    get "/"
    assert_select "a", {count: 1, text: "Create New Survey"}
  end
  test "can create a new survey" do 
    get new_survey_url
    assert_response :success
    name = "Mars"
    question = "Will mankind go to Mars by 2030?"
    post surveys_url, params: { 
      survey: {
        name: name, 
        question: question 
      } 
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "a", {count: 1 , text: name}
    assert_select "td", {count: 1, text: question}
  end
  test "can edit a survey" do
    newton = surveys(:newton)  
    get edit_survey_url(newton)
    assert_response :success
    name = "Modified Survey Name"
    question = "Modified Question"
    patch survey_url(newton), params: {
      survey: {
        name: name,
        question: question
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "a", {count: 1 , text: name}
    assert_select "td", {count: 1, text: question}
  end
  test "can view a survey and submit a response" do
    newton = surveys(:newton) 
    get survey_url(newton)
    assert_response :success
    post survey_survey_responses_url(newton), params: {
      survey_response: {
        answer: 'YES'
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "You answered: Yes"

    get root_url
    assert_response :success
    assert_select "a", {count: 1, text: "75%"}

    get survey_url(newton)
    assert_response :success
    post survey_survey_responses_url(newton), params: {
      survey_response: {
        answer: 'NO'
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "You answered: No"

    get root_url
    assert_response :success
    assert_select "a", {count: 1, text: "40%"}
  end
  test "can delete a survey" do
    newton = surveys(:newton) 
    get edit_survey_url(newton)
    assert_response :success

    delete survey_url(newton)
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", {count: 1, text: "Apple Surveys"}
    assert_select "a", {count: 0, text: newton.name}
    assert_select "td", {count: 0, text: newton.question}
  end
  test "can view a list of survey responses" do 
    newton = surveys(:newton) 
    get survey_survey_responses_url(newton)
    assert_response :success
    assert_select "td", "John Doe"
    assert_select "td", "Yes"
  end
end
