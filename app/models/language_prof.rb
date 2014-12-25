class LanguageProf < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :prof_category
end
