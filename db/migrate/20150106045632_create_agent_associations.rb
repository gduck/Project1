class CreateAgentAssociations < ActiveRecord::Migration
  def change
    create_table :agent_associations do |t|
      # user needs to have .role == 'agent'
      t.integer :user_id, null: false
      t.integer :company_id, null: false
      t.string :permission, default: "edit"

      t.timestamps
    end
  end
end
