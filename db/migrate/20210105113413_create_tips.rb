class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips do |t|

      t.string     :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
