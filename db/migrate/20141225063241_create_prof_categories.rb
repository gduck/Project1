class CreateProfCategories < ActiveRecord::Migration
  def change
    create_table :prof_categories do |t|

      t.string :prof_name

      t.timestamps
    end
  end
end
