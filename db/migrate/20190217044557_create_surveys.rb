class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :question
      t.integer :num_yes
      t.integer :num_no

      t.timestamps
    end
  end
end
