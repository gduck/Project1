class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_language, null: false, default: "English"

      #t.integer :language_id

      # t.integer :work_preferences
      t.string :text_area
      # check how many characters can store here
      t.text :file_ref

      t.timestamps
    end
  end
end
