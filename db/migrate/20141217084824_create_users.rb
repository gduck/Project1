class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      #t.integer :first_language, null: false, default: 1
      t.string :address_area

      # t.integer :work_preferences
      t.string :text_area
      # check how many characters can store here
      t.text :file_ref

      t.timestamps
    end
  end
end
