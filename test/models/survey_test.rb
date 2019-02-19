require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "should not save survey without user id" do
    survey = Survey.new(name: "Test", question: "Test")
    assert_not survey.save
  end
  test "should not save survey without name" do
    survey = Survey.new(user: users(:allen), question: "Test")
    assert_not survey.save
  end
  test "should not save survey without question" do
    survey = Survey.new(user: users(:allen), name: "Test")
    assert_not survey.save
  end
  test "should save survey with data" do
    survey = Survey.new(
      user: users(:allen),
      name: "New Survey",
      question: "Is the sky blue?"
    )
    assert survey.save
  end
  test "'Newton' survey perc_yes should return 67 from fixture" do
    result = surveys(:newton).perc_yes
    assert_same(67, result)
  end
  test "'Newton survey perc_no should return 33 from fixture" do 
    result = surveys(:newton).perc_no
    assert_same(33, result)
  end
  test "New Survey instance should contain attrs for 'num_yes', 'num_no', and 'total'" do 
    newton = surveys(:newton)
    survey = Survey.find(newton.id)
    assert_same(2, survey.num_yes)
    assert_same(1, survey.num_no)
    assert_same(3, survey.total)
  end
  test "'Adding 'yes' vote to 'Newton' survey should result in 75% 'yes' and 25% 'no'" do
    newton = surveys(:newton)
    SurveyResponse.create(
      user: users(:allen),
      survey: newton,
      answer: 1
    )
    survey = Survey.find(newton.id)
    yes_result = survey.perc_yes
    no_result  = survey.perc_no
    assert_same(75, yes_result)
    assert_same(25, no_result)
  end
  test "'Adding 'no' vote to 'Newton' survey should result in 50% 'yes' and 50% 'no'" do
    newton = surveys(:newton)
    SurveyResponse.create(
      user: users(:allen),
      survey: newton,
      answer: 0
    )
    survey = Survey.find(newton.id)
    yes_result = survey.perc_yes
    no_result  = survey.perc_no
    assert_same(50, yes_result)
    assert_same(50, no_result)
  end
end 
