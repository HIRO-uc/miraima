class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|

      t.string     :title
      t.text       :text
      t.integer    :user_type_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
