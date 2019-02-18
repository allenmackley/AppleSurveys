class CreateSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_responses do |t|
      t.references :survey, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
