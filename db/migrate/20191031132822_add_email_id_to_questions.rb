class AddEmailIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :email_id, :string
  end
end
