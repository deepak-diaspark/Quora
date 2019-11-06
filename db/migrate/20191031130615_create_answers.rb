class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :answer
      t.string :answered_by
      t.integer :question_id

      t.timestamps
    end
  end
end
