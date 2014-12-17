class CreateLanguageProfs < ActiveRecord::Migration
  def change
    create_table :language_profs do |t|
      
      t.integer :user_id
      t.integer :language_id
      t.integer :language_proficiency

      t.timestamps
    end
  end
end
