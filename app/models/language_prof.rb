class LanguageProf < ActiveRecord::Base
  belongs_to :users
  belongs_to :languages
end
