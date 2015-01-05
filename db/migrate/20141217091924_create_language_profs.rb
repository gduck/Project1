class CreateLanguageProfs < ActiveRecord::Migration
  def change
    create_table :language_profs do |t|
      
      t.integer :user_id, null: false
      t.integer :language_id, null: false
      t.integer :prof_category_id, null: false
      #t.boolean :boolean, { default: false }

      t.timestamps
    end
  end
end
