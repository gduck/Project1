class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :company_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
