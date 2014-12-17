class LanguageProf < ActiveRecord::Base
  has_many :users
  has_many :languages
end
