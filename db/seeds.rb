# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(
  name_first: "Allen", 
  name_last: "Mackley", 
  email: "allenmackley@gmail.com"
)
user2 = User.create(
  name_first: "John",
  name_last: "Doe",
  email: "john_doe@example.com"
)
user3 = User.create(
  name_first: "Test",
  name_last: "User",
  email: "test_user@example.com"
)
survey1 = Survey.create(
  user_id: user1.id,
  name: "Newton", 
  question: "Does the moon rotate around the earth by the same force that an apple falls from a tree?"
)
Survey.create(
  user_id: user1.id,
  name: "Math", 
  question: "Does 1 + 1 equal 2?"
)
SurveyResponse.create(
  user_id: user1.id,
  survey_id: survey1.id,
  answer: 1
)