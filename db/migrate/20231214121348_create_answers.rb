class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :customer_id, null: false
      t.integer :question_id, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
