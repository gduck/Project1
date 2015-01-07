class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :address_area
      t.string :website
      t.text :logo_file

      t.timestamps
    end
  end
end
