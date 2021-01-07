class CreateCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :careers do |t|

      t.integer :occupation_id
      t.text    :profile
      t.text    :worthwhile
      t.text    :difficult_thing
      t.text    :ideal_candidate
      t.text    :can_do_now
      t.text    :recommended_book
      t.text    :other
      t.timestamps
    end
  end
end
