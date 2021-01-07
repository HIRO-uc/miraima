class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|

      t.text       :self_introduction
      t.text       :website
      t.references :user
      t.timestamps
    end
  end
end
