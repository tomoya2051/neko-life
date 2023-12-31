class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :customer_id, null: false
      t.string :category, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
