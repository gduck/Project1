class RemoveFirstLanguageFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first_language
  end
end
