require 'test_helper'

class SurveyResponseTest < ActiveSupport::TestCase
  test "should not save survey response without user id" do
    survey = SurveyResponse.new(survey: surveys(:newton), answer: 1)
    assert_not survey.save
  end
  test "should not save survey response without survey id" do
    survey = SurveyResponse.new(user: users(:allen), answer: 1)
    assert_not survey.save
  end
  test "should not save survey response without answer" do
    survey = SurveyResponse.new(user: users(:allen), survey: surveys(:newton))
    assert_not survey.save
  end
  test "should save survey response with 'yes' answer" do
    survey = SurveyResponse.new(
      user: users(:allen),
      survey: surveys(:newton),
      answer: 1
    )
    assert survey.save
    assert_same(SurveyResponse.last.answer, 1)
  end
  test "should save survey response with 'no' answer" do
    survey = SurveyResponse.new(
      user: users(:allen),
      survey: surveys(:newton),
      answer: 0
    )
    assert survey.save
    assert_same(SurveyResponse.last.answer, 0)
  end
end
