class CreateLangProfReqs < ActiveRecord::Migration
  def change
    create_table :lang_prof_reqs do |t|

      t.integer :position_id
      t.integer :language_id
      t.integer :prof_category_id

      t.timestamps
    end
  end
end
