class CreateCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :careers do |t|

      t.text       :worthwhile
      t.text       :ideal_candidate
      t.text       :can_do_now
      t.text       :recommended_book
      t.references :user
      t.timestamps
    end
  end
end
