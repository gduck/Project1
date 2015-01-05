class AddPrimaryToLanguageProfs < ActiveRecord::Migration
  def change
    add_column :language_profs, :primary, :boolean
  end
end
