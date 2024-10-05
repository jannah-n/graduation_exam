class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :correct_image
      t.string :incorrect_image
      t.string :correct_choice

      t.timestamps
    end
  end
end
